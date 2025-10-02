// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
uniform float transparency;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

//** Based on "Base warp fBM" shader by https://www.shadertoy.com/user/trinketMage*//
float num_arms = 3.0;
float rotation_speed = 4.;
float spiral_angle = 4.5;
float pattern_speed = 1.;
float warp_speed = 0.5;

float colormap_red(float x) {
    if (x < 0.0) {
        return 54.0 / 255.0;
    } else if (x < 20049.0 / 82979.0) {
        return (829.79 * x + 54.51) / 255.0;
    } else {
        return 1.0;
    }
}

float colormap_green(float x) {
    if (x < 20049.0 / 82979.0) {
        return 0.0;
    } else if (x < 327013.0 / 810990.0) {
        return (8546482679670.0 / 10875673217.0 * x - 2064961390770.0 / 10875673217.0) / 255.0;
    } else if (x <= 1.0) {
        return (103806720.0 / 483977.0 * x + 19607415.0 / 483977.0) / 255.0;
    } else {
        return 1.0;
    }
}

float colormap_blue(float x) {
    if (x < 0.0) {
        return 54.0 / 255.0;
    } else if (x < 7249.0 / 82979.0) {
        return (829.79 * x + 54.51) / 255.0;
    } else if (x < 20049.0 / 82979.0) {
        return 127.0 / 255.0;
    } else if (x < 327013.0 / 810990.0) {
        return (792.02249341361393720147485376583 * x - 64.364790735602331034989206222672) / 255.0;
    } else {
        return 1.0;
    }
}

vec4 colormap(float x) {
    return vec4(colormap_red(x), colormap_green(x), colormap_blue(x), 1.0);
}


float rand(vec2 n) { 
    return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

float noise(vec2 p){
    vec2 ip = floor(p);
    vec2 u = fract(p);
    u = u*u*(3.0-2.0*u);

    float res = mix(
        mix(rand(ip),rand(ip+vec2(1.0,0.0)),u.x),
        mix(rand(ip+vec2(0.0,1.0)),rand(ip+vec2(1.0,1.0)),u.x),u.y);
    return res*res;
}

const mat2 mtx = mat2( 0.80,  0.60, -0.60,  0.80 );

float fbm( vec2 p )
{
    float f = 0.0;

    f += 0.500000*noise( p + pattern_speed*iTime  ); p = mtx*p*2.02;
    f += 0.031250*noise( p ); p = mtx*p*2.01;
    f += 0.250000*noise( p ); p = mtx*p*2.03;
    f += 0.125000*noise( p ); p = mtx*p*2.01;
    f += 0.062500*noise( p ); p = mtx*p*2.04;
    f += 0.015625*noise( p + sin(pattern_speed*iTime) );

    return f/0.96875;
}

float pattern( in vec2 p ){
    float radius = p.x;
    float angle = p.y;
    return fbm( vec2(radius, angle) + fbm( vec2(radius, angle) + fbm( vec2(radius, angle) ) ) );
}

void mainImage( out vec4 fragColor, in vec2 fragCoord ){
    vec2 uv = (gl_FragCoord.xy - 0.5 * iResolution.xy) / min(iResolution.y, iResolution.x);
    float radius = length(uv); // Calculate the radius from the center
    float angle = num_arms * atan(uv.y, uv.x); // Multiply the angle by 6 for 6 rotations per rotation
    angle += spiral_angle*sin(sin(warp_speed*iTime)*warp_speed*iTime*radius/min(iResolution.y, iResolution.x));
    angle += rotation_speed * iTime; // Add time to the angle calculation
    angle = mod(angle, 2. * 3.1415926);
    float shade = pattern(vec2(radius, angle));
    fragColor = vec4(colormap(shade).rgb, texture(iChannel0, fragCoord / iResolution.xy).a);

    fragColor.rgb *= transparency;

    fragColor.a = transparency;

    fragColor.a = max(fragColor.a, 0.0);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}