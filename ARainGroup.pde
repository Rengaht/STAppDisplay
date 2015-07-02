
final float RAIN_THRES=350;
final float RAIN_TIME=120;

class ARayLine{
	float x,y,len;
	float z;
	float vel;
	ARayLine(float x_,float y_,float len_){
		x=x_; y=y_; len=len_;
		z=-width/2; vel=random(10)+5;
	}
	void draw(PGraphics pg){
		pg.stroke(255,120);
		pg.line(x,y,x,constrain(y+len,0,RAIN_THRES));
		update();
	}
	void update(){
		y+=vel;
		// len+=vel*.1;
		if(y>RAIN_THRES) y=0;
	}
}


class ARainGroup{

	ArrayList<ARayLine> arr_ray;
	FrameAnimation ani_rain;

	ARainGroup(){
		arr_ray=new ArrayList<ARayLine>();
		for(int i=0;i<20;++i) arr_ray.add(new ARayLine(random(160),0,random(20)+7));
		ani_rain=new FrameAnimation(RAIN_TIME);
	}
	void update(){
		if(!ani_rain.ani_start) return;
		for(ARayLine ray:arr_ray) ray.update();
		ani_rain.Update();
	}
	void draw(PGraphics pg,float px,float py){

		if(!ani_rain.ani_start) return;

		pg.pushMatrix();
		pg.translate(px,py);
		for(ARayLine ray:arr_ray) ray.draw(pg);	
		pg.popMatrix();

	}
	boolean start(){
		if(!ani_rain.ani_start){
			ani_rain.Restart();
			return true;	
		} 
		return false;
	}
}

