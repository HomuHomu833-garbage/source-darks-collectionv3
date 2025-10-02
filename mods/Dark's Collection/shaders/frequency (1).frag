#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define texture flixel_texture2D

uniform float iTime;
uniform float strength;
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;

uniform float iTimeDelta;
uniform float iFrameRate;
uniform int iFrame;
#define iChannelTime float[4](iTime, 0., 0., 0.)
#define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
uniform vec4 iMouse;
uniform vec4 iDate;

vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
	vec4 color = texture2D(bitmap, coord, bias);
	if (!hasTransform) return color;
	if (color.a == 0.0) return vec4(0.0);
	if (!hasColorTransform) return color * openfl_Alphav;
	color = vec4(color.rgb / color.a, color.a);
	mat4 colorMultiplier = mat4(0);
	colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
	colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
	colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
	colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
	color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
	if (color.a > 0.0)
		return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
	return vec4(0.0);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	vec2 uv = fragCoord.xy / iResolution.xy;
	vec4 baseColor = texture(iChannel0, uv);
	vec3 backgroundColor = baseColor.rgb;

	float bars = 15.0;
	float spacing = 1.4;

	float yMirror = abs(2.0 * uv.y - 1.0);
	float band = floor(yMirror * bars) / bars;

	float fVFreq = yMirror * 5.14;
	float squarewave = sign(sin(fVFreq * bars) + 1.0 - spacing);

	float fSample = texture(iChannel0, vec2(0.75, band)).x;
	float fft = squarewave * fSample * 0.5;

	float radius = 0.25;

	float barLeft  = step(abs(uv.x - 0.0), fft) * smoothstep(radius, 0.0, uv.x);
	float barRight = step(abs(uv.x - 1.0), fft) * smoothstep(radius, 0.0, 1.0 - uv.x);
	float barShape = barLeft + barRight;

	float edgeWidth = 0.01;
	float barLeftEdge  = step(abs(uv.x - 0.0), fft + edgeWidth) * smoothstep(radius + edgeWidth, radius, uv.x);
	float barRightEdge = step(abs(uv.x - 1.0), fft + edgeWidth) * smoothstep(radius + edgeWidth, radius, 1.0 - uv.x);
	float barEdges = (barLeftEdge + barRightEdge) - barShape;
	barEdges = clamp(barEdges, 0.0, 1.0);

	vec3 colorWithBar = mix(baseColor.rgb, vec3(0.0), barShape * strength);
	colorWithBar = mix(colorWithBar, vec3(0.0), barEdges);

	fragColor = vec4(colorWithBar, baseColor.a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}