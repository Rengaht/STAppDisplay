class CountDown{
	
	int count_num;
	int cur_num;
	FrameAnimation ani_per_num;
	PImage[] arr_img_num;

	boolean finished;
	boolean started;

	CountDown(int set_num){
		ani_per_num=new FrameAnimation(40);
		count_num=set_num;
		cur_num=0;

		arr_img_num=new PImage[count_num];
		for(int i=0;i<3;++i){
			arr_img_num[i]=loadImage("GAME_B/count_"+nf(i+1,1)+".png");
		}
	}
	void reset(){
		started=false;
	}
	void start(){
		cur_num=count_num;
		ani_per_num.Restart();
		finished=false;
		started=true;
	}
	void update(){

		if(!started) return;

		ani_per_num.Update();
		if(ani_per_num.GetPortion()==1){
			if(cur_num>0){
				cur_num--;
				ani_per_num.Restart();
			}else{
				finished=true;
				// cur_num=count_num;
				// ani_per_num.Restart();
			}
		}
	}
	boolean isFinished(){
		return started && finished;
	}
	void draw(PGraphics pg,float x,float y){
		
		if(cur_num<1) return;

		pg.pushStyle();
		pg.imageMode(CENTER);
		// pg.blendMode();

		pg.pushMatrix();
		pg.translate(x,y);
		// pg.translate(x,220,map(ani_per_num.GetPortion(),0,1,-800,100));
			pg.scale(constrain(ani_per_num.GetPortion(),0,.5)*2);		
			pg.image(arr_img_num[cur_num-1],0,0);
		pg.popMatrix();
		
		pg.popStyle();

	}


}