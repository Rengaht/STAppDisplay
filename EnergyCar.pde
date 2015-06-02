
class EnergyCar{
	
	float x,y,wid;
	float vel;
	float cur_position=0;
	float src_position=0;
	float dest_position=0;
	float tmove=0;

	float MOVE_VEL=.1;

	String user_id;
	int color_index;

	boolean start_run=false;
	float run_distance=0;

	float DEST_DIST=100;

	EnergyCar(float x_,float y_,int icolor){
		x=x_; y=y_; 
		wid=120;
		color_index=icolor;
	}
	void draw(PGraphics pg){
		
		pg.pushStyle();
		
		pg.fill(255*abs(cur_position),120*(1+cur_position),120*(1-(cur_position)),120);
		pg.noStroke();
		pg.pushMatrix();

		if(random(3)<1){
			pg.pushStyle();
			if(color_index==0) pg.fill(255,0,0,150);
			else pg.fill(0,255,0,150);

			pg.rect(0,0,1024,400);

			pg.popStyle();
		}

		pg.translate(x+cur_position*200,y,0);
			pg.textFont(font, 80);
			pg.text(run_distance,-80,-40);

			pg.rotateY(TWO_PI*sin((float)frameCount/100));
			pg.box(80);
		pg.popMatrix();

		pg.popStyle();


		update();
	
	}
	void update(){
		if(tmove<1){
			cur_position=lerp(src_position,dest_position,tmove);
			tmove+=MOVE_VEL;
		}
		if(start_run){
			run_distance+=random(-.1,.3);
			run_distance=constrain(run_distance,-DEST_DIST,DEST_DIST);
		} 
	}
	void startRun(){
		start_run=true;
		run_distance=0;
	}
	void stopRun(){
		start_run=false;
	}
	void updatePosition(int delta_position){
		if(tmove<1 && tmove>0) return;
		
		src_position=lerp(src_position,dest_position,tmove);
		tmove=0;
		dest_position=constrain(dest_position+delta_position,-1,1);
		println("go "+dest_position);
	}
	boolean arriveGoal(){
		return run_distance>=DEST_DIST;
	}
	int getScore(){
		return (int)(run_distance/DEST_DIST*100);
	}

}