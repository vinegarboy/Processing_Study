#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_LIGHT_SHADER

uniform float fraction;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;

void main() {
  float intensity = max(0.0, dot(vertLightDir, vertNormal));
  for(int i = 0;i<100;i+=10){
    if(intensity%i<10){
      intensity = i;
    }
  }
  vec3 c = vertColor.xyz * intensity;
  float g = 0.29 * c.x + 0.58 * c.y + 0.11 * c.z;
  gl_FragColor = vec4(1.07*g, 0.74*g, 0.43*g, 1.0);
}