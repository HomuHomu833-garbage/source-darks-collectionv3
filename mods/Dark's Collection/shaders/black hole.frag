// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

// Bump up the iterations!
// More iterations means more detail + aliasing
#define ITERATIONS 20

void mainImage (out vec4 fragColor, in vec2 fragCoord) {
    float time = iTime * 2. + 15.;
    vec2 res = iResolution.xy;
	vec2 uv = fragCoord.xy / res - vec2(.5);
    uv *= vec2(res.x / res.y, 1.) * 4.;
    
    float len = dot(uv, uv) * .3 - .4;
    
    vec3 z = sin(time * vec3(.23, .19, .17));
    for (int i = 0; i < ITERATIONS; i++) {
        z += cos(z.zxy + uv.yxy * float(i) * len);
    }
    
    float val = z.r * .06 + .3;
    val -= smoothstep(.1, -.3, len) * 1.5 + len * .3 - .4;
    fragColor = vec4(vec3(max(val, .1)), texture(iChannel0, fragCoord / iResolution.xy).a);
    
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}