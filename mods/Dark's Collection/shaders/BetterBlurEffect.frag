#pragma header

uniform float strength;
uniform float loops;
uniform float quality;
float Pi = 6.28318530718;

void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec4 color = flixel_texture2D(bitmap, uv);
    vec2 rad = strength / openfl_TextureSize;

    vec4 sum = vec4(0.0);
    float count = 0.0;

    for (float d = 0.0; d < Pi; d += Pi / loops)
    {
        for (float i = 1.0 / quality; i <= 1.0; i += 1.0 / quality)
        {
            sum += flixel_texture2D(bitmap, uv + vec2(cos(d), sin(d)) * rad * i);
            count += 1.0;
        }
    }

    color = sum / count;
    gl_FragColor = color;
}
