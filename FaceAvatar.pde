
boolean DRAW_DOOR=true;

class FaceAvatar{
	
	float x,y;
	PImage face_image;
	String user_name;
	int icharacter;
	int sarr_index;

	private AvatarMotion mmotion;
	


	FaceAvatar(int icharacter_,int arr_index_,BuildBlock[] arr_block){
		setup(icharacter_,arr_index_,arr_block);
	}
	FaceAvatar(String user_,PImage face_,int icharacter_,int arr_index_,BuildBlock[] arr_block){
		setup(user_,face_,icharacter_,arr_index_,arr_block);
	}	
	void setup(int icharacter_,int arr_index_,BuildBlock[] arr_block){
		setup("no_define",null,icharacter_,arr_index_,arr_block);
	}
	void setup(String user_,PImage face_,int icharacter_,int arr_index_,BuildBlock[] arr_block){
	
		face_image=face_;
		user_name=user_;
		icharacter=icharacter_;
		sarr_index=arr_index_;
		
		mmotion=new AvatarMotion(arr_block);
		
	}
	void draw(PGraphics pg,PImage char_img,PImage bubble_img){

		
		pg.pushStyle();
		pg.imageMode(CENTER);
		pg.pushMatrix();
		pg.translate(mmotion.pos.x,mmotion.pos.y);
		pg.scale(mmotion.depth_scale);


		if(mmotion.istage==AvatarAction.BORN){

			if(DRAW_DOOR){
				PGraphics tmp_pg=createGraphics(250,250);
				tmp_pg.beginDraw();
				tmp_pg.fill(40,10,137);
				tmp_pg.rect(71,45,110,160);

				tmp_pg.imageMode(CENTER);
				tmp_pg.translate(125,125);
				
				int door_fr=(mmotion.mscale>.5)?(int)((mmotion.mscale-.5)*46):0;

				if(door_fr!=0){
					drawAvatar(tmp_pg,face_image);
					if(char_img!=null) tmp_pg.image(char_img,0,0);
				}
				
				tmp_pg.image(arr_img_door[door_fr],0,-5);

				tmp_pg.endDraw();

				//pg.image(tmp_pg,0,0);
				float door_scale=(mmotion.mscale>.5)?1:sin(PI/2*mmotion.mscale*2);
				
				pg.noStroke();
				pg.beginShape();
				pg.texture(tmp_pg);
					pg.vertex(-250/2,-250/2,0,0);
					pg.vertex(250/2,-250/2,250,0);
					pg.vertex(250/2,250*(-.5+door_scale),250,door_scale*250);
					pg.vertex(-250/2,250*(-.5+door_scale),0,door_scale*250);
				pg.endShape();
			}else{
				pg.scale(mmotion.mscale);
				drawAvatar(pg,face_image);
				if(char_img!=null) pg.image(char_img,0,0);
					
			}
			// if(mmotion.mscale>.5){
			// 	drawAvatar(pg,face_image);
			// 	if(char_img!=null) pg.image(char_img,0,0);
			// }
		}else{
			if(DRAW_DOOR && mmotion.mscale>0){
				PGraphics tmp_pg=createGraphics(250,250);
				tmp_pg.beginDraw();
				tmp_pg.imageMode(CENTER);
					
				tmp_pg.fill(40,10,137);
				tmp_pg.rect(71,45,110,160);

				tmp_pg.translate(250/2,250/2);

				int door_fr=(mmotion.mscale>.5)?(int)((mmotion.mscale-.5)*46):0;
				tmp_pg.image(arr_img_door[(int)(mmotion.mscale*23)],0,-5);

				tmp_pg.endDraw();

				//pg.image(tmp_pg,0,0);
				float door_scale=(mmotion.mscale>.5)?1:abs(sin(-PI/2*mmotion.mscale*2));
				
				pg.pushMatrix();
				pg.translate(-mmotion.pos.x+mmotion.land_pos.x,-mmotion.pos.y+mmotion.land_pos.y);

				pg.noStroke();
				pg.beginShape();
				pg.texture(tmp_pg);
					pg.vertex(-250/2,-250/2,0,0);
					pg.vertex(250/2,-250/2,250,0);
					pg.vertex(250/2,250*(-.5+door_scale),250,door_scale*250);
					pg.vertex(-250/2,250*(-.5+door_scale),0,door_scale*250);
				pg.endShape();

				pg.popMatrix();

				mmotion.mscale-=DRAW_DOOR?mmotion.scale_vel:mmotion.scale_vel*5;
			}

			//pg.scale(mmotion.mscale);			

		


			drawAvatar(pg,face_image);
			if(char_img!=null) pg.image(char_img,0,0);
			//pg.text(user_name,0,0);
			mmotion.speak_bubble.draw(pg,0,-100,bubble_img);

		}


		pg.popMatrix();
		pg.popStyle();

		if(mmotion.is_giraffe){
			pg.pushMatrix();
			float t=mmotion.action_delay;				
			if(t<GIRAFFE_SPAN/2) pg.translate(constrain(mmotion.giraffe_dest*sin(t/GIRAFFE_SPAN*PI)-343-5,-343,0),mmotion.pos.y-50);
			else pg.translate(constrain(mmotion.pos.x-343,-343,0)-5,constrain(mmotion.pos.y-50,50,250));
			pg.scale(mmotion.depth_scale);
			
			pg.image(img_giraffe,0,0);
			
			pg.popMatrix();
		}

		if(DRAW_DEBUG) mmotion.drawDebugRegion(pg);

	}
	void drawAvatar(PGraphics pg,PImage face_image){
		if(face_image!=null){
				switch(icharacter){
					case 0:
						pg.image(face_image,5,-28);	
						break;
					case 10:
						pg.image(face_image,0,-13);	
						break;
					case 11:
						pg.image(face_image,-5,-18);	
						break;
					case 12:
					pg.pushMatrix();
						pg.translate(18,-52);
						pg.rotate(radians(18));
						pg.scale(.68,.42);
						pg.image(face_image,0,0);	
					pg.popMatrix();
						break;
					default:
						pg.image(face_image,0,-28);	
						break;
				}
			} 


	}


	void update(){
		mmotion.update(null,null);
		
	}
	void update(ArrayList<FaceAvatar> arr_avatar,BuildBlock[] arr_build){
		ArrayList<AvatarMotion> arr_motion=new ArrayList<AvatarMotion>();
		for(FaceAvatar av:arr_avatar) 
			if(av!=this) arr_motion.add(av.mmotion);

		mmotion.update(arr_motion,arr_build);
		
	}

	int getCurFrame(){
		return (int)(mmotion.img_seq.icur_frame);
	}
	int getSpeakBubbleIndex(){
		return mmotion.speak_bubble.ibubble;
	}
	void play(){
		mmotion.img_seq.play();
		
	}
	Float getDepth(){
		return new Float(mmotion.pos.y);
	}
	Float getPosX(){
		return mmotion.pos.x;
	}
	void goOut(){
		mmotion.startGoOut();
	}
	boolean isDead(){
		return mmotion.istage==AvatarAction.DEAD;
	}
	boolean isGoingOut(){
		return mmotion.istage==AvatarAction.LEAVE;	
	}

}

class SpeakBubble{
	int ibubble;
	boolean isplaying=false;
	private int istage=0;
	private float scalee=0;
	FrameAnimation frani_start;
	FrameAnimation frani_end;
	SpeakBubble(int index){
		
		frani_start=new FrameAnimation(12);
		frani_end=new FrameAnimation(12,40);
		ibubble=index;
		Reset();
	}
	void setIndex(int set_index){
		//if(istage!=0 && isplaying) return;

		ibubble=set_index;
		Reset();
		Restart();
	}
	void Reset(){
		scalee=0;
		isplaying=false;
		istage=0;
		//frani.setDelay(0);
	}
	void Restart(){
		isplaying=true;
		istage=1;
		frani_start.Restart();
	}
	void draw(PGraphics pg,float x_,float y_,PImage bubble_img){
		
		if(istage==0 || istage==3) return;

		pg.pushStyle();
		pg.imageMode(CENTER);

		pg.pushMatrix();
		pg.translate(x_,y_);
		
		if(ibubble==5||ibubble==6||ibubble==7||ibubble==8) pg.translate(-50,0);
		else pg.translate(50,0);

		if(scalee==0) pg.rotate(PI/40*sin((float)frameCount/3));
		
		if(istage==1) pg.scale(scalee);
		else if(istage==2) pg.scale(1-scalee);
		
			pg.image(bubble_img,0,0);
		
		pg.popMatrix();

		pg.popStyle();
	}

	void update(){
		//if(!isplaying) return;

		switch(istage){
			case 1:
				frani_start.Update();
				scalee=frani_start.GetPortion();
				if(frani_start.reachEnd()){
					frani_end.Restart();
					istage=2;
				}
				break;
			case 2:
				frani_end.Update();
				scalee=frani_end.GetPortion();
				if(frani_end.reachEnd()){
					istage=3;
				}
				break;
		}
		
		
	}
	boolean isFinished(){
		return istage==3;
	}


}