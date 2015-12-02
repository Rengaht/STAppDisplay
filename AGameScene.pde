import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

PImage[] arr_img_red_num,arr_img_blue_num;

class AGameScene extends GameScene{

	final String DataFolder="GAME_A/";
	// final String CreatedFolder="F:/"
	final int MCLOUD=10;
	final int MISLAND=5;
	final int MBACK_GROUP=4; 
	final int IBUILD=5; /* #kind of building */
	final int MBUILD_PART=4; 
	final int IBUILD_PART=4;
	
	// final int ROUND_TIME=296000; //5:00
	// final int ROUND_BREAK_SPAN=5000;

	// final int BACKGOUNRD_SPAN_MIN=2; /* interval to change background */


	int mhouse=9;
	ConcurrentHashMap<String,AIsland> map_left_island;
	ConcurrentHashMap<String,AIsland> map_right_island;

	int mray=100;
	
	int start_min=0;
	int iback_group=0; // index of background type
	int ilast_back_group=0; // index of background type
	PImage[] arr_img_back;
	FrameAnimation ani_back_change;

	PImage[] arr_img_cloud;
	PImage[] arr_img_balloon;


	PImage[] arr_img_people;
	PImage img_island,img_spaceship,img_score;
	
	ArrayList<ArrayList<ArrayList<PImage>>> arr_img_build_part;
	PImage[] arr_img_winlose;
	
	PImage img_star;
	ArrayList<AStar> arr_star;


	ArrayList<ACloud> arr_left_acloud,arr_right_acloud;
	ASpaceShip[] arr_space_ship;
	ASpaceBalloon[] arr_space_ballon;
	ACloud[] arr_thin_cloud;

	int[] arr_acc_score;

	ANeonCat aneoncat;

	AScore[] arr_top_score;


	int round_start_time;
	int this_round_span;
	boolean first_to_join;


	@Override
	void loadFiles(){
		arr_img_build_part=new ArrayList<ArrayList<ArrayList<PImage>>>();
		for(int i=0;i<IBUILD;++i){
			ArrayList<ArrayList<PImage>> arr_build=new ArrayList<ArrayList<PImage>>();
			
			String mpart=DataFolder+"Building/"+char(65+i)+"/"+char(65+i)+"-main.png";
			println(mpart);
			PImage img_main=loadImage(mpart);
			ArrayList<PImage> arr_main=new ArrayList<PImage>();
			arr_main.add(img_main);
			arr_build.add(arr_main);
			
			for(int x=0;x<MBUILD_PART;++x){
				for(int y=0;y<IBUILD_PART;++y){
					ArrayList<PImage> arr_ani=new ArrayList<PImage>();
					
					if(x==1 ||(x==2 && y>1)){
						for(int a=0;a<60;++a){
							String fpart=getBuildPartFileName(i,x,y,a);
							if(fpart!=null){
								printlnA(fpart);
								PImage img_part=loadImage(fpart);
								arr_ani.add(img_part);	
							}
						}
					}else{
						String fpart=getBuildPartFileName(i,x,y,0);
						if(fpart!=null){
							printlnA(fpart);
							PImage img_part=loadImage(fpart);
							arr_ani.add(img_part);
						}
					}
					arr_build.add(arr_ani);
				}
			}
			arr_img_build_part.add(arr_build);
		}

		arr_img_back=new PImage[MBACK_GROUP*3];
		for(int i=0;i<MBACK_GROUP;++i){
			arr_img_back[i*3+0]=loadImage(DataFolder+"BG/bg_left-"+nf(i+1,1)+".png");
			arr_img_back[i*3+1]=loadImage(DataFolder+"BG/bg_right-"+nf(i+1,1)+".png");
			arr_img_back[i*3+2]=loadImage(DataFolder+"BG/bg_center-"+nf(i+1,1)+".png");
		}
		ani_back_change=new FrameAnimation(90);

		arr_img_cloud=new PImage[3];
		arr_img_cloud[0]=loadImage(DataFolder+"BG/cloud01.png");
		arr_img_cloud[1]=loadImage(DataFolder+"BG/cloud02.png");
		arr_img_cloud[2]=loadImage(DataFolder+"BG/cloud03.png");

		arr_img_balloon=new PImage[4];
		arr_img_balloon[0]=loadImage(DataFolder+"BG/balloon-1.png");
		arr_img_balloon[1]=loadImage(DataFolder+"BG/balloon-2.png");
		arr_img_balloon[2]=loadImage(DataFolder+"BG/balloon-3.png");
		arr_img_balloon[3]=loadImage(DataFolder+"BG/balloon-4.png");

		arr_left_acloud=new ArrayList<ACloud>();
		arr_right_acloud=new ArrayList<ACloud>();
		for(int i=0;i<MISLAND;++i){
			int mcloud=(int)random(2,4);
			for(int x=0;x<mcloud;++x){
				arr_left_acloud.add(new ACloud((i+.5)*204.8+random(-90,90),((i+1)%2*110+220+random(-30,20))));
			}			
			mcloud=(int)random(2,4);
			for(int x=0;x<mcloud;++x){
				arr_right_acloud.add(new ACloud((i+.5)*204.8+random(-90,90),((i+1)%2*110+220+random(-30,20))));
			}
		}




		img_island=loadImage(DataFolder+"BG/land1.png");
		img_spaceship=loadImage(DataFolder+"BG/airship.png");

		map_left_island=new ConcurrentHashMap<String,AIsland>();
		map_right_island=new ConcurrentHashMap<String,AIsland>();



		arr_img_people=new PImage[5];
		for(int i=0;i<5;++i){
			arr_img_people[i]=loadImage(DataFolder+"PEOPLE/people"+nf(i+1,1)+".png");
		}

		arr_space_ship=new ASpaceShip[2];
		for(int i=0;i<2;++i) arr_space_ship[i]=new ASpaceShip(i==0?Global_Param.Left_Screen_X:Global_Param.Right_Screen_X,random(45,65));

		arr_space_ballon=new ASpaceBalloon[4];
		for(int i=0;i<4;++i) arr_space_ballon[i]=new ASpaceBalloon((i<2?0:Global_Param.Right_Screen_X)+random(512*(i%2),512+512*(i%2)),384+random(20,100));
		
		arr_thin_cloud=new ACloud[8];
		for(int i=0;i<8;++i){
			arr_thin_cloud[i]=new ACloud((i<4?0:Global_Param.Right_Screen_X)+random(1024),random(120,180));
			arr_thin_cloud[i].icloud=2;
		} 


		arr_img_red_num=new PImage[10];
		arr_img_blue_num=new PImage[10];
		for(int i=0;i<10;++i){
			arr_img_red_num[i]=loadImage(DataFolder+"BG/number/number_red_"+i+".png");
			arr_img_blue_num[i]=loadImage(DataFolder+"BG/number/number_blue_"+i+".png");
		}
		img_score=loadImage(DataFolder+"BG/score.png");


		arr_img_winlose=new PImage[2];
		arr_img_winlose[0]=loadImage(DataFolder+"BG/win.png");
		arr_img_winlose[1]=loadImage(DataFolder+"BG/lose.png");


		img_star=loadImage(DataFolder+"BG/star.png");
		arr_star=new ArrayList<AStar>();
		int mstar=12;
		for(int i=0;i<=mstar;++i) arr_star.add(new AStar(4080/(float)mstar*i,-20));


		aneoncat=new ANeonCat(-100,80);


		arr_top_score=new AScore[2];
		arr_top_score[0]=new AScore(0,5);
		arr_top_score[1]=new AScore(1,5);


		img_qrcode_title=loadImage("APP_TITLE_01.png");

		this_round_span=Global_Param.AGame_Time_Span;

	}
	private String getBuildPartFileName(int ibuild,int icat,int ipart,int iframe){
		
		String fpart=null;

		if(icat==1 ||(icat==2 && ipart>1)){
			
			fpart=DataFolder+"Building/"+char(65+ibuild)+"/"+char(65+ibuild)+"-"+char(97+icat)+"-"+(ipart+1)+"/"
								+char(65+ibuild)+"-"+char(97+icat)+"-"+nf(ipart+1,1)+nf(iframe,5)+".png";
		}else{
			fpart=DataFolder+"Building/"+char(65+ibuild)+"/"+char(65+ibuild)+"-"+char(97+icat)+"-"+nf(ipart+1,1)+".png";
		}
		// println(fpart);
		if(fpart==null) printlnA("[ERR] illegal building part: "+ibuild+"-"+icat+"-"+ipart+"-"+iframe,true);

		return fpart;
	}
	@Override
	void Init(){
		super.Init();
		printlnA("Game A Init!!",true);

		map_right_island.clear();
		map_left_island.clear();
		
		addDefaultHouse();

		start_min=minute();	

		arr_acc_score=new int[2];
		for(int i=0;i<2;++i) arr_acc_score[i]=0;

		round_start_time=-1;

		if(!OFFLINE) photon_client.sendStartRunEvent();
	}

	int getRoundTime(){
		return (round_start_time<0)?0:millis()-round_start_time;
	}
	void startRound(){

		printlnA("------------ START ROUND ------------",true);

		super.StartGame();
		round_start_time=millis();

		first_to_join=true;
	}
	void clearIsland(){

		for(AIsland iland:map_left_island.values()){
			iland.gotoDie();
			// iland.reset();
		}
		for(AIsland iland:map_right_island.values()){
			iland.gotoDie();
			// iland.reset();
		}
		
		show_qrcode=false;

	}
	void endRound(){

		printlnA("------------ End Round ------------",true);		
		if(!OFFLINE){
			photon_client.sendScoreEvent(arr_acc_score[0],arr_acc_score[1],0,0);	
		} 
		this.EndGame();

		
	}


	@Override
	void Update(){
		
		// for(int i=0;i<2;++i) arr_acc_score[i]=0;

		for(AIsland iland:map_left_island.values()){
			iland.update();
			// arr_acc_score[0]+=iland.acc_score;
			if(iland.img_text==null && !iland.is_default){
				String file_name=drawIlandText(iland.build_name,1);
				if(file_name!=null) iland.img_text=loadImage(file_name);
			}
		}

		for(AIsland iland:map_right_island.values()){
			iland.update();
			// arr_acc_score[1]+=iland.acc_score;
			if(iland.img_text==null && !iland.is_default){
				String file_name=drawIlandText(iland.build_name,0);
				if(file_name!=null) iland.img_text=loadImage(file_name);
			}
		}
		
		
		for(ACloud acloud:arr_left_acloud) acloud.update();
		for(ACloud acloud:arr_right_acloud) acloud.update();
		for(ACloud acloud:arr_thin_cloud) acloud.update();

		// for(AStart astar:arr_star) astar.update();

		/* East Egg: Neon Cat! */
		if(DO_EASTER_EGG){
			aneoncat.update();
			if(iback_group==0 || iback_group==3)
				if(random(500)<1) triggerCat();
		}
		/* check backgroudn change routine */
		ani_back_change.Update();
		if(abs(minute()-start_min)>=Global_Param.AGame_Background_Span_Minute){
			ilast_back_group=iback_group;
			iback_group=(iback_group+1)%MBACK_GROUP;
			start_min=minute();
			ani_back_change.Restart();
		}

		/* update top score */
		for(int i=0;i<2;++i) arr_top_score[i].setScore(arr_acc_score[i]);
		for(int i=0;i<2;++i) arr_top_score[i].update();
		

		/* check round time */
		if(game_state==GameState.PLAY && getRoundTime()>=this_round_span) endRound();

	}

	@Override
	void DrawLeftScreen(PGraphics sub_pg){

		float tback=ani_back_change.GetPortion();
		sub_pg.pushStyle();
		if(tback<1){
			sub_pg.tint(255,255*(1-tback));
			sub_pg.image(arr_img_back[ilast_back_group*3],0,0);		

			sub_pg.tint(255,255*(tback));		
		}
		sub_pg.image(arr_img_back[iback_group*3],0,0);
		sub_pg.popStyle();


		if(iback_group!=1 && iback_group!=2){
			for(ASpaceShip ship:arr_space_ship) ship.draw(sub_pg,img_spaceship);
			for(AStar astar:arr_star) astar.draw(sub_pg,img_star);
		}else{
			for(ASpaceBalloon ball:arr_space_ballon) ball.draw(sub_pg,arr_img_balloon[ball.bindex]);
		}
		if(iback_group==2) for(ACloud acloud:arr_thin_cloud) acloud.draw(sub_pg,arr_img_cloud[acloud.icloud]);


		aneoncat.draw(sub_pg);


		for(AIsland iland:map_left_island.values()){
			iland.draw(sub_pg,getBuildPartImage(iland.arr_build_part));
			// drawIlandText(sub_pg,iland._pos.x,iland._pos.y,iland.build_name);
			// if(iland.img_text==null){
			// 	String file_name=drawIlandText(iland.build_name);
			// 	iland.img_text=loadImage(file_name);
			// }
		} 

		if(iback_group!=2) for(ACloud acloud:arr_left_acloud) acloud.draw(sub_pg,arr_img_cloud[acloud.icloud]);
		
		// for(int i=0;i<20;++i) pg.ellipse(random(width),random(height),20,20);
		// for(House house:left_house_map.values()) house.draw(sub_pg);

		if(game_state==GameState.END){
			if(arr_acc_score[0]>=arr_acc_score[1]) sub_pg.image(arr_img_winlose[0],172,78);
			else sub_pg.image(arr_img_winlose[1],172,78);
		}
	}

	@Override
	void DrawRightScreen(PGraphics sub_pg){
		// sub_pg.background(50);
		float tback=ani_back_change.GetPortion();
		sub_pg.pushStyle();
		if(tback<1){
			sub_pg.tint(255,255*(1-tback));
			sub_pg.image(arr_img_back[ilast_back_group*3+1],0,0);		

			sub_pg.tint(255,255*(tback));		
		}
		sub_pg.image(arr_img_back[iback_group*3+1],0,0);
		sub_pg.popStyle();
		

		sub_pg.pushMatrix();
		sub_pg.translate(-Global_Param.Right_Screen_X,0);
			if(iback_group!=1 && iback_group!=2){
				for(ASpaceShip ship:arr_space_ship) ship.draw(sub_pg,img_spaceship);
				for(AStar astar:arr_star) astar.draw(sub_pg,img_star);
			}else{
				for(ASpaceBalloon ball:arr_space_ballon) ball.draw(sub_pg,arr_img_balloon[ball.bindex]);	
			} 
			if(iback_group==2) for(ACloud acloud:arr_thin_cloud) acloud.draw(sub_pg,arr_img_cloud[acloud.icloud]);

			aneoncat.draw(sub_pg);

		sub_pg.popMatrix();

		// for(int i=0;i<mray;++i) arayline[i].draw(sub_pg);
		for(AIsland iland:map_right_island.values()) iland.draw(sub_pg,getBuildPartImage(iland.arr_build_part));

		if(iback_group!=2) for(ACloud acloud:arr_right_acloud) acloud.draw(sub_pg,arr_img_cloud[acloud.icloud]);
		

		if(game_state==GameState.END){
			if(arr_acc_score[1]>=arr_acc_score[0]) sub_pg.image(arr_img_winlose[0],172,78);
			else sub_pg.image(arr_img_winlose[1],172,78);
		}

	}

	@Override
	void DrawCenterScreen(PGraphics sub_pg){

		float tback=ani_back_change.GetPortion();
		sub_pg.pushStyle();
		if(tback<1){
			sub_pg.tint(255,255*(1-tback));
			sub_pg.image(arr_img_back[ilast_back_group*3+2],0,0);		

			sub_pg.tint(255,255*(tback));		
		}
		sub_pg.image(arr_img_back[iback_group*3+2],0,0);
		sub_pg.popStyle();

		sub_pg.pushMatrix();
		sub_pg.translate(-Global_Param.Left_Screen_X,0);
			if(iback_group!=1 && iback_group!=2){
				for(ASpaceShip ship:arr_space_ship) ship.draw(sub_pg,img_spaceship);
				for(AStar astar:arr_star) astar.draw(sub_pg,img_star);
			}else{
				for(ASpaceBalloon ball:arr_space_ballon) ball.draw(sub_pg,arr_img_balloon[ball.bindex]);	
			} 
			if(iback_group==2) for(ACloud acloud:arr_thin_cloud) acloud.draw(sub_pg,arr_img_cloud[acloud.icloud]);
			
			aneoncat.draw(sub_pg);
		sub_pg.popMatrix();

 
		sub_pg.pushStyle();
		// sub_pg.imageMode(CENTER);
		sub_pg.textAlign(CENTER);
		sub_pg.fill(255,255,0);
		sub_pg.stroke(255,255,0);
		sub_pg.textFont(timer_font,100);	

			int rtime=(game_state==GameState.PLAY)?floor((this_round_span-getRoundTime())/1000):0;
			int rmin=floor(rtime/60);
			int rsec=rtime%60;
					
			sub_pg.text(nf(rmin,2)+":"+nf(rsec,2),sub_pg.width/2,sub_pg.height+15);

		sub_pg.popStyle();

		// drawScoreNumber(sub_pg,(int)arr_acc_score[0],0);
		// drawScoreNumber(sub_pg,(int)arr_acc_score[1],1);
			
		arr_top_score[0].draw(sub_pg,250,27);
		arr_top_score[1].draw(sub_pg,2032-250,27);

	}

	


	// @Override
	void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){
		
		printlnA("GameA Got Event: "+event_code.toString());
	
		int left_right=0;
		AIsland iland=null;
		if(params.containsKey((byte)101)) left_right=(Integer)params.get((byte)101);
		if(params.containsKey((byte)100)) iland=getHouseById((String)params.get((byte)100),left_right);

		switch(event_code){
			case Server_Start_Run:
				//if((Integer)params.get((byte)1)==1) 
				double remain_time=(Double)params.get((byte)2);
				this_round_span=(int)remain_time;
				printlnA("Start Run! Time= "+floor(this_round_span/60000)+":"+(this_round_span%60000)/1000,true);
                startRound();
				break;

			case Server_Add_House:

				if(first_to_join){
					clearIsland();
					first_to_join=false;	
				} 

				addNewHouse((String)params.get((byte)100),(Integer)params.get((byte)101),false);
				break;

			case Server_Set_Name:
				String str_name=null;
				try{
					// String str_orig=(String)(params.get((byte)1));
					// byte[] bytes_name=str_orig.getBytes();
					byte[] bytes_name=(byte[])(params.get((byte)1));
					str_name=new String(bytes_name, "UTF-8");					

				}catch(Exception e){
					printlnA("[ERR] Convert name error: "+e,true);
				}
				setHouseName(iland,str_name,(Integer)params.get((byte)2));
				break;
			case Server_Set_House:
				setHousePart((left_right+1)%2,iland,(Integer)params.get((byte)1),(Integer)params.get((byte)2),(Integer)params.get((byte)3),(Integer)params.get((byte)4),
							 (Integer)params.get((byte)5));
				break;
			case Server_Set_Blow:
				setHouseTrigger((left_right+1)%2,iland,0);
				break;
			case Server_Set_Light:
				setHouseTrigger((left_right+1)%2,iland,1);
				break;
			case Server_Set_Shake:			
				setHouseTrigger((left_right+1)%2,iland,2);
				break;
			case Server_Set_User_Leave:
				if(iland!=null) iland.gotoDie();
				break;

			case Server_Score_Success:
				// restart game round
				// back to wait after 3 sec
//				Timer ending_timer=new Timer();
//		        TimerTask task=new TimerTask(){
//		            @Override
//		            public void run(){
//		                // connect();
//		                Init();
//		            }
//		        };
		       // ending_timer.schedule(task,Global_Param.AGame_Round_Break_Span);
                this.EndGame();
				break;

			case Server_LGG:
				printlnA("------The End------",true);
				this.EndGame();
				break;
			default :
				printlnA("[WARN] illegal event: "+event_code.toString(),true);
				break;	
		}


	}

	@Override
	int[] GetScores(){
		return new int[]{(int)arr_acc_score[0],(int)arr_acc_score[1]};
	}

	// void setRotateLevel(boolean up){
	// 	for(House house:house_map.values()) house.setRotateLevel(up);		
	// }

	// String createHouseId(){
	// 	return "a_user_"+UUID.randomUUID();
	// }

	AIsland getHouseById(String user_id,int left_right){
		AIsland iland=null;
		if(left_right==1) iland=map_left_island.get(user_id);
		else if(left_right==0) iland=map_right_island.get(user_id);

		return iland;
	}
	void addDefaultHouse(){

		for(int i=0;i<MISLAND;++i){
			addNewHouse("default_left_"+i,1,true);
			addNewHouse("default_right_"+i,0,true);
		}
	}
	void addNewHouse(String user_id,int left_right,boolean is_default){
		printlnA(">>> new house: "+user_id,!is_default);
		int i=-1;
		if(left_right==1){
			
			// synchronized(map_left_island){			

				boolean success=false;
				String key_rmv=null;
				AIsland iland=null;
				// AIsland sel_iland=null;

				if(map_left_island.containsKey(user_id)){
					success=true;
					key_rmv=user_id;
					iland=map_left_island.get(key_rmv);
				}else{
					for(String ikey:map_left_island.keySet()){
						iland=map_left_island.get(ikey);
						if(!ikey.equals(user_id) && iland.istage==AIslandAction.DEAD){
							success=true;
							key_rmv=ikey;
							break;
						}
					}
				}
				if(success){
					map_left_island.remove(key_rmv);	
					map_left_island.put(user_id,new AIsland(iland._pos.x,iland._pos.y,0,is_default));		

					printlnA("Remove: "+key_rmv+" add to pos: "+iland._pos.x+" , "+iland._pos.y);
				}else{
					if(is_default){
						i=map_left_island.size();
						map_left_island.put(user_id,new AIsland((i+.5)*204.8,(i+1)%2*110+180,0,is_default));
					}else printlnA("[WARN] NO PLACE TO ADD A NEW HOUSE",true);
				}

			// }
			// i=map_left_island.size();
			// if(i<MISLAND) map_left_island.put(user_id,new AIsland((i+.5)*204.8,(i+1)%2*110+180,is_default));
			// else println("NO PLACE TO ADD A NEW HOUSE");


		}else if(left_right==0){
				
			boolean success=false;
			String key_rmv=null;
			AIsland iland=null;

			if(map_right_island.containsKey(user_id)){
				success=true;
				key_rmv=user_id;
				iland=map_right_island.get(key_rmv);
			}else{
				for(String ikey:map_right_island.keySet()){
					iland=map_right_island.get(ikey);
					if(!ikey.equals(user_id) && iland.istage==AIslandAction.DEAD){
						success=true;
						key_rmv=ikey;
						break;
					}
				}
			}
			if(success){
				map_right_island.remove(key_rmv);	
				map_right_island.put(user_id,new AIsland(iland._pos.x,iland._pos.y,1,is_default));		

				printlnA("Remove: "+key_rmv);
			}else{
				if(is_default){
					i=map_right_island.size();
					map_right_island.put(user_id,new AIsland((i+.5)*204.8,(i+1)%2*110+180,1,is_default));
				}else printlnA("[WARN] NO PLACE TO ADD A NEW HOUSE",true);
			}

			// i=map_right_island.size();
			// if(i<MISLAND) map_right_island.put(user_id,new AIsland((i+.5)*204.8,(i+1)%2*110+180,is_default));
			// else println("NO PLACE TO ADD A NEW HOUSE");
		}
	}
	void setHouseName(AIsland iland,String set_name,int ipeople){
		if(iland==null){
			printlnA("Illegal House!!");
			return;
		}
		// drawIlandText(set_name);
		iland.setName(set_name,ipeople);
	}
	void setHousePart(int left_right,AIsland iland,int b1,int p1,int p2,int p3,int p4){
		if(iland==null){
			printlnA("Illegal House!!");
			return;
		}
		int score=iland.setBuilding(b1,p1,p2,p3,p4);

		arr_acc_score[left_right]+=score;

	}
	void setHouseTrigger(int left_right,AIsland iland,int type_trig){
		if(iland==null){
			printlnA("Illegal House!!");
			return;
		}
		int score=iland.triggerMove(type_trig);

		arr_acc_score[left_right]+=score;
	}


	PImage[] getBuildPartImage(ABuildPart[] arr_part){
		int mpart=arr_part.length;
		
		PImage[] img_part=new PImage[9];
		
		img_part[0]=img_island;
		
		for(int i=0;i<mpart;++i){
			if(arr_part[i]==null) continue;	
			
			int layer=getPartLayer(arr_part[i].icat,arr_part[i].ipart);
			img_part[layer]=getBuildPart(arr_part[i]);
		}
		
		return img_part;
	}
	private int getPartLayer(int icat,int ipart){

        switch(icat){
            case 0:
                return 1;
            case 1:
                if(ipart==3) return 6;
                else return 3;
            case 2:
                return 7;
            case 3:
                if(ipart<2) return 2;
                return 5;
            case 4:
                return 4;
            case 5:
             	return 8;
        }
        println("ERR part: "+icat+" "+ipart);
        return -1;
    }

	PImage getBuildPart(ABuildPart build_part){
		
		if(build_part==null) return null;

		PImage img=null;

		try{
			if(build_part.icat==0) //build
				img=arr_img_build_part.get(build_part.ibuild).get(0).get(build_part.getCurFrame());
			else if(build_part.icat<5)
				img=arr_img_build_part.get(build_part.ibuild).get(1+(build_part.icat-1)*IBUILD_PART+build_part.ipart).get(build_part.getCurFrame());
			else //people
				img=arr_img_people[build_part.ipart];
		}catch(Exception e){
			printlnA(e.toString());
			printlnA("[ERR] Build part: "+build_part.ibuild+" - "+build_part.icat+" - "+build_part.ipart);
			return null;
		}

		if(img==null){
			printlnA("[ERR] Cannot get: build part: "+build_part.ibuild+" - "+build_part.icat+" - "+build_part.ipart+" - "+build_part.getCurFrame());
			printlnA("[ERR] file: "+getBuildPartFileName(build_part.ibuild,build_part.icat,build_part.ipart,build_part.getCurFrame()));
		} 

		return img;
	}


	

	void triggerBuilding(){
		for(AIsland iland:map_left_island.values()){
			iland.triggerMove(0);
			iland.triggerMove(1);
			iland.triggerMove(2);
		} 
		for(AIsland iland:map_right_island.values()){
			iland.triggerMove(0);
			iland.triggerMove(1);
			iland.triggerMove(2);
		} 
	}

	void triggerTurb(){
		
		IntList change_pos=new IntList();
		for(int i=0;i<MISLAND;++i) change_pos.append(i);
		change_pos.shuffle();

		AIsland[] left_land=map_left_island.values().toArray(new AIsland[0]);
		for(int i=0;i<map_left_island.size();++i){
			PVector dest_pos=left_land[change_pos.get(i)]._pos.get();
			left_land[i].triggerTurb(dest_pos);
		} 
		for(ACloud acloud:arr_left_acloud) acloud.triggerTurb();

		AIsland[] right_land=map_right_island.values().toArray(new AIsland[0]);
		for(int i=0;i<map_right_island.size();++i){
			PVector dest_pos=right_land[change_pos.get(i)]._pos.get();
			right_land[i].triggerTurb(dest_pos);
		} 
		for(ACloud acloud:arr_right_acloud) acloud.triggerTurb();	

	}
	void triggerCat(){
		aneoncat.Restart();
	}
}

