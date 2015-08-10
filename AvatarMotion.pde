final float MOTION_VEL=6;
//final PVector MOTION_BOUND=new PVector(1024,400);
final float MOTION_BOUND_X[]={-50,4060};
final float MOTION_BOUND_Y[]={35,400,50,160};

final PVector AVATAR_THRES=new PVector(135,35);
final PVector AVATAR_SIZE=new PVector(80,160);

final float VEL_CONTROL=.25;

final float GIRAFFE_SPAN=240;

class AvatarMotion{
	
	float vel_control=VEL_CONTROL;

	PVector pos,land_pos;
	PVector vel,acc;
	float mscale,depth_scale;
	float scale_vel=.01;

	AvatarAction istage;
	ImageSeq img_seq;

	SpeakBubble speak_bubble;
	float action_delay=0;

	boolean is_intersecting=false;
	
	float bridge_vel=0;

	boolean is_giraffe=false;
	float giraffe_dest;

	AvatarMotion(BuildBlock[] arr_block){
		PVector _pos=getRandomBornPlace();
		int mrand=0;
		while(mrand<12 && regionIntersect(_pos,arr_block)){
			_pos=getRandomBornPlace();
			mrand++;
		}
		setup(_pos);
	}
	PVector getRandomBornPlace(){
		float _posx=random(200,824);
		float _posy=random(120,300);
		if(random(2)<1) _posx+=Right_Screen_X;

		return new PVector(_posx,_posy);		
	}
	boolean regionIntersect(PVector _pos,BuildBlock[] arr_block){
		
		if(arr_block==null) return false;

		for(BuildBlock bb:arr_block){
			// if(abs(bb.pos.x-_pos.x)<bb.sizee.x/2 || abs(bb.pos.y-_pos.y)<bb.sizee.y/2){
			// 	return true;
			// }
			if(regionIntersect(_pos,bb,false)) return true;
		}
		return false;
	}
	boolean regionIntersect(PVector _pos,BuildBlock bb,boolean feet_only){

		//if(bb==null) return false;
		if(feet_only)
			return !(bb.pos.x+bb.sizee.x<_pos.x-AVATAR_SIZE.x/2*depth_scale || bb.pos.x>_pos.x+AVATAR_SIZE.x/2*depth_scale || 
					bb.pos.y+bb.sizee.y<_pos.y+AVATAR_SIZE.y/4*depth_scale || bb.pos.y>_pos.y+AVATAR_SIZE.y/2*depth_scale );
		else
			return !(bb.pos.x+bb.sizee.x<_pos.x-AVATAR_SIZE.x/2*depth_scale || bb.pos.x>_pos.x+AVATAR_SIZE.x/2*depth_scale || 
					bb.pos.y+bb.sizee.y<_pos.y-AVATAR_SIZE.y/2*depth_scale || bb.pos.y>_pos.y+AVATAR_SIZE.y/2*depth_scale );
	}

	AvatarMotion(PVector _pos){
		setup(_pos);
	}
	void setup(PVector _pos){
		pos=_pos.get();
		land_pos=pos.get();
		vel=new PVector(MOTION_VEL,0);
		vel.rotate(random(TWO_PI));

		acc=new PVector(0,0);

		istage=AvatarAction.BORN;
		mscale=0;
		depth_scale=1;

		img_seq=new ImageSeq(6);
		img_seq.play();

		action_delay=0;
		speak_bubble=new SpeakBubble((int)random(10));

	}
	void update(ArrayList<AvatarMotion> arr_motion,BuildBlock[] arr_block){
		switch(istage){
			case BORN: // landing
				
				if(mscale<1) mscale+=DRAW_DOOR?scale_vel:scale_vel*5;
				else{
					mscale=1;
					istage=AvatarAction.WALK;	
				} 
				break;

			case WALK: // walking
				
				if(arr_motion!=null) detectAvatarCollision(arr_motion);
				if(arr_block!=null) detectBuildBlockCollision(arr_block);
				
				detectBoundary();
				detectBridge();
				updatePos();
				
				updateScale();
				if(arr_motion!=null && arr_block!=null) detectTalking(arr_motion,arr_block);

				if(isInRange() && random(250)<1 && action_delay==0){
					istage=AvatarAction.PAUSE;
					action_delay=90+random(60);
					// img_seq.pause();
				}
				break;
			case PAUSE:
				if(action_delay<=0){
					istage=AvatarAction.WALK;
					resetVel();
					// img_seq.resume();
				}
				if(arr_motion!=null && arr_block!=null) detectTalking(arr_motion,arr_block);

				break;
			case TALK: //talking
				if(speak_bubble.isFinished()){
					istage=AvatarAction.WALK;
					action_delay=60+random(60);
					speak_bubble.Reset();
					resetVel();					
				}
				speak_bubble.update();
				break;
			case BRIDGE:
				
				if(arr_motion!=null) detectAvatarCollision(arr_motion);
				detectBoundary();
				acc.add(bridge_vel,0,0);
				updatePos();
				updateScale();

				detectBridge();
				break;
			case LEAVE: // go out
				if(arr_motion!=null) detectCollision(arr_motion,arr_block);
				vel.y=MOTION_VEL;
				updatePos();

				if(pos.y>MOTION_BOUND_Y[1]+200) istage=AvatarAction.DEAD;
				break;

			case DEAD: //dead
				break;
		}

		img_seq.update();
		

		if(action_delay>0){
			action_delay--;
			if(is_giraffe && action_delay==GIRAFFE_SPAN/2) giraffe_dest=pos.x;

		}else is_giraffe=false;
		//if(random(50)<1) speak_bubble.setIndex((int)random(10));


	}
	void resetVel(){
		vel.setMag(MOTION_VEL);
		vel.rotate(random(TWO_PI));
		vel_control=(random(3)<1)?(random(2)<1?VEL_CONTROL*.75:VEL_CONTROL*1.25):VEL_CONTROL;
	}
	void updatePos(){

		vel.add(acc);
		vel.limit(MOTION_VEL);

		pos.add(vel.x*vel_control,vel.y*vel_control,0);
		acc.mult(0);
	}

	//boolean setPaused(boolean set_pause,boolean trigger_speak){
	void startTalking(int tindex,boolean isbuild){
		
		speak_bubble.setIndex(tindex);
		istage=AvatarAction.TALK;

	}
	boolean readyToTalk(){
		
		if(action_delay>0) return false;
		if(istage!=AvatarAction.WALK && istage!=AvatarAction.PAUSE) return false;
		
		return true;
	}
	void detectCollision(ArrayList<AvatarMotion> arr_motion,BuildBlock[] arr_block){
		detectAvatarCollision(arr_motion);
		detectBuildBlockCollision(arr_block);
	}

	void detectAvatarCollision(ArrayList<AvatarMotion> arr_motion){
		


		PVector seperate_acc=new PVector(0,0);
		PVector align_acc=new PVector(0,0);
		PVector cohesion_acc=new PVector(0,0);
		
		int mneighbor=0;
		
		for(AvatarMotion _motion:arr_motion){

			float dist_mag=PVector.dist(_motion.pos,pos);
			if(dist_mag<AVATAR_SIZE.mag()*.8){

				mneighbor++;

				// seperate
				PVector tmp_acc=PVector.sub(pos,_motion.pos);
				// tmp_acc.normalize();
				// tmp_acc.setMag(.55);
				// if(istage==AvatarAction.BRIDGE) tmp_acc.setMag(.1);

				if(action_delay<=0) tmp_acc.setMag(8/dist_mag);
				else tmp_acc.setMag(6/dist_mag);

				if(istage==AvatarAction.BRIDGE) tmp_acc.setMag(1/dist_mag);
				seperate_acc.add(tmp_acc);


				if(istage==AvatarAction.BRIDGE) continue;

				// cohesion
				PVector a_tmp=PVector.sub(_motion.pos,pos);
				a_tmp.normalize();
				cohesion_acc.add(a_tmp);

				// align
				align_acc.add(_motion.vel);

				
				
			}
			
		} 
		if(mneighbor<=0) return;

		// seperate_acc.div(mneighbor);
		// seperate_acc.normalize();
		// seperate_acc.mult(.75);

		cohesion_acc.div(mneighbor);
		cohesion_acc.mult(.01);

		align_acc.div(mneighbor);
		align_acc.mult(.01);

		// println(seperate_acc);

		acc.add(seperate_acc);
		acc.add(cohesion_acc);
		acc.add(align_acc);

	}
	void detectBuildBlockCollision(BuildBlock[] arr_block){

		PVector turn_acc=new PVector(0,0);
		is_intersecting=false;
		for(BuildBlock _block:arr_block){

			
			// float dist_x=abs(_block.pos.x-pos.x);
			// float dist_y=abs(_block.pos.y-pos.y);

			//if(dist_x<(_block.sizee.x/2+AVATAR_SIZE.x/3) && dist_y<(_block.sizee.y/2+AVATAR_SIZE.y/2)){
			if(regionIntersect(pos,_block,true)){

				// float overlap_area=(min(_block.pos.x+_block.sizee.x,pos.x+AVATAR_SIZE.x/2*depth_scale)-max(_block.pos.x,pos.x-AVATAR_SIZE.x/2*depth_scale))
				// 					*(min(_block.pos.y+_block.sizee.y,pos.y+AVATAR_SIZE.y/2*depth_scale)-max(_block.pos.y,pos.y-AVATAR_SIZE.y/2*depth_scale));
				// float overlap_x=(min(_block.pos.x+_block.sizee.x,pos.x+AVATAR_SIZE.x/2*depth_scale)+max(_block.pos.x,pos.x-AVATAR_SIZE.x/2*depth_scale))/2;
				// float overlap_y=(min(_block.pos.y+_block.sizee.y,pos.y+AVATAR_SIZE.y/2*depth_scale)-max(_block.pos.y,pos.y-AVATAR_SIZE.y/2*depth_scale))/2;
				PVector tmp_acc=new PVector((pos.x-_block.pos.x),pos.y-_block.pos.y);
				
				// tmp_acc.setMag(overlap_area);
				// tmp_acc.mult(1/19000.0f/20.0f);
				tmp_acc.setMag(2);
				//println("build block mag= "+tmp_acc.mag());
				turn_acc.add(tmp_acc);
				is_intersecting=true;		
			}

		}

		acc.add(turn_acc);
		// if(turn_vel.mag()>.2){
		// 	//turn_vel.setMag(MOTION_VEL);	
		// 	vel.add(turn_acc);
		// 	vel.setMag(MOTION_VEL);
		// }
		
	}
	boolean goBridge(){
		if(istage==AvatarAction.WALK){
			if(pos.x<Left_Screen_X){
				bridge_vel=1;
				istage=AvatarAction.BRIDGE;
				return true;
			}
			if(pos.x>Right_Screen_X){
				bridge_vel=-1;
				istage=AvatarAction.BRIDGE;
				return true;
			}
		}
		return false;

	}
	void detectBridge(){

		//if(action_delay>0) return;

		if(istage==AvatarAction.WALK){
			// catch those already on the bridge
			if(pos.x>Left_Screen_X && pos.x<Right_Screen_X){
				bridge_vel=random(2)>1?1:-1;
				istage=AvatarAction.BRIDGE;
				return;
			}
			// if is near the bridge region
			if(regionIntersect(pos,arr_bridge_block[0],false)){
				if(action_delay>0){
					acc.add(-2,0,0);
					return;	
				} 
				bridge_vel=1;
				istage=AvatarAction.BRIDGE;
				return;
			}
			if(regionIntersect(pos,arr_bridge_block[1],false)){
				if(action_delay>0){
					acc.add(2,0,0);
					return;	
				} 
				bridge_vel=-1;
				istage=AvatarAction.BRIDGE;
				
				return;

				
			}
		}
		if(istage==AvatarAction.BRIDGE){
			if(bridge_vel>0 && pos.x>Right_Screen_X+AVATAR_SIZE.x){
				istage=AvatarAction.WALK;
				bridge_vel=0;	
				action_delay=350;
			} 
			if(bridge_vel<0 && pos.x<Left_Screen_X-AVATAR_SIZE.x){
				istage=AvatarAction.WALK;
				bridge_vel=0;	
				action_delay=350;
			} 
		}
	}



	void detectTalking(ArrayList<AvatarMotion> arr_motion,BuildBlock[] arr_block){

		if(istage!=AvatarAction.WALK && istage!=AvatarAction.PAUSE) return;

		for(BuildBlock _block:arr_block){
			
			float mag_dist=PVector.dist(_block.pos,pos);

			float y_dist=abs(_block.pos.y-pos.y);
			if(y_dist>AVATAR_THRES.y) continue;

			float x_dist=abs(_block.pos.x-pos.x);
			if(mag_dist<AVATAR_THRES.mag()){//if(x_dist<AVATAR_THRES.x){
				if(_block.to_talk && this.readyToTalk()){
					// this.startTalking(true);
					// return;
				}
			} 
		}

		for(AvatarMotion _motion:arr_motion){

			//if(_motion.istage!=AvatarAction.WALK) continue;
			float mag_dist=PVector.dist(_motion.pos,pos);

			float y_dist=abs(_motion.pos.y-pos.y);
			// print(" y dist= "+y_dist);
			if(y_dist>AVATAR_THRES.y) continue;

			float x_dist=abs(_motion.pos.x-pos.x);
			// println(" x dist= "+x_dist);

			if(mag_dist<AVATAR_THRES.x && mag_dist>AVATAR_SIZE.x*.8){//if(x_dist<AVATAR_THRES.x){
				if(_motion.readyToTalk() && this.readyToTalk() ){
					int tindex=(int)random(10);

					boolean tleft=pos.x<_motion.pos.x;
					_motion.startTalking(tindex*2+(!tleft?1:0),false);
					this.startTalking(tindex*2+(tleft?1:0),false);
					return;
				}
			} 
			
		} 
		
	}
	void detectBoundary(){
		PVector turn_acc=new PVector(0,0);
		if(pos.x+AVATAR_SIZE.x/2>MOTION_BOUND_X[1]){
			acc.mult(0);
			acc.add(-5,0,0);	
			action_delay=520;
		} 
		if(pos.x-AVATAR_SIZE.x/2<MOTION_BOUND_X[0]){
			acc.mult(0);
			acc.add(5,0,0);	

			if(DO_EASTER_EGG && !is_giraffe && random(5)<1){
				action_delay=GIRAFFE_SPAN;
				is_giraffe=true;
			}
		} 
		
		if(pos.x<Left_Screen_X){
			if(pos.y+AVATAR_SIZE.y/2*depth_scale>MOTION_BOUND_Y[1]) turn_acc.y-=1.5;
			if(pos.y-AVATAR_SIZE.y/2*depth_scale<MOTION_BOUND_Y[0]) turn_acc.y+=1.5;
		}else if(pos.x<Right_Screen_X){
			if(pos.y+AVATAR_SIZE.y/2*depth_scale>MOTION_BOUND_Y[3]) turn_acc.y-=1.5;
			if(pos.y-AVATAR_SIZE.y/2*depth_scale<MOTION_BOUND_Y[2]) turn_acc.y+=1.5;
		
		}else{
			if(pos.y+AVATAR_SIZE.y/2*depth_scale>MOTION_BOUND_Y[1]) turn_acc.y-=1.5;
			if(pos.y-AVATAR_SIZE.y/2*depth_scale<MOTION_BOUND_Y[0]) turn_acc.y+=1.5;
		
		}
		
		//if(turn_acc.mag()>0) action_delay=120;
		acc.add(turn_acc);
		  
		

	}
	boolean isInRange(){
		return pos.x>MOTION_BOUND_X[0] && pos.x<MOTION_BOUND_X[1]
				&& pos.y>MOTION_BOUND_Y[0] && pos.y<MOTION_BOUND_Y[1];
	}

	void startGoOut(){

		if(istage!=AvatarAction.WALK) return;

		istage=AvatarAction.LEAVE;
		vel=new PVector(0,MOTION_VEL*1.5);
	}

	void drawDebugRegion(PGraphics pg){
		pg.pushStyle();
		pg.noFill();
		if(istage==AvatarAction.DEAD) pg.fill(0);

		if(action_delay>0){
			pg.stroke(0);
			pg.strokeWeight(4);
			pg.rect(pos.x-AVATAR_SIZE.x/2*depth_scale,pos.y-AVATAR_SIZE.y/2*depth_scale,AVATAR_SIZE.x*depth_scale,AVATAR_SIZE.y*depth_scale);
		}

		pg.strokeWeight(1);
		if(istage==AvatarAction.BRIDGE) pg.stroke(0,0,255);
		else{
			if(is_intersecting) pg.stroke(255,255,0);
			else pg.stroke(0,255,0);
		}
		pg.rect(pos.x-AVATAR_SIZE.x/2*depth_scale,pos.y-AVATAR_SIZE.y/2*depth_scale,AVATAR_SIZE.x*depth_scale,AVATAR_SIZE.y*depth_scale);
		pg.rect(pos.x-AVATAR_SIZE.x/2*depth_scale,pos.y+AVATAR_SIZE.y/4*depth_scale,AVATAR_SIZE.x*depth_scale,AVATAR_SIZE.y/4*depth_scale);


		pg.popStyle();
	}

	void updateScale(){
		switch(istage){
			case WALK:
				//if(depth_scale<1) depth_scale+=.02;
				depth_scale=getDepthScale();
				break;
			case BRIDGE:
				//if(depth_scale>.7) depth_scale-=.02;
				depth_scale=getDepthScale();
				break;
		}
	}
	float getDepthScale(){
		if(pos.y>300) return 1;
		return sin((pos.y)/300*HALF_PI)*.3+.7;
	}
}