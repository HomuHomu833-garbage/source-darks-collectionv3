#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
uniform float strength;
#define iChannel0 bitmap
#define texture flixel_texture2D

#define PI 3.14159265359

float sdVesica(vec2 p, float w, float h) {
    float d = 0.5 * (w * w - h * h) / h;
    p = abs(p);
    vec3 c = (w * p.y < d * (p.x - w)) ? vec3(0.0, w, 0.0) : vec3(-d, 0.0, d + h);
    return length(p - c.yx) - c.z;
}

vec2 rotate(vec2 p, float a) {
    float s = sin(a);
    float c = cos(a);
    return vec2(c * p.x - s * p.y, s * p.x + c * p.y);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) 
{
    vec2 uv = fragCoord.xy / iResolution.xy;

    float radius = (strength <= 1.0) ? 0.3 * strength : 0.3;

    vec2 tearUV = (uv - 0.5) * 2.0;

    if(strength > 1.0){
        float dz = 1.0 - (strength - 1.0) * 0.5;
        tearUV *= dz;
    }

    tearUV = rotate(tearUV, -PI / 4.0);
    float d = sdVesica(tearUV, 1.0, radius);

    float edgeSoftness = 0.001;
    float tearMask = smoothstep(edgeSoftness, 0.0, d);

    vec4 bitmapColor = texture(iChannel0, uv);

    vec3 color = bitmapColor.rgb * tearMask;

    float glow = smoothstep(0.1, 0.0, abs(d));
    vec3 glowColor = vec3(0.8, 0.4, 0.1);
    color += glow * glowColor;

    fragColor = vec4(color, bitmapColor.a);
}

void main() {
    mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}