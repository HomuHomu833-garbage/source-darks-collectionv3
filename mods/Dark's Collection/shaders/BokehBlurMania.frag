#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
uniform float strength;
#define iChannel0 bitmap
#define texture flixel_texture2D

#define IterSize 64
#define GoldenAngle 2.399996

mat2 rot(float a)
{
    float c = cos(a);
    float s = sin(a);
    return mat2(c, s, -s, c);
}

vec3 bokeh(in sampler2D tex, in vec2 uv, in vec2 pixelsize, in float radius)
{
    vec3 total = vec3(0.);
    vec3 divsor = vec3(0.);
    float r = 1.;
    mat2 G = rot(GoldenAngle);
    vec2 offset = vec2(radius, 0.);
    for (int i = 0; i < IterSize; ++i) {
        r += 1./r;
        offset = G * offset;
        vec3 col = texture(tex, uv + offset * (r - 1.) * pixelsize).rgb;
        vec3 bokeh = pow(col, vec3(4.));
        total += col * bokeh;
        divsor += bokeh;
    }
    return total / divsor;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;

    float ctrl_r = strength;  

    vec3 col = bokeh(iChannel0, uv, 1./iResolution.xy, ctrl_r);
    fragColor = vec4(col, texture(iChannel0, fragCoord / iResolution.xy).a);
}

void main() {
    mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}