

class IconLine{
	
	final float ICON_SPAN=60;
	final float ICON_DELAY=120;
	
	float pos_x;

	int t_icon;

	FrameAnimation ani_icon;
	
	PShader shd_explode;
	FrameAnimation ani_explode;
	boolean is_explode;
	
	FrameAnimation ani_text;
	PImage img_icontext;
	boolean is_playing=false;

	int icon_index;

	IconLine(int set_index,float set_x){
		t_icon=0;
		ani_icon=new FrameAnimation(ICON_SPAN);
		ani_text=new FrameAnimation(20);

		icon_index=set_index;
		pos_x=set_x;


		shd_explode=loadShader("GAME_B/explode.frag");
		ani_explode=new FrameAnimation(10);
		is_explode=false;
	}

	void restart(){
		ani_icon.Restart();
		ani_icon.Pause();
		//ani_explode.Reset();
		is_playing=true;
	}
	void pause(){
		ani_icon.Pause();
		is_playing=false;
	}
	void update(){
		
		

		ani_icon.Update();
		
		if(is_playing && !ani_icon.ani_start && !ani_explode.ani_start){
			ani_icon.setDelay(ICON_DELAY*random(1,3));
			ani_icon.Restart();
			icon_index=(random(2)<1)?(int)random(ITRANSCAR):ITRANSCAR+(int)random(2);
			ani_explode.Reset();
			// ani_text.Reset();
			is_explode=false;
		}
		
		ani_explode.Update();
		ani_text.Update();

		// if(ani_text.GetPortion()==1) ani_text.Reset();

		//if(ani_explode.GetPortion()==1) ani_explode.Reset();
		//shd_explode.set("trans_t",ani_explode.GetPortion());
		shd_explode.set("sampleDist",.2+ani_icon.GetPortion());
		shd_explode.set("sampleStrength",2+2*ani_icon.GetPortion());
	}
	boolean isRunning(){
		return ani_icon.ani_start;
	}
	boolean isReached(){
		return ani_icon.GetPortion()>.7;
	}
	void startExplode(PImage set_text){
		if(!is_explode && !ani_explode.ani_start){

			println("Icon Explode!");
			ani_explode.Restart();
			
			is_explode=true;	

			
			// if(set_text!=null){
			// 	img_icontext=set_text;
			// 	ani_text.Restart();
			// }
		} 
	}

	void draw(PGraphics pg,PImage img_icon){

		float _pos=ani_icon.GetPortion();
		if(_pos>1 || _pos<=0) return;

		

		pg.pushStyle();
		pg.imageMode(CENTER);

		pg.pushMatrix();

		boolean is_car=icon_index>ITRANSCAR-1;
		
		if(is_car) pg.translate(map(pos_x,-1,1,ROAD_LINE[0]+70,ROAD_LINE[1]-70),280,map(_pos,0,1,-800,100));
		else{
			pg.translate(map(pos_x,-1,1,ROAD_LINE[0],ROAD_LINE[1]),220,map(_pos,0,1,-800,100));
			pg.scale((1-ani_explode.GetPortion())*.75);	
		} 
			pg.tint(255,(1-ani_explode.GetPortion())*255);
			
			//pg.shader(shd_explode);
			if(ani_explode.ani_start){
				if(is_car){
					// pg.tint(255,random(2)<1?255:0);
				}else{
					pg.translate(random(-5,5),random(-5,5));
					pg.rotateZ(PI/3*sin(random(TWO_PI)));
				}
			}
			pg.image(img_icon,0,0);
			


			pg.resetShader();
		pg.popMatrix();


		pg.popStyle();
	}

}