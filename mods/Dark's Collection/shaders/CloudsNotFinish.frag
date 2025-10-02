#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
#define texture flixel_texture2D
uniform vec4 iMouse;

#define LOOK 1
#define NOISE_METHOD 1
#define USE_LOD 1

float hash(vec2 p){
    return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}

vec3 noiseRGB(vec2 p){
    return vec3(
        hash(p + vec2(1.0, 0.0)),
        hash(p + vec2(0.0, 1.0)),
        hash(p + vec2(1.0, 1.0))
    );
}

float sampleNoise(vec2 coord){
    vec2 pixel = floor(coord * 256.0);
    vec3 noise = noiseRGB(pixel);
    return mix(noise.x, noise.y, noise.z);
}

mat3 setCamera(in vec3 ro, in vec3 ta, float cr){
    vec3 cw = normalize(ta-ro);
    vec3 cp = vec3(sin(cr), cos(cr), 0.0);
    vec3 cu = normalize(cross(cw,cp));
    vec3 cv = normalize(cross(cu,cw));
    return mat3(cu, cv, cw);
}

float noise(in vec3 x){
    vec3 p = floor(x);
    vec3 f = fract(x);
    f = f*(3.0-2.0*f);
    #if NOISE_METHOD==0
    x = p + f;
    return texture2D(iChannel2,(x+0.5)/32.0).x*2.0-1.0;
    #endif
    #if NOISE_METHOD==1
    vec2 uv = (p.xy + vec2(37.0,239.0)*p.z) + f.xy;
    float n1 = sampleNoise((uv+0.5)/256.0);
    float n2 = sampleNoise((uv+1.5)/256.0);
    return mix(n1, n2, f.z) * 2.0 - 1.0;
    #endif
    #if NOISE_METHOD==2
    vec3 q = p;
    vec2 uv = q.xy + vec2(37.0,239.0)*q.z;
    float n1 = sampleNoise((uv+0.5)/256.0);
    float n2 = sampleNoise((uv+vec2(1.0,0.0)+0.5)/256.0);
    float n3 = sampleNoise((uv+vec2(0.0,1.0)+0.5)/256.0);
    float n4 = sampleNoise((uv+vec2(1.0,1.0)+0.5)/256.0);
    float rgx = mix(n1,n2,f.x);
    float rgy = mix(n3,n4,f.x);
    return mix(rgx,rgy,f.y)*2.0-1.0;
    #endif
}

#if LOOK==0
float map(in vec3 p,int oct){
    vec3 q = p - vec3(0.0,0.1,1.0)*iTime;
    float g = 0.5+0.5*noise(q*0.3);
    float f;
    f  = 0.50000*noise(q); q = q*2.02;
    #if USE_LOD==1
    if(oct>=2)
    #endif
    f += 0.25000*noise(q); q = q*2.23;
    #if USE_LOD==1
    if(oct>=3)
    #endif
    f += 0.12500*noise(q); q = q*2.41;
    #if USE_LOD==1
    if(oct>=4)
    #endif
    f += 0.06250*noise(q); q = q*2.62;
    #if USE_LOD==1
    if(oct>=5)
    #endif
    f += 0.03125*noise(q);
    f = mix(f*0.1-0.5,f,g*g);
    return 1.5*f - 0.5 - p.y;
}

const int kDiv = 1;
const vec3 sundir = normalize(vec3(1.0,0.0,-1.0));

vec4 raymarch(in vec3 ro,in vec3 rd,in vec3 bgcol,in vec2 px){
    const float yb = -3.0;
    const float yt =  0.6;
    float tb = (yb-ro.y)/rd.y;
    float tt = (yt-ro.y)/rd.y;
    float tmin,tmax;
    if(ro.y>yt){
        if(tt<0.0) return vec4(0.0);
        tmin = tt;
        tmax = tb;
    }else{
        tmin = 0.0;
        tmax = 60.0;
        if(tt>0.0) tmax = min(tmax,tt);
        if(tb>0.0) tmax = min(tmax,tb);
    }
    vec2 pxf = floor(px);
    float texSampleCoordX = mod(pxf.x, 1024.0);
    float texSampleCoordY = mod(pxf.y, 1024.0);
    vec2 texUV = (vec2(texSampleCoordX, texSampleCoordY) + 0.5) / 1024.0;
    float t = tmin + 0.1 * texture2D(iChannel1, texUV).x;
    vec4 sum = vec4(0.0);
    for(int i=0;i<190*kDiv;i++){
        float dt = max(0.05,0.02*t/float(kDiv));
        #if USE_LOD==0
        const int oct = 5;
        #else
        int oct = 5 - int(log2(1.0+t*0.5));
        #endif
        vec3 pos = ro + t*rd;
        float den = map(pos,oct);
        if(den>0.01){
            float dif = clamp((den - map(pos+0.3*sundir,oct))/0.25,0.0,1.0);
            vec3 lin = vec3(0.65,0.65,0.75)*1.1 + 0.8*vec3(1.0,0.6,0.3)*dif;
            vec4 col = vec4(mix(vec3(1.0,0.93,0.84),vec3(0.25,0.3,0.4),den),den);
            col.xyz = lin;
            col.xyz = mix(col.xyz,bgcol,1.0-exp2(-0.1*t));
            col.w = min(col.w*8.0*dt,1.0);
            col.rgb = col.a;
            sum += col*(1.0-sum.a);
        }
        t += dt;
        if(t>tmax || sum.a>0.99) break;
    }
    return clamp(sum,0.0,1.0);
}

vec4 render(in vec3 ro,in vec3 rd,in vec2 px){
    float sun = clamp(dot(sundir,rd),0.0,1.0);
    vec3 col = vec3(0.76,0.75,0.95);
    col -= 0.6*vec3(0.90,0.75,0.95)*rd.y;
    col += 0.2*vec3(1.00,0.60,0.10)*pow(sun,8.0);
    vec4 res = raymarch(ro,rd,col,px);
    col = col*(1.0-res.w) + res.xyz;
    col += 0.2*vec3(1.0,0.4,0.2)*pow(sun,3.0);
    col = smoothstep(0.15,1.1,col);
    return vec4(col,1.0);
}

#else

float map5(in vec3 p){
    vec3 q = p - vec3(0.0,0.1,1.0)*iTime;
    float f;
    f  = 0.50000*noise(q); q = q*2.02;
    f += 0.25000*noise(q); q = q*2.03;
    f += 0.12500*noise(q); q = q*2.01;
    f += 0.06250*noise(q); q = q*2.02;
    f += 0.03125*noise(q);
    return clamp(1.5 - p.y - 2.0 + 1.75*f,0.0,1.0);
}
float map4(in vec3 p){
    vec3 q = p - vec3(0.0,0.1,1.0)*iTime;
    float f;
    f  = 0.50000*noise(q); q = q*2.02;
    f += 0.25000*noise(q); q = q*2.03;
    f += 0.12500*noise(q); q = q*2.01;
    f += 0.06250*noise(q);
    return clamp(1.5 - p.y - 2.0 + 1.75*f,0.0,1.0);
}
float map3(in vec3 p){
    vec3 q = p - vec3(0.0,0.1,1.0)*iTime;
    float f;
    f  = 0.50000*noise(q); q = q*2.02;
    f += 0.25000*noise(q); q = q*2.03;
    f += 0.12500*noise(q);
    return clamp(1.5 - p.y - 2.0 + 1.75*f,0.0,1.0);
}
float map2(in vec3 p){
    vec3 q = p - vec3(0.0,0.1,1.0)*iTime;
    float f;
    f  = 0.50000*noise(q);
    q = q*2.02; f += 0.25000*noise(q);
    return clamp(1.5 - p.y - 2.0 + 1.75*f,0.0,1.0);
}

const vec3 sundir2 = vec3(-0.7071,0.0,-0.7071);

#define MARCH(STEPS,MAPLOD) for(int i=0;i<STEPS;i++){vec3 pos=ro+t*rd;if(pos.y<-3.0||pos.y>2.0||sum.a>0.99)break;float den=MAPLOD(pos);if(den>0.01){float dif=clamp((den-MAPLOD(pos+0.3*sundir2))/0.6,0.0,1.0);vec3 lin=vec3(1.0,0.6,0.3)*dif+vec3(0.91,0.98,1.05);vec4 col=vec4(mix(vec3(1.0,0.95,0.8),vec3(0.25,0.3,0.35),den),den);col.xyz=lin;col.xyz=mix(col.xyz,bgcol,1.0-exp(-0.003*t*t));col.w=0.4;col.rgb=col.a;sum+=col*(1.0-sum.a);}t+=max(0.06,0.05*t);}

vec4 raymarch(in vec3 ro,in vec3 rd,in vec3 bgcol,in vec2 px){
    vec4 sum=vec4(0.0);
    vec2 pxf = floor(px);
    vec2 texUV = (mod(pxf, 256.0) + 0.5) / 256.0;
    float t=0.05*texture2D(iChannel1, texUV).x;
    MARCH(40,map5);
    MARCH(40,map4);
    MARCH(30,map3);
    MARCH(30,map2);
    return clamp(sum,0.0,1.0);
}

vec4 render(in vec3 ro,in vec3 rd,in vec2 px){
    float sun=clamp(dot(sundir2,rd),0.0,1.0);
    vec3 col=vec3(0.6,0.71,0.75)-rd.y*0.2*vec3(1.0,0.5,1.0)+0.15*0.5;
    col+=0.2*vec3(1.0,.6,0.1)*pow(sun,8.0);
    vec4 res=raymarch(ro,rd,col,px);
    col=col*(1.0-res.w)+res.xyz;
    col+=vec3(0.2,0.08,0.04)*pow(sun,3.0);
    return vec4(col,1.0);
}
#endif

void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec2 p=(2.0*fragCoord-iResolution.xy)/iResolution.y;
    vec2 m=iMouse.xy/iResolution.xy;
    vec3 ro=4.0*normalize(vec3(sin(3.0*m.x),0.8*m.y,cos(3.0*m.x)))-vec3(0.0,0.1,0.0);
    vec3 ta=vec3(0.0,-1.0,0.0);
    mat3 ca=setCamera(ro,ta,0.07*cos(0.25*iTime));
    vec3 rd=ca*normalize(vec3(p.xy,1.5));
    fragColor=render(ro,rd,fragCoord-0.5);
}

void main(){
    mainImage(gl_FragColor,openfl_TextureCoordv*openfl_TextureSize);
}