#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
uniform float strength;
uniform float rotationDir; //right -1.0 or 1.0 left
uniform float color; 
#define texture flixel_texture2D

#define time iTime*0.1
#define tau 6.2831853

mat2 makem2(float t) {
    float c = cos(t), s = sin(t);
    return mat2(c, -s, s, c);
}

float hash(float n) {
    return fract(sin(n) * 43758.5453123);
}

float hash(vec2 p) {
    return fract(sin(dot(p * rotationDir, vec2(127.1, 311.7))) * 43758.5453123);
}

float noise(vec2 x) {
    vec2 i = floor(x);
    vec2 f = fract(x);
    f = f*f*(3.0-2.0*f);
    float a = hash(i);
    float b = hash(i+vec2(1.,0.));
    float c = hash(i+vec2(0.,1.));
    float d = hash(i+vec2(1.,1.));
    return mix(mix(a,b,f.x),mix(c,d,f.x),f.y);
}

mat2 m2 = mat2(0.80,0.60,-0.60,0.80);

float grid(vec2 p){return sin(p.x)*cos(p.y);}

float flow(in vec2 p){
    float z = 2.;
    float rz = 0.;
    vec2 bp = p;
    for(float i=1.; i<7.; i++){
        bp += time*1.5;
        vec2 gr = vec2(grid(p*3.-time*2.), grid(p*3.+4.-time*2.))*0.4;
        gr = normalize(gr)*0.4;
        gr *= makem2((p.x+p.y)*.3+time*10.);
        p += gr*0.5;
        rz += (sin(noise(p)*8.)*0.5+0.5)/z;
        p = mix(bp,p,.5);
        z *= 1.7;
        p *= 2.5;
        p *= m2;
        bp *= 2.5;
        bp *= m2;
    }
    return rz;
}

float spiral(vec2 p,float scl){
    float r = length(p);
    r = log(r);
    float a = rotationDir*atan(p.y,p.x);
    return abs(mod(scl*(r-2.0/scl*a),tau)-1.0)*2.0;
}

vec3 hsv2rgb(vec3 c){
    vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
                             6.0)-3.0)-1.0,0.0,1.0);
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec2 uv = fragCoord.xy/iResolution.xy;
    vec2 p = uv-0.5;
    p.x *= iResolution.x/iResolution.y;
    p *= 3.0;

    float rz = flow(p);
    p /= exp(mod(time*3.0,2.1));
    rz *= (6.0-spiral(p,3.0));

    vec3 userCol = hsv2rgb(vec3(color, 0.9, 0.7));
    vec3 shaderCol = strength * userCol / rz;

    shaderCol = pow(abs(shaderCol), vec3(0.9));

    vec4 baseCol = texture(bitmap,uv);
    vec3 finalCol = baseCol.rgb + shaderCol;

    fragColor = vec4(finalCol, baseCol.a);
}

void main(){
    mainImage(gl_FragColor,openfl_TextureCoordv*openfl_TextureSize);
}