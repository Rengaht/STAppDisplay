
final float ROAD_MOV_SPEED=1;
final float CAR_BASE_VEL=1;
final float CAR_DEST_DIST=60;

class EnergyCar{
	
	float x,y,wid;
	

	float cur_vel;
	float dest_vel;
	FrameAnimation ani_vel;

	float cur_pos=0;
	float dest_pos=0;
	FrameAnimation ani_pos;

	int cur_icar;
	int dest_icar;
	FrameAnimation ani_car_transform;
	boolean is_bump_transform;
	FrameAnimation ani_icon_transform;

	FrameAnimation ani_icontext;

	FrameAnimation ani_icon_timer;
	PShader shd_motion;
	PGraphics pg_motion,pg_img;

	FrameAnimation ani_end_transform;

	String user_id;
	int color_index;

	boolean start_run=false;
	float run_distance=0;

	
	ImageSeq seq_car;
	ImageSeq seq_effect;

	PImage img_icontext=null;

	EnergyCar(float x_,float y_,int icolor){
		x=x_; y=y_; 
		wid=120;
		color_index=icolor;
		cur_icar=dest_icar=-1;

		seq_car=new ImageSeq(59);
		seq_car.frame_vel=.5;
		seq_car.play();

		seq_effect=new ImageSeq(58);
		seq_effect.frame_vel=.5;
		seq_effect.looped=false;
		seq_effect.play();

		ani_pos=new FrameAnimation(30);
		ani_vel=new FrameAnimation(2);

		ani_car_transform=new FrameAnimation(30);
		ani_icon_transform=new FrameAnimation(25);
		ani_icon_transform.is_elastic=true;

		ani_icon_timer=new FrameAnimation(180);

		ani_icontext=new FrameAnimation(60);


		ani_end_transform=new FrameAnimation(30);


		shd_motion=loadShader("GAME_B/motionblur.frag");
		pg_motion=createGraphics(297,297);
		pg_img=createGraphics(297,297,P3D);
		drawMotion();

	}
	void draw(PGraphics pg){
		
		pg.pushStyle();
		pg.imageMode(CENTER);
		pg.rectMode(CENTER);

		pg.noStroke();
		pg.pushMatrix();
		if(DRAW_DEBUG){
			pg.textSize(16);
			pg.fill(255,0,0);
			pg.text(dest_vel,10,20);
			pg.text(run_distance,10,40);			
		}
		float _pos=getCurPosition();
		pg.translate(map(_pos,-1,1,ROAD_LINE[0],ROAD_LINE[1]),300,map(ani_end_transform.GetPortion(),0,1,0,-800));

			float _alpha=ani_car_transform.GetPortion();

			//println("a= "+_alpha);
			// if(img_cur_car!=null){
			// 	pg.tint(255,255*(1-_alpha));
			// 	pg.image(img_cur_car,0,0);
			// }
			// if(img_dest_car!=null){
			// 	pg.tint(255,255*(_alpha));
			// 	pg.image(img_dest_car,0,0);
			// }
			if(ani_end_transform.GetPortion()<1) pg.image(pg_img,0,0);

    		if(DRAW_DEBUG){
    			pg.text(ani_car_transform.GetPortion(),-20,-50);	

    		} 
		pg.popMatrix();


		if(img_icontext!=null && ani_icontext.ani_start){
			pg.pushMatrix();
			pg.translate(512,120);
			float _port=ani_icontext.GetPortion();
			pg.scale(constrain(sin(_port*HALF_PI),0,.3)*3.33);				
				pg.image(img_icontext,0,0);
			pg.popMatrix();
		}	

		pg.popStyle();


		
	}
	void drawIcon(PGraphics pg,PImage img_cur_icon,PImage img_dest_icon){
		
		float _isize=.45;
		pg.pushStyle();
		pg.imageMode(CENTER);
			float _alpha=ani_icon_transform.GetPortion();
			if(_alpha<=0.5){
				if(img_cur_icon!=null){
					pg.pushMatrix();
					// pg.translate(img_cur_icon.width/2,img_cur_icon.height/2);
					pg.scale((1-_alpha*2)*_isize);
					// pg.tint(255,255*(1-_alpha));
					pg.image(img_cur_icon,0,0);
					pg.popMatrix();
				}
			}else{
				if(img_dest_icon!=null){
					pg.pushMatrix();
					// pg.translate(img_dest_icon.width/2,img_dest_icon.height/2);
					pg.scale((_alpha*2-1)*_isize);
					// pg.tint(255,255*(_alpha));
					pg.image(img_dest_icon,0,0);
					pg.popMatrix();
				}
			}
		pg.popStyle();
	}
	

	void update(PImage img_cur_car,PImage img_dest_car,PImage img_dest_effect){
		
		ani_pos.Update();
		if(ani_pos.GetPortion()==1) cur_pos=dest_pos;

		ani_vel.Update();
		if(ani_vel.GetPortion()==1) cur_vel=dest_vel;

		ani_car_transform.Update();
		ani_icontext.Update();

		if(ani_car_transform.GetPortion()==1){
			// seq_car.play();
			// seq_effect.play();	
			cur_icar=dest_icar;
			is_bump_transform=false;
		}	
		ani_end_transform.Update();


		ani_icon_transform.Update();

		ani_icon_timer.Update();
		if(ani_icon_timer.GetPortion()==1){
			// vel recovery
			cur_vel=dest_vel;
			ani_vel.Restart();
			dest_vel=1*ROAD_MOV_SPEED;
		} 

		if(start_run){
			// run_distance+=CAR_BASE_VEL*lerp(cur_vel,dest_vel,ani_vel.GetPortion());
			// run_distance=constrain(run_distance,0,CAR_DEST_DIST);
		} 

		seq_car.update();
		seq_effect.update();

		updateCar(img_cur_car,img_dest_car,img_dest_effect);

		// if(frameCount%150==0){
		// 	changeCar((int)random(5));
		// }	

	}
	void reset(){
		cur_vel=dest_vel=ROAD_MOV_SPEED;
		cur_pos=cur_pos=0;

		cur_icar=dest_icar=-1;

		ani_vel.Reset();
		ani_pos.Reset();
		ani_car_transform.Reset();
		ani_icon_transform.Reset();

		ani_icontext.Reset();

		ani_icon_timer.Reset();

		ani_end_transform.Reset();

		run_distance=0;


	}
	void startRun(){
		
		reset();

		start_run=true;
		
				
		
	}
	void stopRun(){
		start_run=false;
		ani_end_transform.Restart();
		println("car stop run!!");

	}
	void updatePosition(int delta_position){
		
		float _dest=delta_position;
		if(_dest==dest_pos) return;
		
		cur_pos=lerp(cur_pos,dest_pos,ani_pos.GetPortion());
		ani_pos.Restart();

		dest_pos=_dest;
		// println("go "+dest_pos);
	}
	float getCurPosition(){
		return lerp(cur_pos,dest_pos,ani_pos.GetPortion());
	}
	void changeCar(int iset_car,PImage set_text){

	
		if(ani_car_transform.ani_start) return;

		img_icontext=set_text;
		cur_vel=dest_vel;
		ani_vel.Restart();
		ani_icontext.Restart();


		if(iset_car<4) dest_vel=2.3*ROAD_MOV_SPEED;
		else if(iset_car<ITRANSCAR) dest_vel=1.5*ROAD_MOV_SPEED;
		else{
			// dest_vel=.6*ROAD_MOV_SPEED;
			dest_vel=cur_vel-0.4*ROAD_MOV_SPEED;
			ani_car_transform.Restart();
			ani_icon_timer.Restart();	
			is_bump_transform=true;
			seq_effect.pause();
			return;
		} 
		
		seq_effect.play();
		
		if(dest_icar==iset_car) return;

		cur_icar=dest_icar;
		dest_icar=iset_car;
		ani_car_transform.Restart();
		ani_icon_transform.Restart();
		is_bump_transform=false;

		if(dest_icar>=0){
		 	ani_icon_timer.Restart();		 	
		}
		seq_car.play();
		

		println("-- change car to "+iset_car);
	}
	void drawMotion(){

		if(pg_motion==null) return;

		pg_motion.beginDraw();

		float cscale=255.0/(float)pg_motion.width*sin(ani_car_transform.GetPortion()*PI);

		for(int i=0;i<pg_motion.width;++i)
		for(int j=0;j<pg_motion.height;++j){
		  pg_motion.set(i,j,color(255/2.0+cscale*80*noise(i/5+frameCount)*sin((float)frameCount/1),255/2.0+cscale*20*sin((float)j/20)*sin((float)frameCount/2),0));
		}

		pg_motion.endDraw();

		shd_motion.set("motion_texture",pg_motion);
	}
	void updateCar(PImage img_cur_car,PImage img_dest_car,PImage img_dest_effect){

		if(frameCount%3==0) drawMotion();
		float _alpha=(ani_car_transform.ani_start)?ani_car_transform.GetPortion():1;

		if(img_dest_car!=null) shd_motion.set("trans_texture",img_dest_car);
		if(img_cur_car!=null) shd_motion.set("orig_texture",img_cur_car);
		shd_motion.set("trans_t",_alpha);

		//if(frameCount%15==0) drawMotion();
		pg_img.beginDraw();
			pg_img.pushStyle();
			pg_img.noStroke();
    		pg_img.background(0,0);
    		pg_img.imageMode(CENTER);
    		pg_img.rectMode(CENTER);

    		pg_img.pushMatrix();
    		pg_img.translate(pg_img.width/2,pg_img.height/2);

    		if(!is_bump_transform){
	    		pg_img.shader(shd_motion);
	    		pg_img.rect(0,0,215+45*noise((float)frameCount/2)*(1-_alpha),215+10*noise((float)frameCount/2)*(1-_alpha));
	    		pg_img.resetShader();
    		}else{
    			pg_img.tint(255,random(2)<1?255:0);
    			pg_img.image(img_dest_car,0,0);
    		}
    		
    		pg_img.blendMode(ADD);
    		pg_img.tint(255,220);
    		if(img_dest_effect!=null && seq_effect.isplaying) pg_img.image(img_dest_effect,0,24);//,pg_img.width*.0,pg_img.height*.8);

    		pg_img.popMatrix();
    		
    		pg_img.popStyle();
		pg_img.endDraw();


	}
	boolean arriveGoal(){
		// println("car distance: "+run_distance+" / "+CAR_DEST_DIST);
		return run_distance>=CAR_DEST_DIST;
	}
	boolean isFinished(){
		return ani_end_transform.GetPortion()==1;
	}
	int getScore(){
		return (int)(run_distance);
	}
	int getCurFrame(){
		//println(seq_car.icur_frame);
		return (int)seq_car.icur_frame;
	}
	int getCurEffectFrame(){
		return (int)seq_effect.icur_frame;
	}
	float getCurVel(){
		return constrain(lerp(cur_vel,dest_vel,ani_vel.GetPortion()),.5,2);
	}
}