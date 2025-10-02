#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
uniform float strength;
#define iChannel0 bitmap
#define texture flixel_texture2D

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / min(iResolution.x, iResolution.y);
    float theta = atan(uv.y, uv.x);
    float r = length(uv);
    theta += 2.0 / (r + 0.1);
    vec2 distorted = r * vec2(cos(theta), sin(theta));
    float pattern = sin(distorted.x * 20.0 + iTime * 2.0) * 
                    cos(distorted.y * 20.0 + iTime * 2.0) * 
                    (1.0 - smoothstep(0.0, 0.8, r));
    vec3 effectColor = vec3(0.0);
    effectColor += vec3(0.0, 0.5, 1.0) * (pattern);
    effectColor += vec3(0.1, 0.8, 1.0) * abs(pattern);
    effectColor += vec3(0.0, 0.2, 0.6) * (0.3 + 0.7 * smoothstep(0.4, 0.2, r));
    vec3 bg = texture(iChannel0, fragCoord / iResolution.xy).rgb;
    vec3 finalColor = mix(bg, bg + effectColor, strength);
    fragColor = vec4(finalColor, 1.0);
}

void main() {
    mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}