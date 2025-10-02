#pragma header

uniform float iTime;
uniform float hueShift;
uniform float saturationBoost;
uniform float brightnessBoost;
uniform float strength;
uniform bool awesomeOutline;
uniform bool blendOverlay;

vec3 rgb2hsv(vec3 c) {
    vec4 K = vec4(0.0, -1.0/3.0, 2.0/3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));
    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c) {
    vec4 K = vec4(1.0, 2.0/3.0, 1.0/3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

vec3 blendOverlayFunc(vec3 base, vec3 blend) {
    return mix(
        2.0 * base * blend,
        1.0 - 2.0 * (1.0 - base) * (1.0 - blend),
        step(0.5, base)
    );
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);
    vec3 hsv = rgb2hsv(color.rgb);

    float h = hueShift;
    if (abs(hueShift - 1.1) < 0.01) {
        h = sin(iTime * 3.0) * 0.5 + 0.6;
    }

    hsv.x += h;
    hsv.x = fract(hsv.x);
    hsv.y = clamp(hsv.y + saturationBoost, 0.0, 1.0);
    hsv.z *= (1.0 + brightnessBoost);

    vec3 finalRGB = hsv2rgb(hsv);
    vec4 finalColor = mix(color, vec4(finalRGB, color.a), strength);

    if (awesomeOutline && finalColor.a <= 0.5) {
        vec2 size = vec2(3.0, 3.0);
        float w = size.x / openfl_TextureSize.x;
        float h = size.y / openfl_TextureSize.y;
        if (flixel_texture2D(bitmap, vec2(openfl_TextureCoordv.x + w, openfl_TextureCoordv.y)).a != 0.0 ||
            flixel_texture2D(bitmap, vec2(openfl_TextureCoordv.x - w, openfl_TextureCoordv.y)).a != 0.0 ||
            flixel_texture2D(bitmap, vec2(openfl_TextureCoordv.x, openfl_TextureCoordv.y + h)).a != 0.0 ||
            flixel_texture2D(bitmap, vec2(openfl_TextureCoordv.x, openfl_TextureCoordv.y - h)).a != 0.0) {
            finalColor = vec4(1.0);
        }
    }

    if (blendOverlay) {
        finalColor.rgb = blendOverlayFunc(color.rgb, finalColor.rgb);
    }

    fragColor = finalColor;
}

void main() {
    mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}