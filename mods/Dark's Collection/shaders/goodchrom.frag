#pragma header

uniform float amount;
uniform float iTime;

vec2 PincushionDistortion(vec2 uv, float strength) 
{
    vec2 st = uv - 0.5;
    float uvD = dot(st, st);
    float uvA = atan(st.x, st.y);
    return 0.5 + vec2(sin(uvA), cos(uvA)) * sqrt(uvD) * (1.0 - strength * uvD);
}

vec3 ChromaticAbberation(sampler2D tex, vec2 uv) 
{
    vec2 uvDistortedR = PincushionDistortion(uv, 0.3 * amount);
    vec2 uvDistortedG = PincushionDistortion(uv, 0.15 * amount);
    vec2 uvDistortedB = PincushionDistortion(uv, 0.075 * amount);

    float rChannel = flixel_texture2D(tex, uvDistortedR).r;
    float gChannel = flixel_texture2D(tex, uvDistortedG).g;
    float bChannel = flixel_texture2D(tex, uvDistortedB).b;

    // Verde se mantiene igual (canal G)
    float green = gChannel;

    // Morado = mezcla de R y B
    float purpleR = rChannel;
    float purpleB = bChannel;

    return vec3(purpleR, green, purpleB);
}


void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec4 src = flixel_texture2D(bitmap, uv);

    float fade = clamp(src.a * 20.0, 0.0, 1.0);

    vec3 distorted = ChromaticAbberation(bitmap, uv);
    vec3 col = mix(src.rgb, distorted, fade);

    gl_FragColor = vec4(col, src.a);
}