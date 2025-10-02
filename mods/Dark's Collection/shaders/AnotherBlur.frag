#pragma header

vec2 fragCoord = openfl_TextureCoordv * openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
#define iChannel0 bitmap
#define texture texture2D
#define fragColor gl_FragColor

const int   c_samplesX    = 10;  // must be odd
const int   c_samplesY    = 10;  // must be odd
const int   c_halfSamplesX = c_samplesX / 2;
const int   c_halfSamplesY = c_samplesY / 2;

uniform float amt;

float gaussian(float sigma, float x) {
    float s = sigma * sigma;
    return exp(-x * x / (2.0 * s));
}

vec3 BlurredPixel(in vec2 uv) {
    float sigmaX = amt + 0.001;
    float sigmaY = amt + 0.001;

    float pixelSizeX = 1.0 / openfl_TextureSize.x;
    float pixelSizeY = 1.0 / openfl_TextureSize.y;

    float weightsX[c_samplesX];
    float weightsY[c_samplesY];

    float total = 0.0;
    for (int i = 0; i < c_samplesX; i++) {
        float offset = float(i - c_halfSamplesX);
        float w = gaussian(sigmaX, offset);
        weightsX[i] = w;
    }

    for (int j = 0; j < c_samplesY; j++) {
        float offset = float(j - c_halfSamplesY);
        float w = gaussian(sigmaY, offset);
        weightsY[j] = w;
    }

    vec3 color = vec3(0.0);

    for (int y = 0; y < c_samplesY; y++) {
        float offsetY = float(y - c_halfSamplesY) * pixelSizeY;
        float wy = weightsY[y];
        for (int x = 0; x < c_samplesX; x++) {
            float offsetX = float(x - c_halfSamplesX) * pixelSizeX;
            float wx = weightsX[x];
            float w = wx * wy;
            color += texture(iChannel0, uv + vec2(offsetX, offsetY)).rgb * w;
            total += w;
        }
    }

    return color / total;
}

void main() {
    vec2 uv = fragCoord.xy / iResolution.xy;
    fragColor = vec4(BlurredPixel(uv), 1.0);
}