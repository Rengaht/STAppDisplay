import java.util.UUID;


class AGameScene extends GameScene{

	final String DataFolder="GAME_A/";
	final int MCLOUD=10;
	final int MISLAND=5;
	final int IBUILD=5;
	final int MBUILD_PART=4;
	final int IBUILD_PART=4;

	int mhouse=9;
	HashMap<String,AIsland> map_left_island;
	HashMap<String,AIsland> map_right_island;

	int mray=100;
	
	PImage[] arr_img_back;
	PImage[] arr_img_cloud;
	PImage[] arr_img_people;
	PImage img_island,img_spaceship,img_score;
	PImage[] arr_img_red_num,arr_img_blue_num;
	ArrayList<ArrayList<ArrayList<PImage>>> arr_img_build_part;
	PImage[] arr_img_winlose;
	
	PImage img_star;
	ArrayList<AStar> arr_star;


	ArrayList<ACloud> arr_left_acloud,arr_right_acloud;
	ASpaceShip[] arr_space_ship;


	int[] arr_acc_score;

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
								println(fpart);
								PImage img_part=loadImage(fpart);
								arr_ani.add(img_part);	
							}
						}
					}else{
						String fpart=getBuildPartFileName(i,x,y,0);
						if(fpart!=null){
							println(fpart);
							PImage img_part=loadImage(fpart);
							arr_ani.add(img_part);
						}
					}
					arr_build.add(arr_ani);
				}
			}
			arr_img_build_part.add(arr_build);
		}

		arr_img_back=new PImage[3];
		arr_img_back[0]=loadImage(DataFolder+"BG/bg_left.png");
		arr_img_back[1]=loadImage(DataFolder+"BG/bg_right.png");
		arr_img_back[2]=loadImage(DataFolder+"BG/bg_center.png");
			
		arr_img_cloud=new PImage[2];
		arr_img_cloud[0]=loadImage(DataFolder+"BG/cloud01.png");
		arr_img_cloud[1]=loadImage(DataFolder+"BG/cloud02.png");

		arr_left_acloud=new ArrayList<ACloud>();
		arr_right_acloud=new ArrayList<ACloud>();
		for(int i=0;i<MISLAND;++i){
			int mcloud=(int)random(2,4);
			for(int x=0;x<mcloud;++x){
				arr_left_acloud.add(new ACloud((i+.5)*204.8+random(-90,90),((i+1)%2*110+220+random(-30,20))));
			}
			// tmpi=(int)random(MISLAND);
			mcloud=(int)random(2,4);
			for(int x=0;x<mcloud;++x){
				arr_right_acloud.add(new ACloud((i+.5)*204.8+random(-90,90),((i+1)%2*110+220+random(-30,20))));
			}
		}



		img_island=loadImage(DataFolder+"BG/land1.png");
		img_spaceship=loadImage(DataFolder+"BG/airship.png");

		map_left_island=new HashMap<String,AIsland>();
		map_right_island=new HashMap<String,AIsland>();



		arr_img_people=new PImage[5];
		for(int i=0;i<5;++i){
			arr_img_people[i]=loadImage(DataFolder+"PEOPLE/people"+nf(i+1,1)+".png");
		}

		arr_space_ship=new ASpaceShip[2];
		for(int i=0;i<2;++i) arr_space_ship[i]=new ASpaceShip(i==0?Left_Screen_X:Right_Screen_X,random(45,65));

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
		int mstar=8;
		for(int i=0;i<mstar;++i) arr_star.add(new AStar(4080/(float)mstar*i*random(.7,1.3),-20));

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
		if(fpart==null) println("illegal building part: "+ibuild+"-"+icat+"-"+ipart+"-"+iframe);

		return fpart;
	}
	@Override
	void Init(){
		super.Init();
		
		map_right_island.clear();
		map_left_island.clear();
		
		addDefaultHouse();

		

		arr_acc_score=new int[2];
		for(int i=0;i<2;++i) arr_acc_score[i]=0;

	}
	@Override void StartGame(){
		
		super.StartGame();

		
		for(AIsland iland:map_left_island.values()){
			iland.gotoDie();
		}
		for(AIsland iland:map_right_island.values()){
			iland.gotoDie();
		}
			
	}


	@Override
	void Update(){
		
		for(int i=0;i<2;++i) arr_acc_score[i]=0;

		for(AIsland iland:map_left_island.values()){
			iland.update();
			arr_acc_score[0]+=iland.acc_score;
			if(iland.img_text==null && !iland.is_default){
				String file_name=drawIlandText(iland.build_name);
				if(file_name!=null) iland.img_text=loadImage(file_name);
			}
		}

		for(AIsland iland:map_right_island.values()){
			iland.update();
			arr_acc_score[1]+=iland.acc_score;
			if(iland.img_text==null && !iland.is_default){
				String file_name=drawIlandText(iland.build_name);
				if(file_name!=null) iland.img_text=loadImage(file_name);
			}
		}
		 
		
		for(ACloud acloud:arr_left_acloud) acloud.update();
		for(ACloud acloud:arr_right_acloud) acloud.update();
			
		// for(AStart astar:arr_star) astar.update();
	}

	@Override
	void DrawLeftScreen(PGraphics sub_pg){

		// sub_pg.background(50);
		sub_pg.image(arr_img_back[0],0,0);
		// for(int i=0;i<mray;++i) arayline[i].draw(sub_pg);
		
		for(ASpaceShip ship:arr_space_ship) ship.draw(sub_pg,img_spaceship);
		for(AStar astar:arr_star) astar.draw(sub_pg,img_star);
		
		for(AIsland iland:map_left_island.values()){
			iland.draw(sub_pg,getBuildPartImage(iland.arr_build_part));
			// drawIlandText(sub_pg,iland._pos.x,iland._pos.y,iland.build_name);
			// if(iland.img_text==null){
			// 	String file_name=drawIlandText(iland.build_name);
			// 	iland.img_text=loadImage(file_name);
			// }
		} 

		for(ACloud acloud:arr_left_acloud) acloud.draw(sub_pg,arr_img_cloud[acloud.icloud]);
		
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
		sub_pg.image(arr_img_back[1],0,0);

		sub_pg.pushMatrix();
		sub_pg.translate(-Right_Screen_X,0);
			for(ASpaceShip ship:arr_space_ship) ship.draw(sub_pg,img_spaceship);
			for(AStar astar:arr_star) astar.draw(sub_pg,img_star);
		sub_pg.popMatrix();

		// for(int i=0;i<mray;++i) arayline[i].draw(sub_pg);
		for(AIsland iland:map_right_island.values()) iland.draw(sub_pg,getBuildPartImage(iland.arr_build_part));

		for(ACloud acloud:arr_right_acloud) acloud.draw(sub_pg,arr_img_cloud[acloud.icloud]);
		
		if(game_state==GameState.END){
			if(arr_acc_score[1]>=arr_acc_score[0]) sub_pg.image(arr_img_winlose[0],172,78);
			else sub_pg.image(arr_img_winlose[1],172,78);
		}

	}

	@Override
	void DrawCenterScreen(PGraphics sub_pg){

		sub_pg.image(arr_img_back[2],0,0);

		sub_pg.pushMatrix();
		sub_pg.translate(-Left_Screen_X,0);
			for(ASpaceShip ship:arr_space_ship) ship.draw(sub_pg,img_spaceship);
			for(AStar astar:arr_star) astar.draw(sub_pg,img_star);
		sub_pg.popMatrix();

		sub_pg.pushStyle();
		sub_pg.imageMode(CENTER);
			sub_pg.image(img_score,sub_pg.width/2,sub_pg.height/2);
		sub_pg.popStyle();

		drawScoreNumber(sub_pg,(int)arr_acc_score[0],0);
		drawScoreNumber(sub_pg,(int)arr_acc_score[1],1);

	}

	


	// @Override
	void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){
		
		println("GameA Got Event: "+event_code.toString());
		AIsland iland=getHouseById((String)params.get((byte)100),(Integer)params.get((byte)101));

		switch(event_code){
			case Server_Add_House:
				if(game_state==GameState.WAIT) StartGame();
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
					println("convert name error: "+e);
				}
				setHouseName(iland,str_name,(Integer)params.get((byte)2));
				break;
			case Server_Set_House:
				setHousePart(iland,(Integer)params.get((byte)1),(Integer)params.get((byte)2),(Integer)params.get((byte)3),(Integer)params.get((byte)4),
							 (Integer)params.get((byte)5));
				break;
			case Server_Set_Blow:
				setHouseTrigger(iland,0);
				break;
			case Server_Set_Light:
				setHouseTrigger(iland,1);
				break;
			case Server_Set_Shake:			
				setHouseTrigger(iland,2);
				break;
			case Server_LGG:
				println("------The End------");
				this.EndGame();
				break;
			default :
				println("illegal event: "+event_code.toString());
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
		println(">>new house: "+user_id);
		int i=-1;
		if(left_right==1){
			
			boolean success=false;
			String key_rmv=null;
			AIsland iland=null;

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
					}
				}
			}
			if(success){
				map_left_island.remove(key_rmv);	
				map_left_island.put(user_id,new AIsland(iland._pos.x,iland._pos.y,is_default));		

				println("Remove: "+key_rmv);
			}else{
				if(is_default){
					i=map_left_island.size();
					map_left_island.put(user_id,new AIsland((i+.5)*204.8,(i+1)%2*110+180,is_default));
				}else println("NO PLACE TO ADD A NEW HOUSE");
			}


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
					}
				}
			}
			if(success){
				map_right_island.remove(key_rmv);	
				map_right_island.put(user_id,new AIsland(iland._pos.x,iland._pos.y,is_default));		

				println("Remove: "+key_rmv);
			}else{
				if(is_default){
					i=map_right_island.size();
					map_right_island.put(user_id,new AIsland((i+.5)*204.8,(i+1)%2*110+180,is_default));
				}else println("NO PLACE TO ADD A NEW HOUSE");
			}

			// i=map_right_island.size();
			// if(i<MISLAND) map_right_island.put(user_id,new AIsland((i+.5)*204.8,(i+1)%2*110+180,is_default));
			// else println("NO PLACE TO ADD A NEW HOUSE");
		}
	}
	void setHouseName(AIsland iland,String set_name,int ipeople){
		if(iland==null){
			println("Illegal House!!");
			return;
		}
		// drawIlandText(set_name);
		iland.setName(set_name,ipeople);
	}
	void setHousePart(AIsland iland,int b1,int p1,int p2,int p3,int p4){
		if(iland==null){
			println("Illegal House!!");
			return;
		}
		iland.setBuilding(b1,p1,p2,p3,p4);
	}
	void setHouseTrigger(AIsland iland,int type_trig){
		if(iland==null){
			println("Illegal House!!");
			return;
		}
		iland.triggerMove(type_trig);
	}


	PImage[] getBuildPartImage(ABuildPart[] arr_part){
		int mpart=arr_part.length;
		
		PImage[] img_part=new PImage[mpart+1];
		
		img_part[0]=img_island;
		
		for(int i=0;i<mpart;++i){
			img_part[i+1]=getBuildPart(arr_part[i]);
		}
		
		return img_part;
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
			println(e.toString());
			println("build part: "+build_part.ibuild+" - "+build_part.icat+" - "+build_part.ipart);
			return null;
		}

		if(img==null){
			println("cannot get: build part: "+build_part.ibuild+" - "+build_part.icat+" - "+build_part.ipart+" - "+build_part.getCurFrame());
			println("file: "+getBuildPartFileName(build_part.ibuild,build_part.icat,build_part.ipart,build_part.getCurFrame()));
		} 

		return img;
	}

	void drawScoreNumber(PGraphics pg,int nscore,int color_type){

		pg.pushStyle();
		pg.noStroke();
		pg.textureMode(IMAGE);

		pg.pushMatrix();
		if(color_type==0) pg.translate(266,27);
		else pg.translate(1524,27);

		String score_str=nf(nscore,4);
		// println(score_str+":");
		float nwid=85;
		for(int i=0;i<4;++i){
			pg.pushMatrix();
			pg.translate(i*nwid,0);
			
			int snum=(int)(score_str.charAt(i))-48;
			if(color_type==0) pg.image(arr_img_blue_num[snum],0,0);
			else pg.image(arr_img_red_num[snum],0,0);
			
			pg.popMatrix();
		}

		pg.popMatrix();

		pg.popStyle();
	}

	void triggerBuilding(){
		for(AIsland iland:map_left_island.values()){
			switch(iland.istage){
				case NONE:
					String set_name="";
					int len=(int)random(3,8);
					for(int i=0;i<len;++i) set_name+=char(97+i);
					iland.setName(set_name,(int)random(5));
					break;
				case MAN:
					iland.setBuilding((int)random(5),(int)random(4),(int)random(4),(int)random(4),(int)random(4));
					iland.setBuildingImage(getBuildPartImage(iland.arr_build_part));
					break;
				case HOUSE:							
					if(random(5)<1) iland.init(iland._pos.x,iland._pos.y);
					else{
						iland.triggerMove(0);
						iland.triggerMove(1);	
					}
					break;
						
			}

		} 
		for(AIsland iland:map_right_island.values()){
			switch(iland.istage){
				case NONE:
					String set_name="";
					int len=(int)random(3,8);
					for(int i=0;i<len;++i) set_name+=char(97+(int)random(26));
					iland.setName(set_name,(int)random(5));
					break;
				case MAN:
					iland.setBuilding((int)random(5),(int)random(4),(int)random(4),(int)random(4),(int)random(4));
					iland.setBuildingImage(getBuildPartImage(iland.arr_build_part));
					break;
				case HOUSE:							
						
					if(random(5)<1) iland.init(iland._pos.x,iland._pos.y);
					else{
						iland.triggerMove(0);
						iland.triggerMove(1);
					}
					break;
						
			}

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
}

