#pragma header

uniform float iTime;
uniform float strength;
uniform float speed;
uniform float direction;
uniform float GlowFix; // use it for fix square recommended value 0.2 to 0.6

uniform float hue;
uniform float sat;
uniform float val;
uniform float opacity;

#define iResolution vec2(openfl_TextureSize)
#define iChannel0 bitmap

float rand(vec2 c) {
    return fract(sin(dot(c.xy, vec2(12.9898,78.233))) * 43758.5453);
}

vec2 rand2(vec2 st) {
    st = vec2(dot(st, vec2(127.1,311.7)),
              dot(st, vec2(269.5,183.3)));
    return -1.0 + 2.0 * fract(sin(st) * 43758.5453123);
}

float noise(vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);
    vec2 u = f*f*(3.0 - 2.0*f);
    return mix(
        mix(dot(rand2(i + vec2(0.0,0.0)), f - vec2(0.0,0.0)),
            dot(rand2(i + vec2(1.0,0.0)), f - vec2(1.0,0.0)), u.x),
        mix(dot(rand2(i + vec2(0.0,1.0)), f - vec2(0.0,1.0)),
            dot(rand2(i + vec2(1.0,1.0)), f - vec2(1.0,1.0)), u.x),
        u.y
    );
}

vec3 hsv2rgb(vec3 c) {
    vec4 K = vec4(1.0, 2.0/3.0, 1.0/3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

float circle(vec2 pos, float radius, float glow) {
    float sdf = length(pos);
    sdf = smoothstep(radius - 0.700, radius, sdf);
    float circles = 1.0 - smoothstep(0.0, 1.0, sdf * 10.280);
    
    glow = min(glow, GlowFix); 

    float glows = exp(-sdf * 4.496) * glow * (1.0 - circles);
    return circles + glows;
}

vec2 rotate(vec2 v, float angleDeg) {
    float a = radians(angleDeg);
    float c = cos(a);
    float s = sin(a);
    return vec2(v.x * c - v.y * s, v.x * s + v.y * c);
}

void main() {
    vec2 fragCoord = openfl_TextureCoordv * iResolution;
    vec2 st = (fragCoord - 0.5 * iResolution) / iResolution.y;
    st.y = -st.y;

    st *= 20.0;
    vec2 uv = st;

    float noisest = noise(vec2(uv.x - iTime * speed, uv.y - iTime * speed));
    uv += noisest * 0.13;

    vec2 move = vec2(noise(vec2(iTime * speed) * 0.2) * 6.0, -iTime * speed * 2.0);
    move = rotate(move, direction);
    uv += move;

    vec3 color = vec3(0.0);
    vec2 pos = fract(uv) - 0.5;
    vec2 id = floor(uv);

    vec3 daColor = hsv2rgb(vec3(hue, sat, val));

    for (int y = -1; y <= 1; y++) {
        for (int x = -1; x <= 1; x++) {
            vec2 neighbour = vec2(x, y);
            vec2 r2 = rand2(id + neighbour);
            float a = noise(r2 + iTime * speed * 2.8);
            vec2 offset = 0.5 * (sin(iTime * speed + r2 * 6.28)) * 2.2;
            float size = rand(id + neighbour) * 0.75 + a * 0.15;
            color += circle(pos - neighbour + offset, size, size * 1.4) / 0.6 * daColor;
        }
    }

    float xRange = 0.7 + strength - abs(2.0 * st.x) * 0.02;
    vec3 ambient = smoothstep(1.0, 0.0, st.y * 0.05 + 0.9) * daColor;
    color = max(ambient, color) * xRange;

    vec4 baseColor = flixel_texture2D(bitmap, openfl_TextureCoordv);

    vec3 blended = mix(baseColor.rgb, 1.0 - (1.0 - baseColor.rgb) * (1.0 - color), opacity);

    gl_FragColor = vec4(blended, 1.0);
}