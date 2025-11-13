#pragma header

const int MAX_MARCHING_STEPS = 50;
const float MIN_DIST = 0.0;
const float MAX_DIST = 25.0;
const float PRECISION = 0.001;
const float EPSILON = 0.0005;
const float PI = 3.14159;
const float ASPECTRATIO = 1.77777;
const float ASPECTRATIOINV = 0.5625;

uniform float tilt;

// camera
uniform float x;
uniform float y;
uniform float z;
uniform float pitch;
uniform float yaw;

// box and scene controls
uniform float boxX;
uniform float boxY;
uniform float boxZ;
uniform float rotaboxX;
uniform float rotaboxY;
uniform float twist;
uniform float distort;
uniform float repeatDistance;

// general
uniform float iTime;
uniform float strength;
uniform float direction;
uniform float speed;
uniform float zoom;

#define iChannel0 bitmap
#define texture flixel_texture2D

struct Surface {
    float sd;
    vec3 p;
};

mat3 rotateX(float theta) {
    float c = cos(theta);
    float s = sin(theta);
    return mat3(
        vec3(1.0, 0.0, 0.0),
        vec3(0.0, c, -s),
        vec3(0.0, s, c)
    );
}
mat3 rotateY(float theta) {
    float c = cos(theta);
    float s = sin(theta);
    return mat3(
        vec3(c, 0.0, s),
        vec3(0.0, 1, 0.0),
        vec3(-s, 0.0, c)
    );
}
mat3 rotateZ(float theta) {
    float c = cos(theta);
    float s = sin(theta);
    return mat3(
        vec3(c, -s, 0.0),
        vec3(s, c, 0.0),
        vec3(0.0, 0.0, 1.0)
    );
}

vec3 opTwist(vec3 p) {
    float c = cos(twist * p.y);
    float s = sin(twist * p.y);
    mat2 m = mat2(c, -s, s, c);
    vec3 q = vec3(m * p.xz, p.y);
    return vec3(q.x, q.z, q.y);
}

vec3 opDisplace(vec3 p) {
    float s = distort;
    vec3 d2 = vec3(sin(s * p.x) * sin(s * p.y) * sin(s * p.z));
    return p + d2;
}

vec3 opRepetition(vec3 p, vec3 s) {
    vec3 q = p - s * floor((p / s) + vec3(0.5));
    return q;
}

vec2 repeatUV(vec2 uv) {
    if ((uv.x > 1.0 || uv.x < 0.0) && abs(mod(uv.x, 2.0)) > 1.0)
        uv.x = (0.0 - uv.x) + 1.0;
    if ((uv.y > 1.0 || uv.y < 0.0) && abs(mod(uv.y, 2.0)) > 1.0)
        uv.y = (0.0 - uv.y) + 1.0;
    return vec2(abs(mod(uv.x, 1.0)), abs(mod(uv.y, 1.0)));
}

vec2 getUV3D(vec3 p) {
    vec3 absP = abs(p);
    vec2 uvThing;
    float bias = 0.42;
    vec2 center = vec2(-0.5, -0.5);

    if (absP.x - 0.4 >= absP.y && absP.x >= absP.z) {
        uvThing = vec2(p.z, p.y);
    }
    else if (absP.y + bias >= absP.x && absP.y + bias >= absP.z) {
        uvThing = vec2(p.x * 1.0, p.z * 0.825);
    }
    else {
        uvThing = vec2(p.x, p.y);
    }

    uvThing *= 0.5;
    uvThing.y *= ASPECTRATIO;
    uvThing += center;
    uvThing.y = -uvThing.y;
    uvThing.x = -uvThing.x;
    return uvThing;
}

Surface sdBox(vec3 p, vec3 scale, vec3 offset) {
    p = (p - offset);  
    p = opRepetition(p, vec3(repeatDistance + 20.0));
    p = opTwist(p);
    p = opDisplace(p);

    p = rotateZ(radians(rotaboxY * 90.0)) * p;
    p = rotateY(radians(rotaboxX + 1.0 * 90.0)) * p;

    vec3 q = abs(p) - scale;
    float d = length(max(q, vec3(0.0))) + min(max(q.x, max(q.y, q.z)), 0.0);
    return Surface(d, p);
}

Surface scene(vec3 p) {
    return sdBox(p, vec3(1.0, ASPECTRATIOINV, 1.0), vec3(boxX + 20.0, boxY + 20.0, boxZ - 20.0));
}

Surface rayMarch(vec3 ro, vec3 rd) {
    float depth = MIN_DIST;
    Surface co;
    for (int i = 0; i < MAX_MARCHING_STEPS; i++) {
        vec3 p = ro + depth * rd;
        co = scene(p);
        depth += co.sd;
        if (co.sd < PRECISION || depth > MAX_DIST) break;
    }
    co.sd = depth;
    return co;
}

mat3 camera(vec3 cameraPos, vec3 lookAtPoint) {
    vec3 cd = normalize(lookAtPoint - cameraPos);
    vec3 cr = normalize(cross(vec3(0.0, -1.0, 0.0), cd));
    vec3 cu = normalize(cross(cd, cr));
    return mat3(-cr, cu, -cd);
}

void main() {
    vec2 center = vec2(0.5, 0.5);
    vec2 uv = openfl_TextureCoordv.xy - center; 
    uv.y *= ASPECTRATIOINV;

    mat2 rotation = mat2(
        cos(tilt), -sin(tilt),
        sin(tilt), cos(tilt)
    );

    vec3 ro = vec3(x + 3.0, y, z);
    vec3 lp = vec3(0.0);
    vec3 rd = camera(ro, lp) * normalize(vec3(uv * rotation, -1.0));

    Surface co = rayMarch(ro, rd);

    vec4 outCol;
    if (co.sd > MAX_DIST) {
        outCol = vec4(0.0, 0.0, 0.0, 1.0);
    } else {
        vec4 tex = flixel_texture2D(bitmap, repeatUV(getUV3D(co.p)));
        outCol = mix(vec4(0.0, 0.0, 0.0, 1.0), tex, strength);
    }

    gl_FragColor = outCol;
} 