class AFlyScore{

	FrameAnimation ani_born,ani_life;
	int mscore;
	boolean is_dead=false;

	AFlyScore(int set_score){
		mscore=set_score;

		ani_born=new FrameAnimation(5);
		ani_life=new FrameAnimation(50);
		ani_life.is_elastic=true;

		
	}
	void start(){
		ani_born.Restart();
	}
	void update(){
		
		if(is_dead) return;

		ani_born.Update();
		if(ani_born.GetPortion()==1 && !ani_life.ani_start) ani_life.Restart();

		ani_life.Update();
		if(ani_life.GetPortion()==1) is_dead=true;
	}
	void draw(PGraphics pg){
		pg.pushStyle();
		pg.fill(229,230,66,255*(1-ani_life.GetPortion()));
		pg.textAlign(CENTER);
		pg.textSize(18);

		pg.pushMatrix();
		pg.translate(0,ani_life.GetPortion()*(-200.0));
		pg.scale(ani_born.GetPortion());
		pg.text("+"+mscore,0,0);

		pg.popMatrix();

		pg.popStyle();
	}
	boolean isDead(){
		return is_dead;
	}

}

// score on island
class AScore{
	
	int mnum=4;
	int cur_score,dest_score;
	FrameAnimation[] ani_cur_change,ani_dest_change;
	int[] arr_cur_num,arr_dest_num;
	int color_type;

	AScore(int set_type){
		setup(set_type,false);
	}
	AScore(int set_type,boolean go_fast){	
		setup(set_type,go_fast);
	}
	void setup(int set_type,boolean go_fast){
		cur_score=dest_score=0;
		arr_cur_num=new int[mnum];
		for(int i=0;i<mnum;++i) arr_cur_num[i]=0;

		arr_dest_num=new int[mnum];
		for(int i=0;i<mnum;++i) arr_dest_num[i]=0;

		color_type=set_type;
		ani_cur_change=new FrameAnimation[mnum];
		for(int i=0;i<mnum;++i) ani_cur_change[i]=new FrameAnimation((go_fast?.5:1)*(20+i*2),(i*5)*(go_fast?.5:1));
		
		ani_dest_change=new FrameAnimation[mnum];
		for(int i=0;i<mnum;++i) ani_dest_change[i]=new FrameAnimation((go_fast?.5:1)*(20+i*2),(i*5+5)*(go_fast?.5:1));
		
	}
	void draw(PGraphics pg,float x,float y){
		pg.pushStyle();
		// pg.imageMode(CENTER);
		pg.textureMode(NORMAL);
		pg.noStroke();

		pg.pushMatrix();
		pg.translate(x,y);
		pg.translate(85*(mnum/2-1),0);
		

			for(int i=0;i<mnum;++i){

				float t1=ani_cur_change[i].GetPortion();
				float t2=ani_dest_change[i].GetPortion();

				pg.pushMatrix();
				pg.translate(-85*i,0);
				if(color_type==1){				
					if(arr_dest_num[i]!=arr_cur_num[i]){
						drawNum(pg,arr_img_red_num[arr_dest_num[i]],t2,true);
						drawNum(pg,arr_img_red_num[arr_cur_num[i]],t1,false);
					}else drawNum(pg,arr_img_red_num[arr_dest_num[i]],1,true);
				}else{
					if(arr_dest_num[i]!=arr_cur_num[i]){
						drawNum(pg,arr_img_blue_num[arr_dest_num[i]],t2,true);
						drawNum(pg,arr_img_blue_num[arr_cur_num[i]],t1,false);
					}else drawNum(pg,arr_img_blue_num[arr_dest_num[i]],1,true);
				}
				pg.popMatrix();
			}

		pg.popMatrix();

		pg.popStyle();
	}
	void drawNum(PGraphics pg,PImage img,float p,boolean is_dest){

		pg.beginShape();
		pg.texture(img);
			pg.vertex(0,(is_dest?1-p:0)*109,0,(is_dest?0:p));
			pg.vertex(85,(is_dest?1-p:0)*109,1,(is_dest?0:p));
			pg.vertex(85,(is_dest?1:1-p)*109,1,(is_dest?p:1));
			pg.vertex(0,(is_dest?1:1-p)*109,0,(is_dest?p:1));
		pg.endShape();
	}
	void update(){
		for(int i=0;i<mnum;++i){
			ani_cur_change[i].Update();
			ani_dest_change[i].Update();
		}
		if(ani_dest_change[mnum-1].GetPortion()==1){
			cur_score=dest_score;
			for(int i=0;i<mnum;++i) arr_cur_num[i]=arr_dest_num[i];
		}
	}
	void addScore(int to_add){
		setScore(dest_score+to_add);
	}
	void setScore(int set_score){
		if(set_score==cur_score || ani_dest_change[mnum-1].ani_start) return;
		// if(set_score==cur_score) return;

		dest_score=set_score;
		arr_dest_num[0]=dest_score%10;
		arr_dest_num[1]=floor(dest_score/10)%10;
		arr_dest_num[2]=floor(dest_score/100)%10;
		arr_dest_num[3]=floor(dest_score/1000)%10;

		if(arr_dest_num[3]>9){
			for(int i=0;i<mnum;++i) arr_dest_num[i]=9;				
		}
		println("Set score: "+dest_score);
		
		for(int i=0;i<mnum;++i){
			ani_cur_change[i].Restart();
			ani_dest_change[i].Restart();
		}
	}



}