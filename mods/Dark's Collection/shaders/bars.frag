#pragma header

uniform float effect;    
uniform float effect2;   
uniform float angle1;
uniform float angle2;

vec2 rotate(vec2 p, float a, vec2 center)
{
    p -= center;
    float cosA = cos(a);
    float sinA = sin(a);
    p = vec2(
        cosA * p.x - sinA * p.y,
        sinA * p.x + cosA * p.y
    );
    return p + center;
}

void main()
{
    vec2 uv = openfl_TextureCoordv.xy;
    vec4 Color = flixel_texture2D(bitmap, uv);

    vec2 distortedUV = uv;

    float rad1 = -angle1 * 3.14159265 / 180.0;
    float rad2 = -angle2 * 3.14159265 / 180.0;

    vec2 rotatedUV1 = rotate(distortedUV, rad1, vec2(0.5));
    vec2 rotatedUV2 = rotate(distortedUV, rad2, vec2(0.5));

    if (rotatedUV1.y < effect || rotatedUV1.y > 1.0 - effect || 
        rotatedUV2.x < effect2 || rotatedUV2.x > 1.0 - effect2)
    {
        Color = vec4(0.0, 0.0, 0.0, 1.0);
    }

    gl_FragColor = Color;
}
