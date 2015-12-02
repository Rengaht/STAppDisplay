class AIsland{

	final int ORDER_PART[]={0,1,3,2,4,5};
	final int MLAYER=8;
	final int MPART=6;

	float _pscale;
	PVector _pos;
	PVector move_amp,move_vel,move_phi;

	ABuildPart[] arr_build_part;
	String build_name;

	PGraphics pg_text,pg_build,pg_build_born;
	PImage img_text;


	boolean cat3_light_on;

	AIslandAction istage;
	FrameAnimation ani_man_born,ani_house_born;

	FrameAnimation ani_turb;
	PVector pos_turb_src,pos_turb_dest,amp_turb;


	PShader shd_iland_merge;

	int acc_score;
	boolean is_default;

	AScore ascore;

	// ArrayList<AFlyScore> arr_score;
	CopyOnWriteArrayList<AFlyScore> arr_score;

	private Lock score_lock = new ReentrantLock();

	ARainGroup rain_group;


	AIsland(float set_posx,float set_posy,int color_type,boolean set_default){
		
		arr_score=new CopyOnWriteArrayList<AFlyScore>();
		

		init(set_posx,set_posy);

		is_default=set_default;

		if(is_default) setName();			
		
		ascore=new AScore(color_type,4);
		
	}
	
	void init(float set_posx,float set_posy){

		istage=AIslandAction.NONE;

		// _posx=set_posx;
		// _posy=set_posy;
		_pos=new PVector(set_posx,set_posy);


		move_amp=new PVector(15*random(.1,2),5*random(.1,1));
		move_vel=new PVector(random(120,180),random(120,180));
		move_phi=new PVector(random(TWO_PI),random(TWO_PI));

		ani_man_born=new FrameAnimation(60);
		ani_house_born=new FrameAnimation(60);
		ani_house_born.is_elastic=true;

		ani_turb=new FrameAnimation(180);

		rain_group=new ARainGroup();

		reset();
	}
	void reset(){
		_pscale=1;	

		arr_build_part=new ABuildPart[MPART];
		for(int i=0;i<MPART;++i) arr_build_part[i]=null;

		pg_build=null;
		pg_text=null;
		pg_build_born=null;


		cat3_light_on=true;
		
		build_name="";

		shd_iland_merge=loadShader("Island_Merge.frag");

		if(arr_score!=null) arr_score.clear();

		img_text=null;

	}
	void setName(){
		setName("",(int)random(5));
	}
	void setName(String set_name,int p5){

		arr_build_part[5]=new ABuildPart(p5,5,p5);	
		build_name=set_name;
		// drawTextGraph();

		img_text=null;

		istage=AIslandAction.MAN_BORN;
		ani_man_born.Start();
		
	}
	void setBuilding(){
		setBuilding((int)random(5),(int)random(4),(int)random(4),(int)random(4),(int)random(4));
	}
	int setBuilding(int b1,int p1,int p2,int p3,int p4){

		arr_build_part[0]=new ABuildPart(b1,0,0);  // build
		arr_build_part[1]=new ABuildPart(b1,1,p1); // cat1
		arr_build_part[2]=new ABuildPart(b1,2,p2); // cat2
		arr_build_part[3]=new ABuildPart(b1,3,p3); // cat3
		arr_build_part[4]=new ABuildPart(b1,4,p4); // cat4
	
		istage=AIslandAction.HOUSE_BORN;
		ani_house_born.Start();

		

		if(is_default) return 0;

		int tscore=0;
		tscore+=300*5;
		if(p4==0) tscore-=100;
		if(p4==1) tscore-=50;

		addScore(tscore,true);
		
		return tscore;

	}

	void setBuildingImage(PImage[] img_part){
		pg_build=createGraphics(162,288);

		pg_build.beginDraw();
		
		// pg_build.pushMatrix();
		// 	pg_build.translate(81,144);
				drawBuildGraph(pg_build,img_part,81,144);
		// pg_build.popMatrix();

		pg_build.endDraw();

		shd_iland_merge.set("src_texture",pg_build);

	}

	void draw(PGraphics pg,PImage[] img_part){

		// drawBuildGraph(img_part);


		pg.pushStyle();
		pg.imageMode(CENTER);

		// pg.stroke(255,0,0);
		pg.pushMatrix();
		
		if(istage==AIslandAction.TURB){
			float turb_t=ani_turb.GetPortion();
			float mov_t=(turb_t<.25)?0:((turb_t>.75)?1:(turb_t-.25)*2);
			PVector cur_pos=PVector.lerp(pos_turb_src,pos_turb_dest,mov_t);
			pg.translate(cur_pos.x,cur_pos.y);

			float virb_t=turb_t;//(turb_t<.25)?turb_t*4:((turb_t>.75)?(turb_t-.75)*4:0);
			pg.translate(move_amp.x*60*sin(PI*virb_t*amp_turb.x),move_amp.y*60*sin(PI*virb_t*amp_turb.y));

		}else{
			pg.translate(_pos.x+move_amp.x*sin((float)frameCount/move_vel.x+move_phi.x),_pos.y+move_amp.y*cos((float)frameCount/move_vel.y+move_phi.y));
		}

			/* draw land */
			if(img_part[0]!=null) pg.image(img_part[0],0,0);

			
			drawBuildGraph(pg,img_part,0,-90);
				

			/* draw people */
			if(img_part[8]!=null){
				pg.pushMatrix();
				pg.translate(60,-42);
				// pg.scale(ani_man_born.GetPortion());
				if(img_part[8]!=null){
					float twid=img_part[8].width;
					float thei=img_part[8].height;
					float offy=0;
					float tport=ani_man_born.GetPortion();
					pg.textureMode(IMAGE);
					pg.noStroke();

					pg.beginShape();
					pg.texture(img_part[8]);
						pg.vertex(-twid/2,thei/2-(thei-offy)*tport-offy,0,0);
						pg.vertex(twid/2,thei/2-(thei-offy)*tport-offy,twid,0);
						pg.vertex(twid/2,thei/2,twid,(thei-offy)*tport+offy);
						pg.vertex(-twid/2,thei/2,0,(thei-offy)*tport+offy);								
					pg.endShape();
				} //pg.image(img_part[i],0,0);

				pg.popMatrix();
			}

				

			// if(pg_text!=null) pg.image(pg_text,50,2);
			if(img_text!=null){
				pg.pushMatrix();
				pg.translate(60,-10);
				pg.scale(.7);
					pg.image(img_text,0,0);	
				pg.popMatrix();
			} 
						
			if(istage==AIslandAction.HOUSE && rain_group!=null) rain_group.draw(pg,-80,-RAIN_THRES);

			// score_lock.lock();

			pg.pushMatrix();
			pg.translate(0,-120);
				// for(AFlyScore score:arr_score) 
				// 	if(!score.isDead()) score.draw(pg);

				Iterator<AFlyScore> it=arr_score.iterator();
				while(it.hasNext()){
					AFlyScore score=it.next();
					if(!score.isDead()) score.draw(pg);
				}
			pg.popMatrix();

			// score_lock.unlock();



			if(!is_default && (istage==AIslandAction.TURB || istage==AIslandAction.HOUSE)){
				float score_scale=.3;
				pg.pushMatrix();
				pg.translate(0,10);
				pg.scale(score_scale);
					ascore.draw(pg,0,0);
				pg.popMatrix();
			}

		pg.popMatrix();

		pg.popStyle();

	}
	
	void drawBuildGraph(PGraphics pg,PImage[] img_part,float px,float py){
		try{
		pg.pushMatrix();
			pg.translate(px,py);
			pg.scale(.8);
			pg.imageMode(CENTER);

			float tport=ani_house_born.GetPortion();

			for(int x=1;x<MLAYER;++x){
				//int i=ORDER_PART[x]+1;
				int i=x;

				if(img_part[i]!=null){
					//if(arr_build_part[i-1].is_light && !cat3_light_on) continue; 
					if(i==2 && !cat3_light_on) continue; 
					
					float twid=img_part[i].width;
					float thei=img_part[i].height;
					float offy=0.3*thei;
					
					pg.textureMode(IMAGE);
					pg.noStroke();
					pg.pushMatrix();
					pg.translate(0,-thei*(1-constrain(tport,0,.5)*2));

					float vtport=(tport<.5)?0:1-(tport-.5)*2;
					pg.translate(random(-1,1)*(vtport)*20,random(-1,1)*(vtport)*20);
					pg.rotate(random(-1,1)*(vtport)*PI/12);

					pg.image(img_part[i],0,0);

					// pg.beginShape();
					// pg.texture(img_part[i]);
					// 	pg.vertex(-twid/2,thei/2-(thei-offy)*tport-offy,0,   0);
					// 	pg.vertex( twid/2,thei/2-(thei-offy)*tport-offy,twid,0);
					// 	pg.vertex( twid/2,thei/2-offy*(1-tport),		twid,(thei-offy)*tport+offy);
					// 	pg.vertex(-twid/2,thei/2-offy*(1-tport),		0,	 (thei-offy)*tport+offy);								
					// pg.endShape();

					pg.popMatrix();
				}
			}
		pg.popMatrix();
		}catch(Exception e){
			printlnA("[ERR]Draw BuildGraph: "+e.getMessage(),true);
		}
	}
	void drawBuildBorn(PGraphics pg,PImage build_img){
		
		

		// println("Draw Born!");
		// shd_iland_merge.set("t_port",ani_house_born.GetPortion());

		// pg_build_born.clear();

		pg.beginDraw();
			// pg_build_born.background(0,0);
			// pg_build_born.noStroke();
			// pg_build_born.shader(shd_iland_merge);
			// pg_build_born.rect(0,0,pg_build_born.width,pg_build_born.height);
			float twid=pg_build.width;
			float thei=pg_build.height;
			float offy=0;
			float tport=ani_house_born.GetPortion();
			pg.textureMode(IMAGE);
			pg.noStroke();

			pg.pushMatrix();
			pg.translate(twid/2,thei/2);
			pg.beginShape();
			pg.texture(build_img);
				pg.vertex(-twid/2,thei/2-(thei-offy)*tport-offy,0,0);
				pg.vertex(twid/2,thei/2-(thei-offy)*tport-offy,twid,0);
				pg.vertex(twid/2,thei/2,twid,(thei-offy)*tport+offy);
				pg.vertex(-twid/2,thei/2,0,(thei-offy)*tport+offy);								
			pg.endShape();
			pg.popMatrix();

		pg.endDraw();

	}
	void update(){

		switch(istage){
			case MAN_BORN:
				ani_man_born.Update();
				if(ani_man_born.GetPortion()==1){
					istage=AIslandAction.MAN;
					if(is_default) setBuilding(); 	
				}
				break;
			case HOUSE_BORN:
				ani_house_born.Update();
				if(ani_house_born.GetPortion()==1){
					istage=AIslandAction.HOUSE;
					for(AFlyScore score:arr_score)	score.start();
				} 

				// if(pg_build_born==null) pg_build_born=createGraphics(162,288,P3D);
				// drawBuildBorn(pg_build_born,pg_build);
				break;	
			case TURB:
				ani_turb.Update();
				if(!ani_turb.ani_start){
					istage=AIslandAction.HOUSE;
					_pos=pos_turb_dest.get();	
				} 
				break;
		}
		
		
		// score_lock.lock();
		
		// for(AScore score:arr_score) score.update();
		Iterator<AFlyScore> it=arr_score.iterator();
		while(it.hasNext()){
			AFlyScore score=it.next();
			score.update();
		    if(score.isDead()){
		    	acc_score+=score.mscore;
		    	ascore.setScore(acc_score);
		    	//it.remove();		        	
		    	arr_score.remove(score);
		    } 
		}
		ascore.update();

		// score_lock.unlock();



		for(ABuildPart part:arr_build_part) 
			if(part!=null) part.update();

		if(rain_group!=null) rain_group.update();

	}
	int triggerMove(int type){

		// acc_score+=25;
		if(istage!=AIslandAction.HOUSE) return 0;

		switch(type){
			case 0: //cat-2
				if(arr_build_part[2].start()){
					addScore(25,true);
					return 25;	
				} 
				break;
			case 1:	//cat-3
				if(arr_build_part[3].ipart>1){
					if(arr_build_part[3].start()){
						addScore(25,true);
						return 25;
					}
				}else{
					cat3_light_on=!cat3_light_on;
					addScore(25,true);
					return 25;	
				} 
				break;
			case 2: // rain
				if(rain_group!=null){
					if(rain_group.start()){
						addScore(25,true);
						return 25;
					} 
				}
				break;
			default :
				// acc_score-=25;
				break;	
		}

		return 0;
	}

	void triggerTurb(PVector dest_pos){
		
		if(istage==AIslandAction.HOUSE){
			
			printlnA("Trigger Turb!");

			pos_turb_dest=dest_pos.get();
			pos_turb_src=_pos.get();
			amp_turb=new PVector((int)random(2,6)*(random(2)<1?1:-1),(int)random(2,6)*(random(2)<1?1:-1));
			ani_turb.Restart();
			istage=AIslandAction.TURB;
		}
	}


	void gotoDie(){

		istage=AIslandAction.DEAD;
		reset();

	}

	void addScore(int add_score,boolean trigger){
		// acc_score+=add_score;
		
		// score_lock.lock();

		AFlyScore score=new AFlyScore(add_score);
		arr_score.add(score);
		if(trigger) score.start();


		// score_lock.unlock();

	}
}


class ABuildPart{

	boolean is_anim;
	int ibuild,icat,ipart;
	ImageSeq img_seq;
	
	boolean is_light;

	ABuildPart(int sibuild,int sicat,int sipart){
		
		ibuild=sibuild;
		icat=sicat;
		ipart=sipart;

		if(icat==2) is_anim=true;
		if(icat==3 && ipart>1) is_anim=true;
		
		if(icat==3 && ipart<2) is_light=true;
		else is_light=false;

		if(is_anim){
			img_seq=new ImageSeq(60);
			if(icat==3 && ipart>1) img_seq.reverse_looped=true;
		}else img_seq=new ImageSeq(5);
		
		img_seq.looped=false;

		// start();
	}
	void reset(){
		img_seq.reset();
	}
	boolean start(){
		printlnA("Part Start!");
		if(!img_seq.isplaying){
			img_seq.play();
			return true;	
		} 
		return false;
	}
	void stop(){
		img_seq.pause();
	}
	void update(){
		img_seq.update();
	}
	int getCurFrame(){
		return img_seq.getFrame();
	}

}

