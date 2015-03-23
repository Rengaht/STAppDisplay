class House{
	
	final int BLOW_INTERVAL=120;

	String user_name;

	float x,y,wid,hei;
	float vel,phi;
	color fcolor;
	int mlayer;
	PVector[] corners;
	float rotate_level=0;

	int blow_time;

	House(float x_,float y_,String name_){
		
		x=x_; y=y_; user_name=name_;

		wid=random(120,200);
		hei=random(120,240);

		vel=random(50,150);
		phi=random(TWO_PI);

		fcolor=color(random(200,255),random(200,255),random(200,255));
		mlayer=(int)random(5,8);

		float elayer=hei/(float)mlayer;
		corners=new PVector[mlayer*4];
		for(int i=0;i<mlayer;++i){
			corners[i*4]=new PVector(random(-.2,.2)*wid,(elayer*i)*random(.2,1.5));
			corners[i*4+1]=new PVector(random(.5,1.5)*wid,(elayer*i)*random(.3,1.5));
			corners[i*4+2]=new PVector(random(.8,1.5)*wid,(elayer*(i+1))*random(.5,1.2));
			corners[i*4+3]=new PVector(random(-.2,.2)*wid,(elayer*(i+1))*random(.2,1.8));
		}

	}
	void draw(PGraphics pg){
		float draw_portion=sin((float)frameCount/vel+phi);

		pg.pushMatrix();
		pg.translate(x+.15*wid*draw_portion,y+.2*hei*draw_portion);
		pg.pushStyle();
			pg.text(user_name,10,10);
			for(int i=0;i<mlayer;++i){
				pg.pushMatrix();
				pg.translate(wid/2,0);
				pg.rotateY((float)frameCount/(100*sin((float)i/2))*rotate_level);
				pg.translate(-wid/2,0);

				pg.fill(red(fcolor)*(1+.2*sin(i)),green(fcolor)*(1+.2*cos(i)),blue(fcolor),180);
				pg.beginShape();
					pg.vertex(corners[i*4].x,corners[i*4].y);
					pg.vertex(corners[i*4+1].x,corners[i*4+1].y);
					pg.vertex(corners[i*4+2].x,corners[i*4+2].y);
					pg.vertex(corners[i*4+3].x,corners[i*4+3].y);
				pg.endShape(CLOSE);
				pg.popMatrix();
			}

		pg.popStyle();

		pg.popMatrix();

		updateHouse();
	}
	void setRotateLevel(boolean up){
		if(up) rotate_level+=.1;
		else rotate_level-=.1;
	}
	void setBlow(){
		if(blow_time<=0) blow_time=BLOW_INTERVAL;

	}
	void updateHouse(){
		if(blow_time>0){
			blow_time--;
			rotate_level=3;
		}else rotate_level=0;

	}
}