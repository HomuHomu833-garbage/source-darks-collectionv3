// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

uniform float invert = 0; // 0 means no original color 1 means invert

void mainImage( out vec4 fragColor, in vec2 fragCoord ){
    vec4 color = texture(iChannel0, fragCoord.xy/iResolution.xy);
    if(invert == 0) {
        fragColor = color;
    } else {
    fragColor = vec4(1.0-color.rgb, texture(iChannel0, fragCoord / iResolution.xy).a);
    }
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}