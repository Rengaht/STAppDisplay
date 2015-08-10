class ANeonCat{
	int MFRAME=5;
	float TAIL_LEN=20;
	float TAIL_SEG=50;

	PVector _pos,_origin;
	float _ang;
	PImage[] arr_img;
	float cur_frame=0;
	boolean is_playing=false;

	ANeonCat(float set_x,float set_y){
		_pos=new PVector(set_x,set_y);


		arr_img=new PImage[MFRAME];
		for(int i=0;i<MFRAME;++i) arr_img[i]=loadImage("GAME_A/cat/cat_"+nf(i+1,4)+".png");

		reset();

	}
	void draw(PGraphics pg){

		if(!is_playing) return;
		
		pg.pushStyle();
		pg.imageMode(CENTER);
		pg.noStroke();
		pg.pushMatrix();


			float cur_seg=floor(_pos.x/TAIL_SEG);
			float cur_len=_pos.x%TAIL_SEG;
			int cur_pos=(int)(cur_seg%2);

			pg.translate(_origin.x,_origin.y);
			pg.rotate(_ang);

			pg.translate(_pos.x,_pos.y);

			pg.scale(.6);
				
				pg.pushMatrix();
				pg.translate(-cur_len,0);

				for(int i=0;i<TAIL_LEN;++i){
					pg.translate(-TAIL_SEG,0);
					pg.pushStyle();
					pg.colorMode(HSB);
						for(int x=0;x<5;++x){
							pg.fill(x*51,255,255,(TAIL_LEN-(float)i*.7)/TAIL_LEN*255);
							pg.rect(0,x*TAIL_SEG/5+((i+cur_pos)%2)*TAIL_SEG/5,TAIL_SEG,TAIL_SEG/5);
						}
					pg.popStyle();
				}
				
				pg.popMatrix();

				pg.image(arr_img[floor(cur_frame)],0,cur_pos*TAIL_SEG/5+30);				

		pg.popMatrix();
		pg.popStyle();

	}
	void update(){
		
		if(!is_playing) return;

		cur_frame+=.133;
		if(cur_frame>MFRAME) cur_frame=0;

		_pos.x+=5;
		if(_pos.x>1024){
			is_playing=false;
			reset();
		}

	}
	void reset(){
		_pos.x=-100;
		cur_frame=0;
		_pos.y=random(50,100);

		int icase=(int)random(4);
		switch(icase){
			case 0:
				_origin=new PVector(random(20),random(150,300));
				_ang=random(-PI/4,0);
				break;
			case 1:
				_origin=new PVector(Right_Screen_X+random(20),random(150,300));	
				_ang=random(-PI/4,0);
				break;
			case 2:
				_origin=new PVector(Right_Screen_X+random(20),random(-150,-10));	
				_ang=random(0,PI/4);
				break;
			case 3:
				_origin=new PVector(random(20),random(-150,-10));	
				_ang=random(0,PI/4);
				break;	
		}		

	}
	void Restart(){
		if(!is_playing) is_playing=true;
	}
}