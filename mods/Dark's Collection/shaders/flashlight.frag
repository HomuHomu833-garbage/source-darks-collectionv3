#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define texture flixel_texture2D

uniform float posX;           // posX and posY control the light position
uniform float posY;          

uniform float sizeX;          // sizeX and sizeY control the horizontal and vertical size of the light area
uniform float sizeY;          

uniform float strength;       // strength controls the blending between original colors and light effect
uniform float lightIntensity; // lightIntensity controls the brightness of the light
uniform float darkness;       // darkness controls how dark the area outside the light effect becomes

uniform float animationType;  // animationType selects the animation style of the flashing light 12 style animation
uniform float iTime;

uniform float flashHue;      // 0.0 to 1.0 hue for flash color
uniform float flashSaturation; // 0.0 for white/grey, 1.0 full color of flashHue

float hash(float n) {
    return fract(sin(n) * 43758.5453);
}

vec3 hsv2rgb(vec3 c) {
    vec3 rgb = clamp( abs(mod(c.x * 6.0 + vec3(0.,4.,2.), 6.0) - 3.0) -1.0, 0.0, 1.0 );
    rgb = rgb*rgb*(3.0 - 2.0*rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec4 baseCol = texture(iChannel0, uv);

    float lightY = 0.1 * iResolution.y;
    vec3 lightPos = vec3(posX * iResolution.x, lightY, posY * iResolution.y);

    vec3 lightDir = lightPos - vec3(fragCoord.x, 0., fragCoord.y);
    lightDir.x /= sizeX;
    lightDir.z /= sizeY;

    float flash = 1.0;

    if(animationType == 0.0) {
        flash = 1.0;
    } else if(animationType == 1.0) {
        flash = 0.5 + 0.5 * sin(iTime * 5.0);
    } else if(animationType == 2.0) {
        flash = step(0.5, fract(iTime * 3.0));
    } else if(animationType == 3.0) {
        flash = hash(floor(iTime * 10.0));
    } else if(animationType == 4.0) {
        float t = floor(iTime * 3.0);
        float rnd = hash(t);
        float nextRnd = hash(t + 1.0);
        float interp = fract(iTime * 3.0);
        flash = mix(rnd, nextRnd, smoothstep(0.5, 1.0, interp));
    } else if(animationType == 5.0) {
        flash = abs(sin(iTime * 8.0)) * (0.5 + 0.5 * sin(iTime * 2.0));
    } else if(animationType == 6.0) {
        flash = smoothstep(0.0, 1.0, fract(iTime * 1.5));
    } else if(animationType == 7.0) {
        float noiseVal = hash(floor(iTime * 12.0)) * 0.5 + 0.5 * sin(iTime * 4.0);
        flash = clamp(noiseVal, 0.0, 1.0);
    } else if(animationType == 8.0) {
        flash = 0.5 + 0.5 * sin(iTime * 20.0) * sin(iTime * 3.0);
    } else if(animationType == 9.0) {
        flash = 0.5 + 0.5 * sin(iTime * 0.8);
    } else if(animationType == 10.0) {
        float flicker = hash(floor(iTime * 30.0));
        flash = mix(0.85, 1.15, flicker);
    } else if(animationType == 11.0) {
        float explosion = 1.0 - smoothstep(0.0, 2.0, fract(iTime));
        flash = explosion * (0.5 + 0.5 * sin(iTime * 10.0));
    } else if(animationType == 12.0) {
        float pulse = abs(sin(iTime * 4.0));
        float noisePulse = hash(floor(iTime * 10.0));
        flash = mix(pulse, noisePulse, 0.3);
    } else if(animationType == 13.0) {
        float t = floor(iTime * 5.0);
        float rnd1 = hash(t);
        float rnd2 = hash(t + 1.0);
        float interp = fract(iTime * 5.0);
        flash = mix(rnd1, rnd2, smoothstep(0.0, 1.0, interp));
        float minFlash = 0.5; 
        flash = max(minFlash, flash);
    }

    vec3 flashCol = hsv2rgb(vec3(flashHue, flashSaturation, 1.0));

    float diffuse = max(dot(normalize(lightDir), vec3(0., 1., 0.)), 0.) * lightIntensity * flash;
    
    vec3 litColor = baseCol.rgb * flashCol * diffuse;

    vec3 mixedCol = mix(baseCol.rgb, litColor, strength);
    mixedCol = mix(mixedCol * (1.0 - darkness), mixedCol, diffuse);

    fragColor = vec4(mixedCol, baseCol.a);
}

void main() {
    mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}