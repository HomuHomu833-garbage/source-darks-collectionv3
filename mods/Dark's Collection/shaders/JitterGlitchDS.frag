#pragma header

uniform float iTime;
uniform float chaos;
uniform float gAmnt;
uniform float scale;
uniform float speed; 

const float angle = 0.25;
const float aratio = 0.0;

vec2 fragCoord = openfl_TextureCoordv * openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;

vec2 rot(in vec2 uvi, in float r, in vec2 o)
{
    float t = radians(r * 360.0);
    vec2 uv = uvi - 0.5 + o;
    uv *= mat2(cos(t), -sin(t), sin(t), cos(t));
    return uv + 0.5 - o;
}

float hash(in vec2 uv)
{
    return fract(sin(dot(uv, vec2(14.478473612, 53.252567))) * 37482.1);
}

float v3tof(in vec3 col) {
    return (col.r + col.g + col.b) / 3.0;
}

void main()
{
    float glitchTime = fract(iTime * speed / 500.0) * 10000.0; 
    float shakeTime = fract(iTime / 500.0) * 10000.0;          

    vec2 uv = fragCoord.xy / iResolution.xy;

    vec2 sq = vec2(fragCoord.x / iResolution.y - iResolution.x / iResolution.y / 2.0,
                   fragCoord.y / iResolution.y - 0.5);

    vec2 ofs = vec2(sin(fract(floor(shakeTime) * 233.137) * 225.532),
                    sin(fract(floor(shakeTime) * 135.757) * 854.234));

    vec2 c = rot(sq, angle, vec2(0.5, 0.5)) * vec2(1.0, aratio) + ofs;

    vec2 dr = vec2(0.0), dg = vec2(0.0), db = vec2(0.0);
    float count = 0.0;

    float sM = 0.0;
    float sA = 1.0;
    float sT = 1.0;
    float sS = 1.0;

    float cs = clamp(chaos, 0.1, 1.0);
    float sc = scale * sS;

    for (float i = 0.0; i < 1.0; i += cs)
    {
        dr += vec2(hash(floor(c * sc + i) / sc),
                   hash(floor(c * sc + i) / sc + 1.11));
        dg += vec2(hash(floor(c * sc + i) / sc + 2.22),
                   hash(floor(c * sc + i) / sc + 3.33));
        db += vec2(hash(floor(c * sc + i) / sc + 4.44),
                   hash(floor(c * sc + i) / sc + 5.55));
        count += 1.0;
    }

    dr = (dr - count / 2.0) * cs;
    dg = (dg - count / 2.0) * cs;
    db = (db - count / 2.0) * cs;

    vec4 col = vec4(0.0);
    col.r = texture2D(bitmap, uv + dr * gAmnt * sT / 2.0).r;
    col.g = texture2D(bitmap, uv + dg * gAmnt * sT / 2.0).g;
    col.b = texture2D(bitmap, uv + db * gAmnt * sT / 2.0).b;

    vec2 dalpha = (dr + dg + db) / 3.0;
    col.a = texture2D(bitmap, uv + dalpha * gAmnt * sT / 2.0).a;

    gl_FragColor = mix(col, texture2D(bitmap, uv), 1.0 - sA);
}