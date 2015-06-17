uniform float trans_t;
uniform sampler2D texture;
uniform sampler2D trans_texture;
uniform sampler2D orig_texture;
uniform sampler2D motion_texture;

varying vec4 vertTexCoord;

void main()
{ 
    vec2 MotionVector = //vec2(-5.0/400.0,-5.0/400.0);
            texture2D(motion_texture, vertTexCoord).xy-vec2(.5,.5);
    //MotionVector*=2.0;
   

    vec2 TexCoord = vertTexCoord.xy;


    vec4 orig_color = vec4(0.0);
    vec4 trans_color= vec4(0.0);
    orig_color += texture2D(orig_texture, TexCoord) * 0.4;
    trans_color += texture2D(trans_texture, TexCoord) * 0.3;
    
    TexCoord -= MotionVector;
    orig_color += texture2D(orig_texture, TexCoord) * 0.3;
    trans_color += texture2D(trans_texture, TexCoord) * 0.4;
    
    TexCoord -= MotionVector;
    orig_color += texture2D(orig_texture, TexCoord) * 0.2;
    trans_color += texture2D(trans_texture, TexCoord) * 0.1;

    TexCoord -= MotionVector;
    orig_color += texture2D(orig_texture, TexCoord) * 0.1;
    trans_color += texture2D(trans_texture, TexCoord) * 0.2;
    

    vec4 dest_color=orig_color*(1.0-trans_t)+trans_color*trans_t;

     gl_FragColor =dest_color;
    // if(gl_FragColor==vec4(1.0)) gl_FragColor=vec4(0.0);
    // gl_FragColor=texture2D(orig_texture,TexCoord);
     //gl_FragColor=vec4(1.0,0.0,0.0,1.0);
}