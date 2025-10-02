#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
uniform float hue;
uniform float brightness;
#define iChannel0 bitmap
#define texture flixel_texture2D

float hash2(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float hash3(vec2 p, float t) {
    return fract(sin(dot(p, vec2(269.5, 183.3)) + t*17.13) * 43758.5453);
}

vec2 mask_coord(vec2 coord, int shift) {
    float m = exp2(float(shift));
    return floor(coord / m) * m;
}

float get_sample(vec2 coord, int shift) {
    coord = mask_coord(coord, shift);
    vec2 uv = coord / iResolution.xy;
    uv.y = 1.0 - uv.y;
    float offset = 1.2 * (uv.x + uv.y - 1.0);
    float hxy = hash2(coord);
    float tf = 13.0 * iTime / (6.0 * abs(uv.y - uv.x) + 1.8) + hxy;
    float h1 = hash3(coord, floor(tf));
    float c = 1.2 * h1 + offset;
    return (c - 0.5) * 2.5 / (1.5 + float(shift)) + 0.5;
}

float get_sample_t(vec2 coord, float time) {
    int shift = 0;
    for (int s = 10; s >= 0; s--) {
        vec2 xy = mask_coord(coord, s) / iResolution.xy;
        xy.y = 1.0 - xy.y;
        if (s < int(6.0 * abs(xy.y - xy.x) + 1.0 + hash3(xy, time))) {
            shift = s;
            break;
        }
    }
    return (get_sample(coord, shift) + get_sample(coord, shift + 1)) * 0.4;
}

vec3 hueShift(float hue) {
    float c = cos(hue), s = sin(hue);
    mat3 m = mat3(
        0.299+0.701*c+0.168*s, 0.587-0.587*c+0.330*s, 0.114-0.114*c-0.497*s,
        0.299-0.299*c-0.328*s, 0.587+0.413*c+0.035*s, 0.114-0.114*c+0.292*s,
        0.299-0.300*c+1.250*s, 0.587-0.588*c-1.050*s, 0.114+0.886*c-0.203*s
    );
    return clamp(m * vec3(1.0), 0.0, 1.0);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    float tf = 0.3 * iTime;
    float c = mix(get_sample_t(fragCoord, floor(tf)), get_sample_t(fragCoord, floor(tf) + 1.0), tf - floor(tf));
    vec3 col = hueShift(hue) * (c * brightness);
    vec4 base = texture(iChannel0, fragCoord / iResolution.xy);
    fragColor = vec4(col, base.a);
}

void main() {
    mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}