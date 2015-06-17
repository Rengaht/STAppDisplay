
uniform float trans_t;

uniform sampler2D texture;
varying vec4 vertTexCoord;

uniform float sampleDist = 1.0;
uniform float sampleStrength = 3.2; 


void main(){

 // vec2 cen=vec2(0.5,0.5)-vertTexCoord.xy;
 // vec2 mcen=(trans_t)*log(length(cen))*normalize(cen);

 // gl_FragColor=texture2D(texture,vertTexCoord.xy+mcen);


    float samples[10] =
   float[](-0.08,-0.05,-0.03,-0.02,-0.01,0.01,0.02,0.03,0.05,0.08);
 
    // 0.5,0.5 is the center of the screen
    // so substracting uv from it will result in
    // a vector pointing to the middle of the screen
    
	vec2 uv=vertTexCoord.st;
	vec2 dir =0.5-uv; 
 
    // calculate the distance to the center of the screen
    float dist = sqrt(dir.x*dir.x + dir.y*dir.y); 
 
    // normalize the direction (reuse the distance)
    dir = dir/dist; 
 
    // this is the original colour of this fragment
    // using only this would result in a nonblurred version
    vec4 color = texture2D(texture,uv); 
 
    vec4 sum = color;
 
    // take 10 additional blur samples in the direction towards
    // the center of the screen
    for (int i = 0; i < 10; i++)
    {
      sum += texture2D( texture, uv + dir * samples[i] * sampleDist );
    }
 
    // we have taken eleven samples
    sum *= 1.0/11.0;
 
    // weighten the blur effect with the distance to the
    // center of the screen ( further out is blurred more)
    float t = dist * sampleStrength;
    t = clamp( t ,0.0,1.0); //0 &lt;= t &lt;= 1
 
    //Blend the original color with the averaged pixels
    gl_FragColor = mix( color, sum, t );

}