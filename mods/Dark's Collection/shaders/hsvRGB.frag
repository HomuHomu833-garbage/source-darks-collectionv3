// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header


// SimpleHSV_Circling.glsl  2023-12-08

// Let colors simply run through HSV space.
// Show original colors on MousePressed.

vec3 rgb2hsv(vec3 color) 
{
  vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
  vec4 p = mix(vec4(color.bg, K.wz), vec4(color.gb, K.xy), step(color.b, color.g));
  vec4 q = mix(vec4(p.xyw, color.r), vec4(color.r, p.yzx), step(p.x, color.r));

  float d = q.x - min(q.w, q.y);
  float e = 1.0e-10;
  return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 HSVtoRGB(vec3 hsv)      // Hue-Saturation-Value to Red-Green-Blue
{
  return((clamp(abs(fract(hsv.x +vec3(0.,2./3.,1./3.))*2.-1.)*3.-1.,0.,1.)-1.)*hsv.y+1.)*hsv.z;  
}

vec3 smooth_hsv2rgb(vec3 c)  // same of above replacing clamp by smoothstep 
{
  return c.z*(1.-c.y*smoothstep(2.,1.,abs(mod(c.x*6.+vec3(0,4,2),6.) -3.)));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) 
{
  vec2 uv = fragCoord.xy / iResolution.xy;
  vec4 color = texture(iChannel0, uv);
  vec3 hsv = rgb2hsv(color.rgb);
  hsv.x += iTime * 0.1;
  fragColor = vec4(smooth_hsv2rgb(hsv), texture(iChannel0, fragCoord / iResolution.xy).a);
}


void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}