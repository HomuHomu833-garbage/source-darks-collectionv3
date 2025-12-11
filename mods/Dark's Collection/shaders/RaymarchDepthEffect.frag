#pragma header

//built off of a shadertoy tutorial: https://inspirnathan.com/posts/53-shadertoy-tutorial-part-7/

const int MAX_MARCHING_STEPS = 50;
const int MAX_MARCHING_STEPS_REFLECTION = 150;
const float MIN_DIST = 0.0;
const float MAX_DIST = 25.0;
const float PRECISION = 0.001;
const float EPSILON = 0.0005;
const float PI = 3.14159;
const float ASPECTRATIO = 1.77777;
const float ASPECTRATIOINV = 0.5625;

uniform float tilt;

//camera stuffs
uniform float x;
uniform float y;
uniform float z;
uniform float pitch;
uniform float yaw;

uniform float boxX0;
uniform float boxY0;
uniform float boxZ0;

uniform float boxAngleX0;
uniform float boxAngleY0;
uniform float boxAngleZ0;

uniform float boxDepth;

uniform float strength;

struct Surface {
    float sd; // signed distance value
    vec3 p;
    vec4 col; // color
};

// Rotation matrix around the X axis.
mat3 rotateX(float theta) 
{
    float c = cos(theta);
    float s = sin(theta);
    return mat3(
        vec3(1.0, 0.0, 0.0),
        vec3(0.0, c, -s),
        vec3(0.0, s, c)
    );
}

// Rotation matrix around the Y axis.
mat3 rotateY(float theta)
{
    float c = cos(theta);
    float s = sin(theta);
    return mat3(
        vec3(c, 0.0, s),
        vec3(0.0, 1.0, 0.0),
        vec3(-s, 0.0, c)
    );
}

// Rotation matrix around the Z axis.
mat3 rotateZ(float theta) 
{
    float c = cos(theta);
    float s = sin(theta);
    return mat3(
        vec3(c, -s, 0.0),
        vec3(s, c, 0.0),
        vec3(0.0, 0.0, 1.0)
    );
}

vec3 opCheapBend(vec3 p, float freq, float amp)
{
    float c = cos(freq*p.x)*amp;
    vec3  q = vec3(p.x,c+p.y,p.z);
    return q;
}

///////////////////////

vec2 repeatUV(vec2 uv)
{
    if ((uv.x > 1.0 || uv.x < 0.0) && abs(mod(uv.x, 2.0)) > 1.0)
        uv.x = (0.0-uv.x)+0.99;
    if ((uv.y > 1.0 || uv.y < 0.0) && abs(mod(uv.y, 2.0)) > 1.0)
        uv.y = (0.0-uv.y)+1.0;

    return vec2(abs(mod(uv.x, 1.0)), abs(mod(uv.y, 1.0)));
}

vec2 getUV3D(vec3 p)
{
    vec2 uvThing = vec2(p.x,p.y) * 0.5;
    vec2 center = vec2(-0.5, -0.5);
    uvThing.y *= ASPECTRATIO;
    uvThing += center;
    uvThing.y = -uvThing.y;
    uvThing.x = -uvThing.x;  
    return uvThing;
}

const float upperBound = 10.0;
const float g = sin(atan(1.,upperBound));

float wrapAngle(float angleRad) {
    return mod(angleRad, 2.0 * PI);
}

///////////////////////
Surface sdBoxIndependent(vec3 p, vec3 scale, vec3 offset, vec4 col,
                         float angleX, float angleY, float angleZ)
{
    mat3 transform = rotateZ(angleZ) * rotateY(angleY) * rotateX(angleX);
    p = (p - offset) * transform;

    col = flixel_texture2D(bitmap, repeatUV(getUV3D(p)));

    if (col.a > 0.2) {
        p.z -= boxDepth;
        if (p.z <= boxDepth) {
            col.a = 1.0;
        }
    }

    p.z *= g;

    vec3 q = abs(p) - scale;
    float d = length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0);

    return Surface(d, p, col);
}

////////////////////////////

//checks which object is in front
Surface opUnion(Surface obj1, Surface obj2) {
    if (obj2.sd < obj1.sd) return obj2;
    return obj1;
}

//////////////////
Surface scene(vec3 p) {
    float rad = PI / 180.0;

float angleX = wrapAngle(boxAngleY0 * 180.0 * rad);
float angleY = wrapAngle((boxAngleX0 + 0.054) * 180.0 * rad); 
float angleZ = wrapAngle(boxAngleZ0 * rad);

return sdBoxIndependent(p,
                        vec3(1.0, ASPECTRATIOINV, 0.01),
                        vec3(boxX0 + 0.85, boxY0, boxZ0 + 0.90),
                        vec4(0.0, 0.0, 0.0, 0.0),
                        angleX,
                        angleY,
                        angleZ);
}

/////////////////////////////

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

vec3 getLookAt(float y, float p)
{
    float rad = (PI/180.0);
    return vec3(cos(y * rad) * cos(p * rad), sin(p * rad), sin(y * rad) * cos(p * rad));
}

void main()
{
    vec2 center = vec2(0.5, 0.5);
    vec2 uv = openfl_TextureCoordv.xy - center;
    uv.y *= ASPECTRATIOINV;
    
    vec4 backgroundColor = vec4(0.0,0.0,0.0,0.0);

    mat2 rotation = mat2(
        cos(tilt), -sin(tilt),
        sin(tilt), cos(tilt)
    );

    vec3 ro = vec3(x + 0.5, y, z + 2.99);
    vec3 lp = getLookAt(yaw, pitch);
    vec3 rd = camera(ro, lp) * normalize(vec3(uv*rotation, -1.0));

    Surface co = rayMarch(ro, rd);

    vec4 col = co.sd > MAX_DIST ? backgroundColor : co.col;

    col = mix(backgroundColor, col, strength);

    gl_FragColor = col;
}