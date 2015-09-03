class BuildBlock{
	PVector pos;
	PVector sizee;
	boolean to_talk;
	
	BuildBlock(float x,float y,float wid,float hei){
		init(new PVector(x,y),new PVector(wid,hei),false);
	}
	BuildBlock(float x,float y,float wid,float hei,boolean set_talk){
		init(new PVector(x,y),new PVector(wid,hei),set_talk);
	}
	BuildBlock(PVector set_pos,PVector set_size,boolean set_talk){
		init(set_pos,set_size,set_talk);
	}
	void init(PVector set_pos,PVector set_size,boolean set_talk){
		pos=set_pos.get();
		// pos.x+=set_size.x/2;
		// pos.y+=set_size.y/2;

		sizee=set_size.get();
		to_talk=set_talk;
	}
	void draw(PGraphics pg){
		pg.pushStyle();
		// pg.rectMode(CENTER);
		pg.stroke(255,0,0);
		pg.noFill();
		pg.rect(pos.x,pos.y,sizee.x,sizee.y);
		pg.popStyle();
	}

}

// void initMapBlock(){

// 	BuildBlock b1=new BuildBlock(0,0,344,163,false);
// 	BuildBlock b2=new BuildBlock(483,0,541,163,false);

// 	BuildBlock b3=new BuildBlock(1024,0,290,93,false);
// 	BuildBlock b4=new BuildBlock(1314,0,1478,118,false);
// 	BuildBlock b5=new BuildBlock(2792,0,297,93,false);

// 	BuildBlock b6=new BuildBlock(3090,0,438,135,false);
// 	BuildBlock b7=new BuildBlock(3527,0,521,164,false);
// 	BuildBlock b8=new BuildBlock(3024,308,1024,92,false);
// 	BuildBlock b9=new BuildBlock(2792,0,297,93,false);


// }