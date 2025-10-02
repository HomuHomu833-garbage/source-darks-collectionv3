#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
uniform float strength;
uniform float colorIndex1;
uniform float colorIndex2;
#define iChannel0 bitmap
#define texture flixel_texture2D

vec3 getColor(float index) {
    if (index == 1.0) return vec3(1.0, 0.0, 0.0);//red
    if (index == 2.0) return vec3(0.0, 1.0, 0.0);//green
    if (index == 3.0) return vec3(0.0, 0.0, 1.0);//blue
    if (index == 4.0) return vec3(1.0, 1.0, 0.0);//yellow
    if (index == 5.0) return vec3(1.0, 0.0, 1.0);//magenta
    if (index == 6.0) return vec3(0.0, 1.0, 1.0);//cyan
    if (index == 7.0) return vec3(1.0, 1.0, 1.0);//white
    return vec3(0.0);//black
}

float tri(vec2 st, float pct){
  return 1.0 - smoothstep(pct, pct + 0.05, st.y);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord / iResolution.xy;
    uv.x *= iResolution.x / iResolution.y;

    vec3 color1 = getColor(colorIndex1);
    vec3 color2 = getColor(colorIndex2);

    float s = 10.0;
    uv *= s;
    uv.x += iTime;

    float y1 = mod(uv.x, 1.0) + sin(uv.x / s + iTime * 2.0) + sin(uv.y / s + iTime);
    float y2 = mod(uv.x, 1.0) + sin(uv.x / s + iTime + 2.0) + sin(uv.y / s + iTime);

    vec3 pattern = tri(mod(uv, 1.0), y1) * color1 + tri(mod(uv, 1.0), y2) * color2;

    vec4 base = texture(iChannel0, fragCoord / iResolution.xy);
    vec3 finalColor = mix(base.rgb, pattern, clamp(strength, 0.0, 1.0));

    fragColor = vec4(finalColor, base.a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}