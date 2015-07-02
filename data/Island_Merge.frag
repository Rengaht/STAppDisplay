#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif


uniform sampler2D texture;

uniform sampler2D src_texture;
uniform float t_port;

varying vec4 vertColor;
varying vec4 vertTexCoord;

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main(){
  
  vec2 tex_pos=vertTexCoord.xy;
  // tex_pos.y=1.0-vertTexCoord.y;
  vec4 col=texture2D(src_texture, tex_pos);
  
  if(sin(tex_pos.x*2)*cos(tex_pos.y*2)<=t_port) gl_FragColor=col;
  else gl_FragColor=vec4(0);

  // gl_FragColor=vec4(col.r,col.g,col.b,min(t_port,col.a));

}