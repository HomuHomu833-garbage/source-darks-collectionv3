#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define texture flixel_texture2D

uniform float strength;
uniform float iTime;

vec3 rectangleGradientHorizontal(vec3 background, vec2 position, vec2 diemensions, vec2 uv, bool invert);
vec3 bar(vec3 background, vec2 position, vec2 diemensions, vec2 uv, bool invert);
vec3 bars(vec3 background, int barsPerSide, sampler2D sound, vec2 uv);

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord / iResolution.xy;
    vec4 tex = texture(iChannel0, uv);
    vec3 bgColor = tex.rgb;
    vec3 barsColor = bars(bgColor, 16, iChannel0, uv);
    vec3 finalColor = mix(bgColor, barsColor, strength);
    fragColor = vec4(finalColor, tex.a);
}

vec3 bars(vec3 background, int barsPerSide, sampler2D sound, vec2 uv)
{
    int totalBars = barsPerSide * 2;
    for (int i = 0; i < totalBars; i++)
    {
        bool invert = i >= barsPerSide;
        float index = invert ? float(i - barsPerSide) : float(i);

        float y = (index + 1.0) / float(barsPerSide + 1);
        float band = y; 
        float fSample = texture(sound, vec2(0.75, band)).x;

        float len = clamp(fSample * 1.0, 0.0, 0.3);

        float height = 1.0 / float(barsPerSide + 1) * 0.5;
        float x = invert ? 1.0 : 0.0;

        vec2 pos = vec2(x, y);
        vec2 size = vec2(0.5 * len + 0.008, height);

        background = bar(background, pos, size, uv, invert);
    }
    return background;
}

vec3 bar(vec3 background, vec2 position, vec2 diemensions, vec2 uv, bool invert)
{
    return rectangleGradientHorizontal(background, position, diemensions, uv, invert);
}

vec3 rectangleGradientHorizontal(vec3 background, vec2 position, vec2 diemensions, vec2 uv, bool invert)
{
    float yMin = position.y - diemensions.y / 2.0;
    float yMax = position.y + diemensions.y / 2.0;
    float xMin = invert ? position.x - diemensions.x : position.x;
    float xMax = invert ? position.x : position.x + diemensions.x;

    if (uv.x >= xMin && uv.x <= xMax && uv.y >= yMin && uv.y <= yMax)
    {
        float relX = (uv.x - xMin) / (xMax - xMin);
        if (invert) relX = 1.0 - relX;

        vec3 black         = vec3(0.0);
        vec3 violetClair   = vec3(0.7, 0.4, 1.0);
        vec3 rose          = vec3(1.0, 0.4, 0.7);
        vec3 rouge         = vec3(1.0, 0.0, 0.0);
        vec3 orange        = vec3(1.0, 0.5, 0.0);
        vec3 orangeClair   = vec3(1.0, 0.7, 0.3);

        vec3 col = black;
        col = mix(col, violetClair, smoothstep(0.0, 0.2, relX));
        col = mix(col, rose,        smoothstep(0.2, 0.4, relX));
        col = mix(col, rouge,       smoothstep(0.4, 0.6, relX));
        col = mix(col, orange,      smoothstep(0.6, 0.8, relX));
        col = mix(col, orangeClair, smoothstep(0.8, 1.0, relX));

        return col;
    }

    return background;
}

void main() {
    mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}