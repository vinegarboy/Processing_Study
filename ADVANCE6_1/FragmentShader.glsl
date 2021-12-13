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
  if( intensity <= 0.01 ) intensity = 0.5;
  else if( intensity <= 0.3) intensity = 0.7;
  else intensity = 1.0;
  gl_FragColor = vec4(vertColor.x * intensity,vertColor.y * intensity,vertColor.z * intensity,1);
}