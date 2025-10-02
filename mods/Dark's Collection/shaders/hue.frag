// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header



vec3 h(vec3 c, float s){
    vec3 m = .66 * cos(s + vec3(0, 2.1, 4.2)) + .33;
    return c * mat3(m, m.zxy, m.yzx) ;
}

void mainImage(out vec4 O, vec2 u)
{
    u /= iResolution.xy;
    vec3 
        a = h(vec3(1, 0, 0), u.x * 3.14),
        b = texture(iChannel0, u).rgb;
    O=vec4(h(mix(a, b, step(.1, u.y)), iTime), 1);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}