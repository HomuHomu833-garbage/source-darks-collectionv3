#pragma header

const int EFFECT_TYPE_DREAMY = 0;
const int EFFECT_TYPE_WAVY = 1;
const int EFFECT_TYPE_HEAT_WAVE_HORIZONTAL = 2;
const int EFFECT_TYPE_HEAT_WAVE_VERTICAL = 3;
const int EFFECT_TYPE_FLAG = 4;

uniform float iTime;
uniform int effectType;
uniform float uSpeed;
uniform float uFrequency;
uniform float uWaveAmplitude;

float getEdgeFactor(vec2 uv) {
    vec2 centerDist = abs(uv - vec2(0.5));
    float threshold = 0.46;
    float factor = smoothstep(threshold, threshold + 0.05, max(centerDist.x, centerDist.y));
    return 1.0 - factor;
}

vec2 sineWave(vec2 pt) {
    float x = 0.0;
    float y = 0.0;
    float edgeFactor = getEdgeFactor(pt);

    if (edgeFactor > 0.0) {
        if (effectType == EFFECT_TYPE_DREAMY) {
            float w = 1.0 / openfl_TextureSize.y;
            float h = 1.0 / openfl_TextureSize.x;

            pt.x = floor(pt.x / h) * h;
            float offsetX = sin(pt.x * uFrequency + iTime * uSpeed) * uWaveAmplitude * edgeFactor;
            pt.y += floor(offsetX / w) * w;
            pt.y = floor(pt.y / w) * w;

            float offsetY = sin(pt.y * (uFrequency / 2.0) + iTime * (uSpeed / 2.0)) * (uWaveAmplitude / 2.0) * edgeFactor;
            pt.x += floor(offsetY / h) * h;
        }
        else if (effectType == EFFECT_TYPE_WAVY) {
            float offsetY = sin(pt.x * uFrequency + iTime * uSpeed) * uWaveAmplitude * edgeFactor;
            pt.y += offsetY;
        }
        else if (effectType == EFFECT_TYPE_HEAT_WAVE_HORIZONTAL) {
            x = sin(pt.x * uFrequency + iTime * uSpeed) * uWaveAmplitude * edgeFactor;
        }
        else if (effectType == EFFECT_TYPE_HEAT_WAVE_VERTICAL) {
            y = sin(pt.y * uFrequency + iTime * uSpeed) * uWaveAmplitude * edgeFactor;
        }
        else if (effectType == EFFECT_TYPE_FLAG) {
            y = sin(pt.y * uFrequency + 10.0 * pt.x + iTime * uSpeed) * uWaveAmplitude * edgeFactor;
            x = sin(pt.x * uFrequency + 5.0 * pt.y + iTime * uSpeed) * uWaveAmplitude * edgeFactor;
        }
    }

    return vec2(pt.x + x, pt.y + y);
}

void main() {
    vec2 uv = sineWave(openfl_TextureCoordv);
    gl_FragColor = texture2D(bitmap, uv);
}