#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

uniform int iFrame;
uniform vec4 iMouse;
uniform float strength;

#define ANIMATE_RADIUS 0
#define MOUSE_CONTROLS_RADIUS 1
#define ANIMATE_NOISE 1
#define SAMPLE_COUNT 1 
#define GAUSSIAN_BLUR 0 
#define GAUSSIAN_BLUR_K 2.0

float baseRadius = 15.0;

vec2 hash23(vec3 p3)
{
    #if ANIMATE_NOISE
    p3.z += mod(float(iFrame), 256.0) * 4.0;
    #endif
	p3 = fract(p3 * vec3(443.897, 441.423, .0973));
    p3 += dot(p3, p3.yzx + 19.19);
    return fract((p3.xx + p3.yz) * p3.zy);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    #if ANIMATE_RADIUS
    float blurRadius = baseRadius * (0.53 + 0.47 * sin(iTime * 1.23));
    #else
    float blurRadius = baseRadius;
    #endif

    #if MOUSE_CONTROLS_RADIUS
    if (iMouse.z > 0.0)
        blurRadius *= 4.0 * iMouse.y / iResolution.y;
    #endif

    vec2 uv = fragCoord / iResolution.xy;
    vec2 whiteNoiseUV = uv;
    vec3 result = vec3(0.0);

    for (int i = 0; i < SAMPLE_COUNT; ++i)
    {
        vec2 whiteNoiseRand = hash23(vec3(whiteNoiseUV.xy, float(i)));
        whiteNoiseUV = whiteNoiseRand;

        vec2 r = whiteNoiseRand;
        r.x *= 6.2831853;

        #if GAUSSIAN_BLUR
        vec2 cr = vec2(sin(r.x), cos(r.x)) * sqrt(-GAUSSIAN_BLUR_K * log(r.y));
        #else
        vec2 cr = vec2(sin(r.x), cos(r.x)) * sqrt(r.y);
        #endif

        vec3 color = texture(iChannel0, uv + cr * (blurRadius / iResolution.xy)).rgb;
        result = mix(result, color, 1.0 / float(i + 1));
    }

    vec3 base = texture(iChannel0, uv).rgb;
    fragColor = vec4(mix(base, result, strength), texture(iChannel0, uv).a);
}

void main() {
    mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}