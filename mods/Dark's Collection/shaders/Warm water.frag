// original author: Dave_Hoskins, https://www.shadertoy.com/view/MdlXz8
#pragma header

#define TAU 6.28318530718
#define MAX_ITER 5
uniform float iTime;
#define time iTime 

uniform vec2 iResolution;
uniform float iTime;

void mainImage( out vec4 fragColor, in ve
c2 fragCoord )
{
    float time = iTime * 0.5 + 23.0;
    vec2 uv = fragCoord.xy / iResolution.xy;

    vec2 p = mod(uv * TAU, TAU) - 250.0;
    vec2 i = vec2(p);
    float c = 1.0;
    float inten = 0.005;

    for (int n = 0; n < MAX_ITER; n++) {
        float t = time * (1.0 - (3.5 / float(n + 1)));
        i = p + vec2(cos(t - i.x) + sin(t + i.y), sin(t - i.y) + cos(t + i.x));
        c += 1.0 / length(vec2(p.x / (sin(i.x + t) / inten), p.y / (cos(i.y + t) / inten)));
    }

    c /= float(MAX_ITER);
    c = 1.17-pow(c, 1.4);
    vec3 colour = vec3(pow(abs(c), 8.0));
    colour = clamp(colour + vec3(0.0, 0.35, 0.5), 0.0, 1.0);

    fragColor = vec4(colour, 1.0);
}

// Psych Engine espera una función main() así:
void main()
{   vec2
    vec2 fragCoord = textureCoordv.xy;
    mainImage(gl_FragColor, gl_FragCoord.xy);
}