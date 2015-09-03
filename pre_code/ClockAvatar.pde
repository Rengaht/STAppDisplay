
class ClockAvatar{
	final float POS_WID=30;
	final float POS_HEI=62;
	int icharacter;
	PImage img_face;
	PVector pos_src,pos_dest;
	PVector ctrl_src,ctrl_dest;

	PVector pos_src2,pos_dest2;
	PVector ctrl_src2,ctrl_dest2;


	ImageSeq img_seq;
	
	FrameAnimation anima_pos;

	ClockNumAction iaction;


	ClockAvatar(int set_findex,PImage set_image,PVector set_src,PVector set_dest){
		icharacter=set_findex;
		img_face=set_image;
		
		pos_src=set_src;
		pos_dest=set_dest;
		setupCtrlPoint(false);

		// set up for born
		pos_src2=set_src.get();
		pos_src2.x+=random(3,6)*(random(2)<1?1:-1);
		pos_src2.y=(pos_src.y<2)?-3:7;
	
		ctrl_src2=PVector.sub(pos_src,pos_src2);
		ctrl_src2.rotate(random(-PI/3,PI/3));
		ctrl_src2.mult(.5);

		ctrl_dest2=ctrl_src2.get();
		ctrl_dest2.rotate(PI);

		ctrl_src2.add(pos_src2);
		ctrl_dest2.add(pos_src);


		// img_seq=new ImageSeq(6);
		// img_seq.play();

		// anima_pos=new FrameAnimation(180,random(50,200));
		// anima_pos.is_loop=true;
		// anima_pos.Restart();

		iaction=ClockNumAction.BORN;

	}
	void setupCtrlPoint(boolean to_change){
		if(to_change){
			ctrl_src2=PVector.sub(pos_dest2,pos_src2);
			ctrl_src2.rotate(random(PI));

			ctrl_dest2=ctrl_src.get();
			ctrl_dest2.rotate(random(PI/2));

			ctrl_src2.add(pos_src2);
			ctrl_dest2.add(pos_src2);

			// pos_dest2=pos_src2.get();

		}else{
			ctrl_src=PVector.sub(pos_dest,pos_src);
			ctrl_src.rotate(random(PI));

			ctrl_dest=ctrl_src.get();
			ctrl_dest.rotate(random(PI/2));

			ctrl_src.add(pos_src);
			ctrl_dest.add(pos_src);

			// pos_dest=pos_src.get();
		}


	}
	void updatePos(PVector set_src,PVector set_dest){
		pos_src2=set_src;
		pos_dest2=set_dest;
		setupCtrlPoint(true);
		iaction=ClockNumAction.CHANGE;
	}

	void update(){
		// img_seq.update();
		// anima_pos.Update();
	}
	void draw(PGraphics pg,PImage img_body){
		draw(pg,img_body,anima_pos.GetPortion(),1);
	}
	void draw(PGraphics pg,PImage img_body,float tdraw,float tchange){
		
		
		

		float cur_x=0,cur_y=0;

		switch(iaction){
			case BORN:
				cur_x=bezierPoint(pos_src2.x,ctrl_src2.x,ctrl_dest2.x,pos_src.x,tchange);
				cur_y=bezierPoint(pos_src2.y,ctrl_src2.y,ctrl_dest2.y,pos_src.y,tchange);
				if(tchange==1 && tdraw==1) iaction=ClockNumAction.WALK;
				break;
			case WALK:
				if(tdraw==1) setupCtrlPoint(false);

				cur_x=bezierPoint(pos_src.x,ctrl_src.x,ctrl_dest.x,pos_src.x,tdraw);
				cur_y=bezierPoint(pos_src.y,ctrl_src.y,ctrl_dest.y,pos_src.y,tdraw);
				// println("WALK: "+tdraw);
				break;			
			case CHANGE:
				PVector csrc=PVector.lerp(pos_src,pos_src2,tchange);
				PVector cdest=PVector.lerp(pos_dest,pos_dest2,tchange);
				PVector cctrl1=PVector.lerp(ctrl_src,ctrl_src2,tchange);
				PVector cctrl2=PVector.lerp(ctrl_dest,ctrl_dest2,tchange);

				cur_x=bezierPoint(csrc.x,cctrl1.x,cctrl2.x,csrc.x,tdraw);
				cur_y=bezierPoint(csrc.y,cctrl1.y,cctrl2.y,csrc.y,tdraw);

				if(tchange==1){
					pos_src=pos_src2.get();
					pos_dest=pos_dest2.get();
					ctrl_src=ctrl_src2.get();
					ctrl_dest=ctrl_dest2.get();
					iaction=ClockNumAction.WALK;
				}

				break;
			case LEAVE:
				cur_x=bezierPoint(pos_src.x,ctrl_src.x,ctrl_dest.x,pos_dest.x,tchange);
				cur_y=bezierPoint(pos_src.y,ctrl_src.y,ctrl_dest.y,pos_dest.y,tchange);
				if(tdraw==1) iaction=ClockNumAction.DEAD;
				break;
			case DEAD:
				cur_x=pos_dest.x;
				cur_y=pos_dest.y;
				break;
		}
		pg.pushStyle();
		pg.imageMode(CENTER);

		// pg.stroke(255,0,0);
		// pg.bezier(pos_src.x*POS_WID,pos_src.y*POS_HEI,
		// 		  ctrl_src.x*POS_WID,ctrl_src.y*POS_HEI,
		// 		  ctrl_dest.x*POS_WID,ctrl_dest.y*POS_HEI,
		// 		  pos_src.x*POS_WID,pos_src.y*POS_HEI);

		pg.pushMatrix();
		pg.translate(cur_x*POS_WID,cur_y*POS_HEI+(icharacter>9?8:0));
			pg.pushMatrix();
			pg.scale(.4);
				pg.image(img_face,0,-28);				
			pg.popMatrix();

			pg.pushMatrix();
			pg.scale(.95);
				pg.image(img_body,0,0);
			pg.popMatrix();
		pg.popMatrix();

		pg.popStyle();
	}

	int getCurFrame(){
		return (int)(img_seq.icur_frame);
	}
	void gotoDie(float tdraw){
		if(iaction!=ClockNumAction.WALK) return;
		iaction=ClockNumAction.LEAVE;
		
		float cur_x=bezierPoint(pos_src.x,ctrl_src.x,ctrl_dest.x,pos_src.x,tdraw);
		float cur_y=bezierPoint(pos_src.y,ctrl_src.y,ctrl_dest.y,pos_src.y,tdraw);
		pos_src=new PVector(cur_x,cur_y);

		pos_dest.y=(cur_y<2)?-2:6;
		pos_dest.x+=random(3,6)*(random(2)<1?1:-1);
	
		ctrl_src=PVector.sub(pos_dest,pos_src);
		ctrl_src.rotate(random(PI));

		ctrl_dest=ctrl_src.get();
		ctrl_dest.rotate(PI);

		ctrl_src.add(pos_src);
		ctrl_dest.add(pos_dest);
	}
	boolean isDead(){
		return iaction==ClockNumAction.DEAD;
	}
}