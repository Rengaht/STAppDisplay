class ImageSeq{
	
	String file_name;
	float mframe;
	float icur_frame;
	//PImage[] arr_img;
	float frame_vel=12.0/60.0;

	boolean isplaying=false;
	boolean looped=true;
	boolean reverse_looped=false;
	boolean reverse=false;

	ImageSeq(int _mframe){
		mframe=_mframe;
	}
	ImageSeq(String _file_name,int _mframe){
		file_name=_file_name;
		mframe=_mframe;
		
		// arr_img=new PImage[mframe];
		// for(int i=0;i<mframe;++i){
		// 	arr_img=loadImage(file_name+"_"+nf(i,5)+".png");
		// }

	}
	void update(){
		if(!isplaying){
			icur_frame=0;
			return;	
		} 

		if(reverse_looped){
			if(!reverse){
				if(icur_frame<mframe) icur_frame+=frame_vel;
				if(icur_frame>=mframe){
					reverse=true;
					// icur_frame=mframe-1;
				}
			}else{
				if(icur_frame>0) icur_frame-=frame_vel;
				if(icur_frame<=0){
					if(looped) reverse=false;
					else isplaying=false;
				}
			}
			// println((int)icur_frame);
		}else{
			if(icur_frame<mframe) icur_frame+=frame_vel;
			if(icur_frame>=mframe){
				if(looped) icur_frame=0;
				else isplaying=false;
			}	
		}
		// icur_frame=constrain(icur_frame,0,mframe-1);
	}

	void play(){
		reset();
		resume();
	}
	void pause(){
		isplaying=false;
	}
	void resume(){
		isplaying=true;
	}
	void reset(){
		icur_frame=0;
		reverse=false;
		pause();
	}
	void draw(PGraphics pg,float x,float y,PImage seq_img){
		//pg.image(arr_img[icur_frame],x,y);
		pg.image(seq_img,x,y);
	}

	int getFrame(){
		return (int)constrain(icur_frame,0,mframe-1);
	}

}