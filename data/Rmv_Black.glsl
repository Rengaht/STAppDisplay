#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;


void main(){

  vec4 col=texture2D(texture, vertTexCoord.st);
  
  // if(col==vec4(0,0,0,1)) gl_FragColor=vec4(1,0,0,1);
  // else 
  gl_FragColor=vec4(1,0,0,1);


}