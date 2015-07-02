class ACloud{
	
	float _posx,_posy,_pscale;
	PVector move_amp,move_vel,move_phi;

	int icloud;

	boolean is_turbing;
	FrameAnimation ani_turb;
	PVector pos_turb_src,pos_turb_dest,amp_turb;

	ACloud(float set_posx,float set_posy){
		
		_posx=set_posx;
		_posy=set_posy;

		_pscale=random(.2,1);	
		icloud=(int)random(2);

		move_amp=new PVector(25*random(2),5*random(1));
		move_vel=new PVector(random(70,120),random(120,180));
	
		move_phi=new PVector(random(TWO_PI),random(TWO_PI));

		is_turbing=false;
		ani_turb=new FrameAnimation(320);

	}
	void draw(PGraphics pg,PImage img_cloud){
		pg.pushStyle();
		pg.imageMode(CENTER);

		pg.pushMatrix();
		if(is_turbing){
			float virb_t=ani_turb.GetPortion();
			pg.translate(_posx+move_amp.x*60*sin(PI*virb_t*amp_turb.x),_posy+move_amp.y*60*sin(PI*virb_t*amp_turb.y));

		}else{
			pg.translate(_posx+move_amp.x*sin((float)frameCount/move_vel.x+move_phi.x),_posy+move_amp.y*cos((float)frameCount/move_vel.y+move_phi.y));
		}
		pg.scale(_pscale);
			pg.image(img_cloud,0,0);
		pg.popMatrix();

		pg.popStyle();
	}
	void update(){
		if(is_turbing){
			ani_turb.Update();
			if(!ani_turb.ani_start) is_turbing=false;
		}
	}
	void triggerTurb(){
		if(is_turbing) return;

		amp_turb=new PVector((int)random(2,6)*(random(2)<1?1:-1),(int)random(2,6)*(random(2)<1?1:-1));
		ani_turb.Restart();
		is_turbing=true;
	}

}

class ASpaceShip{


	float _posx,_posy,_pscale;
	PVector move_amp,move_vel,move_phi;

	ASpaceShip(float set_posx,float set_posy){
		
		_posx=set_posx;
		_posy=set_posy;

		_pscale=random(.75,1);	
	
		move_amp=new PVector(random(900,1500),random(50));
		move_vel=new PVector(random(420,650),random(40,80));
	
		move_phi=new PVector(random(TWO_PI),random(TWO_PI));

	}
	void draw(PGraphics pg,PImage img_ship){
		pg.pushStyle();
		pg.imageMode(CENTER);
		pg.textureMode(NORMAL);
		pg.noStroke();

		pg.pushMatrix();
		pg.translate(_posx+move_amp.x*sin((float)frameCount/move_vel.x+move_phi.x),_posy+move_amp.y*cos((float)frameCount/move_vel.y+move_phi.y));
		pg.scale(_pscale);
			// pg.image(img_ship,0,0);
			float tmp_phi=((float)frameCount/move_vel.x+move_phi.x);
			boolean dir=!(tmp_phi%TWO_PI<HALF_PI||tmp_phi%TWO_PI>HALF_PI*3);
			

			pg.beginShape();
			pg.texture(img_ship);
				pg.vertex(-104,-33,dir?0:1,0);
				pg.vertex(104,-33,dir?1:0,0);
				pg.vertex(104,33,dir?1:0,1);
				pg.vertex(-104,33,dir?0:1,1);
			pg.endShape();
		pg.popMatrix();

		pg.popStyle();



	}


}


class AStar{

	float _posx,_posy,_pscale;
	PVector move_amp;//
	float move_vel,move_phi;
	float move_delay;
	AStar(float set_posx,float set_posy){
		
		_posx=set_posx;
		_posy=set_posy;

		_pscale=random(.75,1);	
		
		float k=5;//random(5,20);
		move_amp=new PVector(-150*k,112*k);
		move_vel=random(100,200);
		
		move_phi=random(move_vel);
		
		move_delay=random(move_vel,move_vel*5);
	}
	void draw(PGraphics pg,PImage img_star){
		pg.pushStyle();
		pg.imageMode(CENTER);
		pg.textureMode(NORMAL);
		pg.noStroke();

		pg.pushMatrix();

		float _pos=constrain(((frameCount+move_phi)%(move_vel+move_delay))/move_vel,0,1);
		pg.translate(_posx,_posy);
		// pg.rotate(move_phi.y);
		pg.translate(move_amp.x*_pos,move_amp.y*_pos);
		
		pg.scale(_pscale);			
			pg.image(img_star,0,0);
		pg.popMatrix();

		pg.popStyle();



	}


}