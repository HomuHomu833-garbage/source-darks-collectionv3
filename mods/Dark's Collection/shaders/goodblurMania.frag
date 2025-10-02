#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
uniform float strength;
#define iChannel0 bitmap

uniform vec4 iMouse;

#define SAMPLES 10
#define SAMPLES_F float(SAMPLES)

float hash13(vec3 p3)
{
    p3 = fract(p3 * 443.8975);
    p3 += dot(p3, p3.yzx + 19.19);
    return fract((p3.x + p3.y) * p3.z);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    float r = strength * 0.1;
    if (iMouse.w >= 1.0)
    {
        r = strength * (iMouse.x / iResolution.x) * 0.1;
    }

    vec4 color = vec4(0.0);

    for (int i = 0; i < SAMPLES; ++i)
    {
        float fi = float(i);
        float rnd = hash13(vec3(uv.xy, fi));
        float f = (fi + rnd) / SAMPLES_F;
        f = (f * 2.0 - 1.0) * r;
        color += texture2D(iChannel0, uv + vec2(f, 0.0));
    }

    color /= SAMPLES_F;
    fragColor = color;
}

void main() {
    mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}