#pragma header
uniform float uTime;

uniform float uSpeed;
uniform float uFrequency;

uniform bool uEnabled;
uniform float uWaveAmplitude;

vec2 sineWave(vec2 pt)
{
    float x = 0.0;
    float y = 0.0;
        
    float offsetX = sin(pt.y * uFrequency + uTime * uSpeed) * (uWaveAmplitude / pt.x * pt.y);
    float offsetY = sin(pt.x * uFrequency - uTime * uSpeed) * (uWaveAmplitude / pt.y * pt.x);
    pt.x += offsetX;
    pt.y += offsetY;

    return vec2(pt.x + x, pt.y + y);
}

void main()
{
    vec2 uv = sineWave(openfl_TextureCoordv);
    gl_FragColor = texture2D(bitmap, uv);
}