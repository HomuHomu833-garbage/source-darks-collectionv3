#pragma header

uniform float dist;
uniform float zoom;
uniform float angle;
uniform float iTime;
uniform float x;
uniform float y;

vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;

vec4 render( vec2 uv )
{
    // Mirror repeat logic from mirrorRepeat.frag
    if ((uv.x > 1.0 || uv.x < 0.0) && abs(mod(uv.x, 2.0)) > 1.0)
        uv.x = (0.0-uv.x)+1.0;
    if ((uv.y > 1.0 || uv.y < 0.0) && abs(mod(uv.y, 2.0)) > 1.0)
        uv.y = (0.0-uv.y)+1.0;
    return texture2D(bitmap, vec2(abs(mod(uv.x, 1.0)), abs(mod(uv.y, 1.0))));
}

void main() {
    vec4 channelFactor = vec4(0.9, 1.0, 1.3, 1.0);
    vec4 strength = dist * channelFactor;
    
    vec2 uv = fragCoord.xy / iResolution.xy;

    // Apply zoom, rotation, and offset (like mirrorRepeat/BarrelBlurEffect)
    vec2 center = vec2(0.5, 0.5);
    uv -= center;
    // Zoom
    uv *= zoom;
    // Rotation
    float angInRad = radians(angle);
    mat2 rotation = mat2(
        cos(angInRad), -sin(angInRad),
        sin(angInRad),  cos(angInRad)
    );
    uv = rotation * uv;
    // Offset
    uv += center;
    uv.x += x;
    uv.y += y;
    
    vec2 p = (uv - 0.5) * 2.0; // map [0, 1] to [-1, 1]
    float theta = atan(p.y, p.x);
    float rd = length(p);
    vec4 ru = rd * (1.0 + strength * rd * rd);
    vec2 dir = vec2(cos(theta), sin(theta)); 
    vec2 qr = dir * ru.x / 2.0 + 0.5;
    vec2 qg = dir * ru.y / 2.0 + 0.5;
    vec2 qb = dir * ru.z / 2.0 + 0.5;
    vec2 qa = dir * ru.w / 2.0 + 0.5;
    
    gl_FragColor = vec4(
        render(qr).x,
        render(qg).y,
        render(qb).z,
        render(qa).w);
}