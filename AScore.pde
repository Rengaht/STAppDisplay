class AScore{

	FrameAnimation ani_born,ani_life;
	int mscore;
	boolean is_dead=false;

	AScore(int set_score){
		mscore=set_score;

		ani_born=new FrameAnimation(10);
		ani_life=new FrameAnimation(80);
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