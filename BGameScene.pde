
final int ITRANSCAR=8;
final float[] ROAD_LINE={240,795};

class BGameScene extends GameScene{

	final String DataFolder="GAME_B/";
	

	EnergyCar[] arr_car;	
	int iwinner;
	int mcur_player=0;

	Movie mov_back_center,mov_back_side;

	AlphaMovie mov_road_loop;
	
	AlphaMovie mov_road_left,mov_road_right;
	PImage[] arr_img_city;


	ArrayList<ArrayList<PImage>> arr_img_car;
	ArrayList<ArrayList<PImage>> arr_img_effect;
	PImage[] arr_img_origin_car;

	ArrayList<PImage> arr_img_icon;
	ArrayList<PImage> arr_img_icontext;

	PImage[] arr_mapcar_img;
	PImage[] arr_map_img;
	PImage[] arr_img_fighting;
	PImage[] arr_img_winlose;

	IconLine[] arr_icon_line;

	Timer timer_sleep;

	CountDown mcount_down;


	BGameScene(){
		super();
		arr_car=new EnergyCar[2];
		arr_car[0]=new EnergyCar(512,200,0);
		arr_car[1]=new EnergyCar(512,200,1);

		mcount_down=new CountDown(3);
	}

	@Override
	void loadFiles(){

		arr_img_car=new ArrayList<ArrayList<PImage>>();
		for(int i=0;i<ITRANSCAR;++i){
			arr_img_car.add(new ArrayList<PImage>());
			for(int x=0;x<59;++x){
				String _fn=DataFolder+"TRANSCAR/car"+nf(i+1,2)+"_/car/car"+nf(i+1,2)+"_"+nf(x,5)+".png";
				PImage _img=loadImage(_fn);
				(arr_img_car.get(i)).add(_img);
				println(_fn);
			}
		}

		arr_img_effect=new ArrayList<ArrayList<PImage>>();
		for(int i=0;i<ITRANSCAR;++i){
			arr_img_effect.add(new ArrayList<PImage>());
			for(int x=0;x<59;++x){
				String _fn=DataFolder+"TRANSCAR/car"+nf(i+1,2)+"_/effect/car"+nf(i+1,2)+"_effect_"+nf(x,5)+".png";
				PImage _img=loadImage(_fn);
				(arr_img_effect.get(i)).add(_img);
				println(_fn);
			}
		}


		
		arr_img_icon=new ArrayList<PImage>();
		for(int i=0;i<ITRANSCAR;++i){
			PImage _img=loadImage(DataFolder+"TRANSICON/icon-"+nf(i+1,2)+".png");
			arr_img_icon.add(_img);
		}

		arr_img_icontext=new ArrayList<PImage>();
		for(int i=0;i<ITRANSCAR;++i){
			PImage _img=loadImage(DataFolder+"ICONTEXT/icontext-"+nf(i+1,2)+".png");
			arr_img_icontext.add(_img);	
		}

		arr_img_origin_car=new PImage[4];
		arr_img_origin_car[0]=loadImage(DataFolder+"car00_blue.png");
		arr_img_origin_car[1]=loadImage(DataFolder+"car00_red.png");
		arr_img_origin_car[2]=loadImage(DataFolder+"other_1.png");
		arr_img_origin_car[3]=loadImage(DataFolder+"other_2.png");


		arr_mapcar_img=new PImage[3];
		arr_mapcar_img[0]=loadImage(DataFolder+"map_car_blue.png");
		arr_mapcar_img[1]=loadImage(DataFolder+"map_car_red.png");
		arr_mapcar_img[2]=loadImage(DataFolder+"map_car_blue_right.png");


		arr_map_img=new PImage[2];
		arr_map_img[0]=loadImage(DataFolder+"map_blue.png");
		arr_map_img[1]=loadImage(DataFolder+"map_red.png");

		mov_back_center=new Movie(gapplet,DataFolder+"BACK/BACK_CENTER.mov");
		mov_back_side=new Movie(gapplet,DataFolder+"BACK/BACK_SIDE.mov");

		mov_road_left=new AlphaMovie(gapplet,DataFolder+"BACK/raceScene_sign.mov");
		mov_road_right=new AlphaMovie(gapplet,DataFolder+"BACK/raceScene_sign.mov");

		mov_road_loop=new AlphaMovie(gapplet,DataFolder+"BACK/raceScene_empty.mov");

		arr_img_city=new PImage[2];
		arr_img_city[0]=loadImage(DataFolder+"BACK/city_01.png");
		arr_img_city[1]=loadImage(DataFolder+"BACK/city_02.png");

		arr_img_fighting=new PImage[2];
		arr_img_fighting[0]=loadImage(DataFolder+"Fighting_yellow.png");
		arr_img_fighting[1]=loadImage(DataFolder+"Fighting_red.png");

	
		arr_img_winlose=new PImage[2];
		arr_img_winlose[0]=loadImage(DataFolder+"sign_win.png");
		arr_img_winlose[1]=loadImage(DataFolder+"sign_lose.png");


		arr_icon_line=new IconLine[6];
		arr_icon_line[0]=new IconLine((int)random(ITRANSCAR),-1);
		arr_icon_line[1]=new IconLine((int)random(ITRANSCAR),0);
		arr_icon_line[2]=new IconLine((int)random(ITRANSCAR),1);
		arr_icon_line[3]=new IconLine((int)random(ITRANSCAR),-1);
		arr_icon_line[4]=new IconLine((int)random(ITRANSCAR),0);
		arr_icon_line[5]=new IconLine((int)random(ITRANSCAR),1);
		

	}
	@Override
	void Init(){

		super.Init();
		
		println("--------- Game B Init ---------");
		


		mov_back_center.loop();
		mov_back_side.loop();

		mov_road_loop.loop();

		// CAR_DEST_DIST=mov_road_left.duration();

		for(int i=0;i<2;++i) arr_car[i].reset();

		
	}


	@Override
	void Update(){

		

		for(int i=0;i<2;++i){
			EnergyCar car=arr_car[i];
			int cur_frame=car.getCurFrame();
			PImage cur_img=(car.cur_icar<0 || car.cur_icar>=ITRANSCAR)?arr_img_origin_car[i]:arr_img_car.get(car.cur_icar).get(cur_frame);
			PImage dest_img=(car.dest_icar<0 || car.dest_icar>=ITRANSCAR)?arr_img_origin_car[i]:arr_img_car.get(car.dest_icar).get(cur_frame);			

			int cur_eframe=car.getCurEffectFrame();
			PImage dest_effect=(car.dest_icar<0 || car.dest_icar>=ITRANSCAR)?null:arr_img_effect.get(car.dest_icar).get(cur_eframe);			
			
			car.update(cur_img,dest_img,dest_effect);

		}
		

		if(game_state==GameState.WAIT){
			for(int i=0;i<2;++i){
				if(random(30)<1){
					arr_car[i].updatePosition((int)random(-2,2));
				}
			}
			mov_road_loop.read();

		}else if(game_state==GameState.COUNT_DOWN){

			mcount_down.update();
			if(mcount_down.isFinished()){
				if(!OFFLINE) photon_client.sendStartRunEvent();	
				mcount_down.reset();
			}

		}else if(game_state==GameState.PLAY){
			if(mcur_player==1){
				if(random(50)<1) arr_car[1].updatePosition((int)random(-2,2));
			}


			for(IconLine icon:arr_icon_line) icon.update();

			for(int i=0;i<3;++i){
				IconLine _icon=arr_icon_line[i];
				if(_icon.isReached() && !_icon.is_explode){
					
					if(abs(_icon.pos_x-arr_car[0].getCurPosition())<.1){
						PImage _icontext=(_icon.icon_index<ITRANSCAR)?arr_img_icontext.get(_icon.icon_index):null;
						arr_car[0].changeCar(_icon.icon_index,_icontext);
						_icon.startExplode(_icontext);								
					} 
				}
			}

			for(int i=3;i<6;++i){
				IconLine _icon=arr_icon_line[i];
				if(_icon.isReached() && !_icon.is_explode){
					//println("icon "+i+" reached!  "+_icon.pos_x+"  "+arr_car[0].getCurPosition());
					if(abs(_icon.pos_x-arr_car[1].getCurPosition())<.1){
						PImage _icontext=(_icon.icon_index<ITRANSCAR)?arr_img_icontext.get(_icon.icon_index):null;
						arr_car[1].changeCar(_icon.icon_index,_icontext);
						_icon.startExplode(_icontext);								
					} 
				}
			}

			mov_road_left.speed(arr_car[0].getCurVel());
			mov_road_right.speed(arr_car[1].getCurVel());

			
			arr_car[0].run_distance=mov_road_left.time();
			arr_car[1].run_distance=mov_road_right.time();
			// println(arr_car[0].run_distance+"  "+arr_car[1].run_distance);

		

			boolean one_arrive=false;
			for(int i=0;i<2;++i){
				 EnergyCar car=arr_car[i];
				 //car.update();
				 if(car.arriveGoal()){
				 	one_arrive=true;
				 	iwinner=i;
				 	println("Car "+i+" ARRIVE!!");
				 	break;
				 }
			}
			if(one_arrive){
				 
				 int[] scores=GetScores();
				 // if(!OFFLINE) photon_client.sendScoreEvent(scores[0],scores[1]);
				 endRound();
			}
		}else{
			
		}

		mov_back_center.read();
		mov_back_side.read();

		mov_road_left.read();
		mov_road_right.read();

		
	}
	
	
	@Override
	void DrawLeftScreen(PGraphics sub_pg){
		// hint(DISABLE_DEPTH_TEST);
		sub_pg.hint(DISABLE_DEPTH_TEST);
		//sub_pg.background(255);
		
		sub_pg.image(mov_back_side,0,0);
		
		if(game_state==GameState.WAIT) sub_pg.image(mov_road_loop,0,0);	
		else sub_pg.image(mov_road_left,0,0);
		
		

		switch(game_state){
			case COUNT_DOWN:
				mcount_down.draw(sub_pg,512,192);
				break;
			case END:
				if(arr_car[0].getScore()>=arr_car[1].getScore()) sub_pg.image(arr_img_winlose[0],89,24.5);
				else sub_pg.image(arr_img_winlose[1],89,24.5);
				break;		

			case PLAY:

				for(int i=0;i<3;++i){
					int _index=arr_icon_line[i].icon_index;
					PImage _icon=(_index>ITRANSCAR-1)?arr_img_origin_car[_index-ITRANSCAR+2]:arr_img_icon.get(_index);
					
					arr_icon_line[i].draw(sub_pg,_icon);	
				} 
				break;
		}
		arr_car[0].draw(sub_pg);
		
	}

	@Override
	void DrawRightScreen(PGraphics sub_pg){

		sub_pg.hint(DISABLE_DEPTH_TEST);
		//sub_pg.background(255);
		sub_pg.image(mov_back_side,0,0);
		
		if(game_state==GameState.WAIT){
			sub_pg.image(mov_road_loop,0,0);		
			arr_car[1].draw(sub_pg);			

		}else{

			// if(mcur_player==2){
				sub_pg.image(mov_road_right,0,0);
				
				
				switch(game_state){
					case COUNT_DOWN:
						mcount_down.draw(sub_pg,512,192);
						break;
					case END:
						if(arr_car[1].getScore()>=arr_car[0].getScore()) sub_pg.image(arr_img_winlose[0],89,24.5);
						else sub_pg.image(arr_img_winlose[1],89,24.5);
						break;

					case PLAY:
						for(int i=3;i<6;++i){
							int _index=arr_icon_line[i].icon_index;
							PImage _icon=(_index>ITRANSCAR-1)?arr_img_origin_car[_index-ITRANSCAR+2]:arr_img_icon.get(_index);
							
							arr_icon_line[i].draw(sub_pg,_icon);		
						}	
				}
				arr_car[1].draw(sub_pg);
		} 
		
		
	}

	@Override
	void DrawCenterScreen(PGraphics sub_pg){
		sub_pg.background(255);
		sub_pg.image(mov_back_center,0,0);
		
			
			sub_pg.pushMatrix();
			sub_pg.translate(80,88);
				sub_pg.pushStyle();
				sub_pg.rectMode(CENTER);
				sub_pg.noStroke();
				sub_pg.fill(255,120);
				sub_pg.rect(0,0,120,120,16);
				sub_pg.popStyle();
			sub_pg.popMatrix();

			sub_pg.pushMatrix();
			sub_pg.translate(160,50);
				sub_pg.image(arr_map_img[0],0,0);
			sub_pg.popMatrix();

			sub_pg.pushMatrix();
				sub_pg.pushStyle();
				sub_pg.tint(255,255*abs(sin((float)frameCount/8)),255);
				sub_pg.image(arr_img_fighting[0],1016-336,88-35);
				sub_pg.popStyle();
			sub_pg.popMatrix();
			
			sub_pg.pushMatrix();
			sub_pg.translate(1952,88);
				sub_pg.pushStyle();
				sub_pg.rectMode(CENTER);
				sub_pg.noStroke();
				sub_pg.fill(255,120);
					sub_pg.rect(0,0,120,120,16);
				sub_pg.popStyle();
			sub_pg.popMatrix();

			sub_pg.pushMatrix();
			sub_pg.translate(2032-160,50);
				sub_pg.image(arr_map_img[1],-arr_map_img[1].width,0);
			sub_pg.popMatrix();				

		if(game_state==GameState.WAIT) return;
		

		sub_pg.pushMatrix();
		sub_pg.translate(80,88);
			sub_pg.pushStyle();
			sub_pg.rectMode(CENTER);
			sub_pg.noStroke();
			sub_pg.fill(255,120);
			sub_pg.rect(0,0,120,120,16);
			sub_pg.popStyle();
			PImage cur_icon=(arr_car[0].cur_icar<0 || arr_car[0].cur_icar>=ITRANSCAR)?null:arr_img_icon.get(arr_car[0].cur_icar);
			PImage dest_icon=(arr_car[0].dest_icar<0 || arr_car[0].dest_icar>=ITRANSCAR)?null:arr_img_icon.get(arr_car[0].dest_icar);
			arr_car[0].drawIcon(sub_pg,cur_icon,dest_icon);
		sub_pg.popMatrix();

		sub_pg.pushMatrix();
		sub_pg.translate(160,50);
			// sub_pg.image(arr_map_img[0],0,0);
			// 	// float left_pos=arr_car[0].run_distance;
	
			float left_pos=arr_car[0].run_distance/CAR_DEST_DIST;
			sub_pg.pushStyle();
			sub_pg.imageMode(CENTER);
			sub_pg.translate(30+left_pos*387,0);
				sub_pg.image(arr_mapcar_img[0],0,76);
			sub_pg.popStyle();
	
		sub_pg.popMatrix();

		
		sub_pg.pushMatrix();
		sub_pg.translate(1952,88);
			sub_pg.pushStyle();
			sub_pg.rectMode(CENTER);
			sub_pg.noStroke();
			sub_pg.fill(255,120);
				sub_pg.rect(0,0,120,120,16);
			sub_pg.popStyle();
			// if(mcur_player==2){
				PImage rcur_icon=(arr_car[1].cur_icar<0 || arr_car[1].cur_icar>=ITRANSCAR)?null:arr_img_icon.get(arr_car[1].cur_icar);
				PImage rdest_icon=(arr_car[1].dest_icar<0 || arr_car[1].dest_icar>=ITRANSCAR)?null:arr_img_icon.get(arr_car[1].dest_icar);
				arr_car[1].drawIcon(sub_pg,rcur_icon,rdest_icon);				
			// } else if(mcur_player==1){
			// 	arr_car[0].drawIcon(sub_pg,cur_icon,dest_icon);
			// }			
		sub_pg.popMatrix();

		sub_pg.pushMatrix();
		sub_pg.translate(2032-160,50);
			// sub_pg.image(arr_map_img[1],-arr_map_img[1].width,0);

			// float right_pos=arr_car[1].run_distance;
			float right_pos=0;
			// if(mcur_player==2){
				right_pos=arr_car[1].run_distance/CAR_DEST_DIST;				
			// }else if(mcur_player==1){
			// 	right_pos=left_pos;
			// }
			sub_pg.pushStyle();
				sub_pg.imageMode(CENTER);
				sub_pg.translate(-30-right_pos*387,0);
				// if(mcur_player==2) 
					sub_pg.image(arr_mapcar_img[1],0,76);
				// else if(mcur_player==1) sub_pg.image(arr_mapcar_img[2],0,76);
			sub_pg.popStyle();
		sub_pg.popMatrix();
	}



	@Override
	void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){

		println("GameB Got Event: "+event_code.toString());
		
		switch(event_code){
			case Server_Game_Start:
				mcur_player=(Integer)params.get((byte)201);
				arr_car[0].user_id=(String)params.get((byte)100);
				if(mcur_player==2) arr_car[1].user_id=(String)params.get((byte)200);
				StartGame();
				break;
			case Server_Start_Run:
				startRoad();
				break;

			// case Server_User_Color:
			// 	int car_color=(Integer)params.get((byte)1);
			// 	if(car_color>=0 && car_color<=1) arr_car[car_color].user_id=(String)params.get((byte)100);
			// 	break;
			case Server_Set_Rotate:
				if(game_state==GameState.PLAY){
					int car_index=(Integer)params.get((byte)101);
					int car_position=(Integer)params.get((byte)1);
					if(car_index==0 || car_index==1) arr_car[car_index].updatePosition(car_position);
				}
				break;
			case Server_Score_Success:

				break;
			case Server_LGG:
				println("------The End------");
				this.EndGame();
				break;
			default :
				println("Illegal event: "+event_code.toString());
				break;	
		}

	}

	@Override
	int[] GetScores(){
		return new int[]{arr_car[0].getScore(),arr_car[1].getScore()};
	}

	@Override
	void StartGame(){

		if(timer_sleep!=null){
			timer_sleep.cancel();
			timer_sleep=null;
			// this.Init();
		}
	
		super.StartGame();
		game_state=GameState.COUNT_DOWN;
		iwinner=-1;
		
		for(int i=0;i<2;++i) arr_car[i].reset();
		// for(IconLine icon:arr_icon_line) icon.restart();
		for(IconLine icon:arr_icon_line) icon.pause();
	
		mov_road_right.play();
		mov_road_right.jump(0);
		mov_road_right.pause();

		mov_road_left.play();		
		mov_road_left.jump(0);
		mov_road_left.pause();


		mcount_down.start();


		// CAR_DEST_DIST=mov_road_left.duration();
		println("CAR_DEST_DIST= "+CAR_DEST_DIST);

		mov_road_loop.stop();

		if(OFFLINE) startRoad();
	}
	void startRoad(){

		game_state=GameState.PLAY;

		

		for(int i=0;i<mcur_player;++i) arr_car[i].startRun();
		for(IconLine icon:arr_icon_line) icon.restart();

		
		mov_road_right.play();

		mov_road_left.play();		

	}
	void endRound(){

		println("----- End Round -----");
		mov_road_left.pause();
		mov_road_right.pause();

		
		for(EnergyCar car:arr_car) car.stopRun();
		for(IconLine icon:arr_icon_line) icon.pause();

		if(!OFFLINE){
			int send_icar1=arr_car[0].cur_icar;
			if(send_icar1==-1) send_icar1=8;
			int send_icar2=arr_car[1].cur_icar;
			if(send_icar2==-1) send_icar1=9;
			
			photon_client.sendScoreEvent(arr_car[0].getScore(),arr_car[1].getScore(),send_icar1,send_icar2);	
		} 

		super.EndGame();

		timer_sleep=new Timer();
        TimerTask task=new TimerTask(){
            @Override
            public void run(){
                Init();
            }
        };
        timer_sleep.schedule(task, 5000);
		// this.Init();
	}

	@Override
	void EndGame(){
		super.EndGame();

		mov_back_side.stop();
		mov_back_center.stop();

		mov_road_left.stop();
		mov_road_right.stop();

		mov_road_loop.stop();
	}
	@Override
	void unloadFiles(){

		arr_img_car.clear();

		arr_img_effect.clear();

		
		arr_img_icon.clear();

		arr_img_icontext.clear();

		arr_img_origin_car=null;

		arr_mapcar_img=null;
		arr_map_img=null;

		mov_back_center=null;
		mov_back_side=null;

		mov_road_left=null;
		mov_road_right=null;

		mov_road_loop=null;

		arr_img_city=null;
		arr_img_fighting=null;
		

		arr_icon_line=null;
		
	}
}