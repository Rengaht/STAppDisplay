import org.apache.commons.codec.binary.Base64;
import java.io.File;
import java.nio.file.Files;
import java.io.FileOutputStream;
import java.util.Comparator;


PImage[] arr_img_door;
BuildBlock[] arr_bridge_block;

PImage img_giraffe;
	
class CGameScene extends GameScene{

	final String DataFolder="GAME_C/";
	final int MPEOPLE=20;
	final int IPEOPLE=12;
	final int MDEFAULT_FACE=10;
	final int NUM_9_FRAMECOUNT=51;
	final int NUM_6_FRAMECOUNT=35;
	final int NUM_FRAME_INTERVAL=5;

	// ArrayList<FaceAvatar> arr_avatar_left;
	// ArrayList<FaceAvatar> arr_avatar_right;
	ArrayList<FaceAvatar> arr_avatar;//_center;
	
	Movie[] back_movie;
	PImage[] arr_front_building;
	// BuildBlock[] arr_left_build,arr_right_build,arr_center_build;
	BuildBlock[] arr_build;

	//ImageSeq[] people_movie=new ImageSeq[12];
	ArrayList<ArrayList<PImage>> people_movie;
	

	ArrayList<PImage> default_face;
	ArrayList<PImage> speak_bubble;

	int oldest_index_left=0;
	int oldest_index_right=0;

	int oldest_index=0;


	// clock
	boolean clock_mode=false;
	
	Movie[] arr_clock_movie;
	// AlphaMovie num_movie_6,num_movie_9;
	// PImage point_1,point_2;
	// PImage[] arr_num_img_9;	
	// PImage[] arr_num_img_6;
	ArrayList<ArrayList<PImage>> arr_number_img;
	int isecond;
	// ClockNumber[] arr_clock_number;
	ClockAvatarNumber[] arr_clock_number;
	float clock_base_y=70;
	float clock_base_x=95;
	float clock_margin_x=190;
	ArrayList<ArrayList<PImage>> clock_people_movie;


	@Override
	void loadFiles(){
		if(gapplet==null) return;

		back_movie=new Movie[3];
		back_movie[0]=new Movie(gapplet,DataFolder+"BACK/LEFT_FINAL.mov");
		back_movie[1]=new Movie(gapplet,DataFolder+"BACK/MIDDLE_FINAL.mov");
		back_movie[2]=new Movie(gapplet,DataFolder+"BACK/RIGHT_FINAL.mov");

		arr_front_building=new PImage[4];
		arr_front_building[0]=loadImage(DataFolder+"BACK/LEFT_BUILD_1.png");
		arr_front_building[1]=loadImage(DataFolder+"BACK/LEFT_BUILD_2.png");
		arr_front_building[2]=loadImage(DataFolder+"BACK/RIGHT_BUILD_1.png");
		arr_front_building[3]=loadImage(DataFolder+"BACK/RIGHT_BUILD_2.png");

	

		
		arr_build=new BuildBlock[5];
		arr_build[0]=new BuildBlock(0,275,200,125,true);
		arr_build[1]=new BuildBlock(440,350,205,50,true);
		
		arr_build[2]=new BuildBlock(3056+0,248,180,45,true);
		arr_build[3]=new BuildBlock(3056+584,345,234,55,true);

		arr_build[4]=new BuildBlock(1024,176,2032,240,true);
		
	
		arr_bridge_block=new BuildBlock[2];
		arr_bridge_block[0]=new BuildBlock(1024,50,50,50);
		arr_bridge_block[1]=new BuildBlock(3056,0,50,50);


		people_movie=new ArrayList<ArrayList<PImage>>();
		clock_people_movie=new ArrayList<ArrayList<PImage>>();

		for(int i=1;i<13;++i){
			people_movie.add(new ArrayList<PImage>());
			clock_people_movie.add(new ArrayList<PImage>());
			int m=clock_people_movie.size()-1;

			String file_name="";
			if(i<11) file_name=getRepeatText("P",i);
			else if(i==11) file_name="GOD";
			else if(i==12) file_name="CAT";
			// else if(i==13) file_name="F";

			//people_movie[i]=new ImageSeq(DataFolder+"PEOPLE/P"+nf(i,3)+"/"+file_name,6);
			int frame_count=6;
			for(int j=0;j<frame_count;++j){
				String fname=DataFolder+"PEOPLE/P"+nf(i,3)+"/"+file_name+"_"+nf(j,5)+".png";
				println(fname);
				PImage load_image=loadImage(fname);
				(people_movie.get(m)).add(load_image);

				String fname2=DataFolder+"PEOPLE02/P"+nf(i,3)+"/PERSON_"+nf(i,3)+"_"+nf(j,5)+".png";
				println(fname2);
				PImage load_image2=loadImage(fname2);
				(clock_people_movie.get(m)).add(load_image2);

			}
		}

		default_face=new ArrayList<PImage>();
		for(int i=1;i<=MDEFAULT_FACE;++i){
			String fname=DataFolder+"Face/FACE"+nf(i,3)+".png";
			println(fname);
			PImage load_image=loadImage(fname);
			default_face.add(load_image);
		}			

		speak_bubble=new ArrayList<PImage>();
		for(int i=0;i<10;++i){
			String fname=DataFolder+"ICON/P"+nf(i+1,3)+".png";
			println(fname);
			PImage load_image=loadImage(fname);
			speak_bubble.add(load_image);

			String fname2=DataFolder+"ICON/P"+nf(i+1,3)+"_2.png";
			println(fname2);
			PImage load_image2=loadImage(fname2);
			speak_bubble.add(load_image2);
		}

		arr_clock_movie=new Movie[3];
		arr_clock_movie[0]=new Movie(gapplet,DataFolder+"CLOCK_BACK/LEFT_FINAL.mov");
		arr_clock_movie[1]=new Movie(gapplet,DataFolder+"CLOCK_BACK/RIGHT_FINAL.mov");
		arr_clock_movie[2]=new Movie(gapplet,DataFolder+"CLOCK_BACK/MIDDLE_FINAL.mov");
		
		// num_movie_6=new AlphaMovie(gapplet,DataFolder+"CLOCK/NUMBER0_6.mov");
		// num_movie_9=new AlphaMovie(gapplet,DataFolder+"CLOCK/NUMBER0_9.mov");
		// point_1=loadImage(DataFolder+"CLOCK/POINT_1.png");
		// point_2=loadImage(DataFolder+"CLOCK/POINT_2.png");

		// arr_num_img_9=new PImage[NUM_9_FRAMECOUNT];
		// for(int i=0;i<NUM_9_FRAMECOUNT;++i) arr_num_img_9[i]=loadImage(DataFolder+"CLOCK/NUMBER0_9/NUMBER0_9"+nf(i,2)+".png");
		// arr_num_img_6=new PImage[NUM_6_FRAMECOUNT];
		// for(int i=0;i<NUM_6_FRAMECOUNT;++i) arr_num_img_6[i]=loadImage(DataFolder+"CLOCK/NUMBER0_6/NUMBER0_6"+nf(i,2)+".png");


		arr_number_img=new ArrayList<ArrayList<PImage>>();
		for(int i=0;i<10;++i){
			ArrayList<PImage> arr_num=new ArrayList<PImage>();
			for(int x=0;x<30;++x){
				PImage timg=loadImage(DataFolder+"CLOCK/num_"+i+"/num_"+nf(i,0)+nf(x,5)+".png");
				arr_num.add(timg);
			}
			arr_number_img.add(arr_num);
		}
		ArrayList<PImage> arr_colon=new ArrayList<PImage>();
		for(int x=0;x<6;++x){
			PImage timg=loadImage(DataFolder+"CLOCK/num_colon/num_colon_"+nf(x,5)+".png");
			arr_colon.add(timg);
		}
		arr_number_img.add(arr_colon);

		ArrayList<PImage> arr_slash=new ArrayList<PImage>();
		for(int x=0;x<6;++x){
			PImage timg=loadImage(DataFolder+"CLOCK/num_slash/num_slash_"+nf(x,5)+".png");
			arr_slash.add(timg);
		}
		arr_number_img.add(arr_slash);



		// arr_clock_number=new ClockNumber[10];
		// for(int i=0;i<10;++i){
		// 	// if(i!=6) arr_clock_number[i]=new ClockNumber(0,NUM_9_FRAMECOUNT,0);
		// 	// else arr_clock_number[i]=new ClockNumber(0,NUM_6_FRAMECOUNT,1);

		// 	if(i==2) arr_clock_number[i]=new ClockNumber(11,6,0);
		//  	else if(i==7) arr_clock_number[i]=new ClockNumber(10,6,0);
		//  	else arr_clock_number[i]=new ClockNumber(0,30,0);
		// }

		arr_clock_number=new ClockAvatarNumber[10];
		for(int i=0;i<10;++i){
			
			if(i==2) arr_clock_number[i]=new ClockAvatarNumber(11);
		 	else if(i==7) arr_clock_number[i]=new ClockAvatarNumber(10);
		 	else arr_clock_number[i]=new ClockAvatarNumber(0);
		}
		


		arr_img_door=new PImage[24];
		for(int i=0;i<24;++i){
			arr_img_door[i]=loadImage(DataFolder+"door/door_1"+nf(i,2)+".png");
		}
		
		img_giraffe=loadImage(DataFolder+"giraffe.png");

		img_qrcode_title=loadImage("APP_TITLE_03.png");

	}
	String getRepeatText(String rtext,int num){
		String result="";
		for(int i=0;i<num;++i) result+=rtext;
		return result;
	}

	@Override
	void Init(){
		super.Init();

		if(clock_mode){
			initClockMode();
			return;
		}

		
		// arr_avatar_left=new ArrayList<FaceAvatar>();
		// arr_avatar_right=new ArrayList<FaceAvatar>();

		arr_avatar=new ArrayList<FaceAvatar>();

		// for(int i=0;i<MPEOPLE/2;++i){
		// 	arr_avatar_left.add(new FaceAvatar((int)random(12)));	
		// 	arr_avatar_right.add(new FaceAvatar((int)random(12)));	
		// } 
		// for(FaceAvatar face:arr_avatar_left) face.play();
		// for(FaceAvatar face:arr_avatar_right) face.play();

		for(int i=0;i<3;++i) back_movie[i].play();

		oldest_index=0;
		for(int i=0;i<MPEOPLE;++i){
			// addNewFace("",default_face.get((int)random(MDEFAULT_FACE)),(int)random(12),true);
			// addNewFace("",default_face.get((int)random(MDEFAULT_FACE)),(int)random(12),false);
			addNewFace("",default_face.get((int)random(MDEFAULT_FACE)),(int)random(12));
		}
		println(arr_avatar.size());

		// for(FaceAvatar face:arr_avatar_left){
		// 	face.mmotion.istage=AvatarAction.WALK;
		// 	//face.mmotion.mscale=1;	
		// } 
		// for(FaceAvatar face:arr_avatar_right){
		// 	face.mmotion.istage=AvatarAction.WALK;
		// 	//face.mmotion.mscale=1;	
		// } 
		for(FaceAvatar face:arr_avatar) face.mmotion.istage=AvatarAction.WALK;

	}

	@Override
	void Update(){

		if(clock_mode){
			for(int i=0;i<3;++i) arr_clock_movie[i].read();
			for(int i=0;i<10;++i) arr_clock_number[i].update();

			String nmonth=nf(month(),2);
			String nday=nf(day(),2);
			for(int i=0;i<2;++i){
				int inum=Integer.valueOf(nmonth.charAt(i))-48;
				updateClockNumber(arr_clock_number[i],inum);
			}
			
			for(int i=0;i<2;++i){
				int inum=Integer.valueOf(nday.charAt(i))-48;
				updateClockNumber(arr_clock_number[3+i],inum);
			}


			String nhour=nf(hour(),2);
			String nminute=nf(minute(),2);
			for(int i=0;i<2;++i){
				int inum=Integer.valueOf(nhour.charAt(i))-48;
				updateClockNumber(arr_clock_number[5+i],inum);
			}
			
			for(int i=0;i<2;++i){
				int inum=Integer.valueOf(nminute.charAt(i))-48;
				updateClockNumber(arr_clock_number[8+i],inum);
			}

			/* go out every 10 sec*/
			if(second()%10==9){
				for(ClockAvatarNumber num:arr_clock_number) num.start();
			}

			return;
		}



		// if(arr_avatar_right.size()<MPEOPLE/2 || arr_avatar_left.size()<MPEOPLE/2){
		// 	if(random(150)<1)
		// 		addNewFace("",default_face.get((int)random(MDEFAULT_FACE)),(int)random(12));
		// }
		boolean one_end=false;
		for(int i=0;i<3;++i){
			back_movie[i].read();
			if(back_movie[i].time()==back_movie[i].duration()){
				one_end=true; break;
			}
		}
		if(one_end){
			for(int i=0;i<3;++i) back_movie[i].jump(0);	
		}
		

		// println(back_movie[0].time()+" "+back_movie[1].time()+" "+back_movie[2].time());
		// for(FaceAvatar face:arr_avatar_left){
		// 	face.update(arr_avatar_left,arr_left_build);	
		// }


		// Iterator<FaceAvatar> iter=arr_avatar_left.iterator();
		// while(iter.hasNext()){
		// 	FaceAvatar face=iter.next();
		// 	if(face.isDead()) iter.remove();
		// }

		// Collections.sort(arr_avatar_left,new Comparator<FaceAvatar>(){
  //           public int compare(FaceAvatar o1, FaceAvatar o2){
  //               return o1.getDepth().compareTo(o2.getDepth());
  //           }
  //       });

		// for(FaceAvatar face:arr_avatar_right){
		// 	face.update(arr_avatar_right,arr_right_build);	
		// }
		// Iterator<FaceAvatar> iter2=arr_avatar_right.iterator();
		// while(iter2.hasNext()){
		// 	FaceAvatar face=iter2.next();
		// 	if(face.isDead()) iter2.remove();
		// }
		
		// Collections.sort(arr_avatar_right,new Comparator<FaceAvatar>(){
  //           public int compare(FaceAvatar o1, FaceAvatar o2){
  //               return o1.getDepth().compareTo(o2.getDepth());
  //           }
  //       });


        for(FaceAvatar face:arr_avatar){
			//if(arr_build!=null) 
			face.update(arr_avatar,arr_build);	
			
		}
		// adjust Avatar
		if(frameCount%200==0) adjustAvatar();

		if(arr_avatar.size()>MPEOPLE){
			for(FaceAvatar face:arr_avatar){
				if(face.sarr_index<oldest_index-MPEOPLE){
					if(!face.isGoingOut()) face.goOut();
				}
			}
		}

		Iterator<FaceAvatar> iter=arr_avatar.iterator();
		while(iter.hasNext()){
			FaceAvatar face=iter.next();
			if(face.isDead()) iter.remove();
		}

		Collections.sort(arr_avatar,new Comparator<FaceAvatar>(){
            public int compare(FaceAvatar o1, FaceAvatar o2){
                return o1.getDepth().compareTo(o2.getDepth());
            }
        });


        // ani_giraffe.Update();
        // if(!ani_giraffe.ani_start){
        // 	if(random(650)<1) ani_giraffe.Restart();		
        // } 
	}
	

	@Override
	void DrawLeftScreen(PGraphics sub_pg){

		if(clock_mode){
			sub_pg.image(arr_clock_movie[0],0,0);

			
			// sub_pg.pushStyle();
			// sub_pg.imageMode(CENTER);

			// float base_y=200;
			// float base_x=37+95;
			// float margin_x=190;

			// String nmonth=nf(month(),2);
			// String nday=nf(day(),2);
			

			// for(int i=0;i<2;++i){
			// 	int inum=Integer.valueOf(nmonth.charAt(i))-48;
			// 	arr_clock_number[i].updateNum(inum);
			// 	int cur_fr=arr_clock_number[i].getCurFrame();
				
			// 	sub_pg.image(arr_number_img.get(arr_clock_number[i].getCurNum()).get(cur_fr),base_x+margin_x*i,base_y);
			// }
			
			// sub_pg.image(arr_number_img.get(11).get(arr_clock_number[2].getCurFrame()),base_x+margin_x*2,base_y);

			// for(int i=0;i<2;++i){
			// 	int inum=Integer.valueOf(nday.charAt(i))-48;
			// 	arr_clock_number[3+i].updateNum(inum);
			// 	int cur_fr=arr_clock_number[3+i].getCurFrame();
				
			// 	sub_pg.image(arr_number_img.get(arr_clock_number[3+i].getCurNum()).get(cur_fr),base_x+45+margin_x*(2.6+i),base_y);
			// }
			
			// sub_pg.popStyle();

		

		

			for(int i=0;i<2;++i){

				sub_pg.pushMatrix();
				sub_pg.translate(clock_base_x+clock_margin_x*i,clock_base_y);
					drawClockNumber(sub_pg,arr_clock_number[i]);				
				sub_pg.popMatrix();
			}
			
			sub_pg.pushMatrix();
			sub_pg.translate(clock_base_x+clock_margin_x*2,clock_base_y);
					drawClockNumber(sub_pg,arr_clock_number[2]);				
			sub_pg.popMatrix();
			
			for(int i=0;i<2;++i){

				sub_pg.pushMatrix();
				sub_pg.translate(clock_base_x+45+clock_margin_x*(2.6+i),clock_base_y);
					drawClockNumber(sub_pg,arr_clock_number[3+i]);				
				sub_pg.popMatrix();
			}

			return;
		}




		//drawSquaresBack(sub_pg);
		sub_pg.image(back_movie[0],0,0);
		// for(FaceAvatar face:arr_avatar_left){
		// 	if(face.getDepth()+AVATAR_SIZE.y/2<356)
		// 		face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		// } 


		


		for(FaceAvatar face:arr_avatar){
			if(face.getPosX()-AVATAR_SIZE.x/2>Left_Screen_X) continue;
			if(face.getDepth()+AVATAR_SIZE.y/2<356)
				face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		} 
		sub_pg.image(arr_front_building[0],0,0);

		// for(FaceAvatar face:arr_avatar_left){
		// 	if(face.getDepth()+AVATAR_SIZE.y/2>=356)
		// 		face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		// } 

		for(FaceAvatar face:arr_avatar){
			if(face.getPosX()-AVATAR_SIZE.x/2>Left_Screen_X) continue;
			if(face.getDepth()+AVATAR_SIZE.y/2>=356)
				face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		} 
		sub_pg.image(arr_front_building[1],0,0);


		if(DRAW_DEBUG){
			if(arr_build==null) return;
			for(BuildBlock bb:arr_build)
				if(bb.pos.x<Left_Screen_X) bb.draw(sub_pg);	
		} 
	}

	@Override
	void DrawRightScreen(PGraphics sub_pg){
		
		if(clock_mode){
			sub_pg.image(arr_clock_movie[1],0,0);


			// sub_pg.pushStyle();
			// sub_pg.imageMode(CENTER);

			// 	int inum=Integer.valueOf(nhour.charAt(i))-48;
			// 	arr_clock_number[4+i].updateNum(inum);
			// 	int cur_fr=arr_clock_number[4+i].getCurFrame();
				
			// 	sub_pg.image(arr_num_img_9[cur_fr],base_x+margin_x*i,base_y);
			// }
			
			// int t=millis();
			// if(t-isecond<500) sub_pg.image(point_2,base_x+margin_x*2,135+base_y);
			// if(t-isecond>=1000){
			// 	isecond=t;
			// 	//println(isecond);
			// }

			// for(int i=0;i<2;++i){
			// 	int inum=Integer.valueOf(nminute.charAt(i))-48;
			// 	arr_clock_number[6+i].updateNum(inum);
			// 	int cur_fr=arr_clock_number[6+i].getCurFrame();
				
			// 	if(i==0) sub_pg.image(arr_num_img_6[cur_fr],base_x+46+margin_x*(2+i),base_y);
			// 	else sub_pg.image(arr_num_img_9[cur_fr],base_x+46+margin_x*(2+i),base_y);
			// }
			
			// for(int i=0;i<2;++i){
			// 	int inum=Integer.valueOf(nhour.charAt(i))-48;
			// 	arr_clock_number[5+i].updateNum(inum);
			// 	int cur_fr=arr_clock_number[5+i].getCurFrame();
				
			// 	sub_pg.image(arr_number_img.get(arr_clock_number[5+i].getCurNum()).get(cur_fr),base_x+margin_x*i,base_y);
			// }
			
			// sub_pg.image(arr_number_img.get(10).get(arr_clock_number[7].getCurFrame()),base_x+margin_x*1.9,base_y);

			// for(int i=0;i<2;++i){
			// 	int inum=Integer.valueOf(nminute.charAt(i))-48;
			// 	boolean changed=arr_clock_number[8+i].updateNum(inum);
			// 	if(changed){
			// 		for(int x=0;x<10;++x) arr_clock_number[x].updateNum();
			// 	}
			
			// 	int cur_fr=arr_clock_number[8+i].getCurFrame();
				
			// 	sub_pg.image(arr_number_img.get(arr_clock_number[8+i].getCurNum()).get(cur_fr),base_x+margin_x*(2.7+i),base_y);
			// }

			// sub_pg.popStyle();

			// return;
			for(int i=0;i<2;++i){
		
				sub_pg.pushMatrix();
				sub_pg.translate(clock_base_x+clock_margin_x*i,clock_base_y);
					drawClockNumber(sub_pg,arr_clock_number[5+i]);				
				sub_pg.popMatrix();
			}
			
			sub_pg.pushMatrix();
			sub_pg.translate(clock_base_x+clock_margin_x*2,clock_base_y);
					drawClockNumber(sub_pg,arr_clock_number[7]);				
			sub_pg.popMatrix();
			
			for(int i=0;i<2;++i){
				
				sub_pg.pushMatrix();
				sub_pg.translate(clock_base_x+45+clock_margin_x*(2.6+i),clock_base_y);
					drawClockNumber(sub_pg,arr_clock_number[8+i]);				
				sub_pg.popMatrix();
			}
			return;

		}		//drawSquaresBack(sub_pg);
		sub_pg.image(back_movie[2],0,0);

		// for(FaceAvatar face:arr_avatar_right){
		// 	if(face.getDepth()+AVATAR_SIZE.y/2<285)
		// 		face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		// } 
		sub_pg.pushMatrix();
		sub_pg.translate(-Right_Screen_X,0);
		for(FaceAvatar face:arr_avatar){
			if(face.getPosX()+AVATAR_SIZE.x/2<Right_Screen_X) continue;
			if(face.getDepth()+AVATAR_SIZE.y/2<285)
				face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		} 
		sub_pg.popMatrix();

		sub_pg.image(arr_front_building[2],0,0);
		// for(FaceAvatar face:arr_avatar_right){
		// 	if(face.getDepth()+AVATAR_SIZE.y/2>=285)
		// 		face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		// } 
		sub_pg.pushMatrix();
		sub_pg.translate(-Right_Screen_X,0);
		for(FaceAvatar face:arr_avatar){
			if(face.getPosX()+AVATAR_SIZE.x/2<Right_Screen_X) continue;
			if(face.getDepth()+AVATAR_SIZE.y/2>=285)
				face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		} 

		if(DRAW_DEBUG){
			if(arr_build!=null)
			for(BuildBlock bb:arr_build)
				if(bb.pos.x>=Right_Screen_X) bb.draw(sub_pg);	
		} 
		sub_pg.popMatrix();

		sub_pg.image(arr_front_building[3],0,0);

	}

	@Override
	void DrawCenterScreen(PGraphics sub_pg){

		if(clock_mode){
			sub_pg.image(arr_clock_movie[2],0,0);
			return;
		}

		sub_pg.image(back_movie[1],0,0);

		sub_pg.pushMatrix();
		sub_pg.translate(-Left_Screen_X,0);
		for(FaceAvatar face:arr_avatar){
			if(face.getPosX()-AVATAR_SIZE.x/2>Right_Screen_X || face.getPosX()+AVATAR_SIZE.x/2<Left_Screen_X) continue;
			
			face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		} 

		if(DRAW_DEBUG){
			if(arr_build!=null)
			for(BuildBlock bb:arr_build)
				if(bb.pos.x<Right_Screen_X && bb.pos.x>=Left_Screen_X) bb.draw(sub_pg);	
		} 

		sub_pg.popMatrix();


		//drawSquaresBack(sub_pg);
		

		
	}




	@Override
	void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){
		
		println("GameC Got Event: "+event_code.toString());
		switch(event_code){
			case Server_Set_Face:
				show_qrcode=false;
				setFace(params);
				// if(game_state==GameState.Wait) game_state=GameState.PLAY;
				break;
			case Server_LGG:
				println("------The End------");
				break;
			default :
				println("illegal event: "+event_code.toString());
				break;	
		}



	}
	@Override
	int[] GetScores(){
		return new int[]{200,300};
	}


	void drawSquaresBack(PGraphics pg){
		int noise_scale=240;
		pg.noStroke();
		PVector color_separate=new PVector(1,1,0.1);
		
		for(int x=0;x<=pg.width;x+=noise_scale)
			for(int y=0;y<=pg.height;y+=noise_scale){
	    		float val=noise(x+random(-1,1),y+random(-1,1));
	    		pg.fill(val*255*color_separate.x,val*255*color_separate.y,val*20*color_separate.z);
	    		pg.rectMode(CENTER);
	    		pg.rect(x,y,noise_scale,noise_scale);
	  		}

	}
	void setFace(TypedHashMap<Byte,Object> params){

		println("GameC: set face");
		if(!wait_mode) wait_mode=true;

		String user_id=(String)params.get((byte)100);
		String name=(String)params.get((byte)1);
		String encoded_image=(String)params.get((byte)2);
		//String file_path=(String)params.get((byte)2);
		int iavatar=(Integer)params.get((byte)3);
		

		final Base64 base64=new Base64();
		byte[] image_bytes=base64.decode(encoded_image);
		String file_name="F://kerker_face/user_"+user_id+".png";
		saveImage(file_name,image_bytes);

		//PImage img=loadImage(file_path);
		PImage img=loadImage(file_name);

		addNewFace(name,img,iavatar);
		
	}
	private void addNewFace(String name,PImage img,int ichar){

		 // boolean add_left=random(2)<1;
		 // addNewFace(name,img,ichar,add_left);	

	 	int cur_size=arr_avatar.size();
		arr_avatar.add(cur_size,new FaceAvatar(name,img,ichar,oldest_index,arr_build));
		oldest_index++;
		cur_size++;	
		//println("add to "+cur_size);

		
	}
	private void adjustAvatar(){
		ArrayList<FaceAvatar> arr_left=new ArrayList<FaceAvatar>();
		ArrayList<FaceAvatar> arr_right=new ArrayList<FaceAvatar>();
		int on_bridge=0;
		for(FaceAvatar face:arr_avatar){
			if(face.mmotion.istage==AvatarAction.BRIDGE){
				on_bridge++;
				continue;	
			} 
			if(face.mmotion.istage!=AvatarAction.WALK) continue;

			if(face.getPosX()<Left_Screen_X) arr_left.add(face);
			else if(face.getPosX()>Right_Screen_X) arr_right.add(face);
		
		}
		
		if(on_bridge>MPEOPLE/3) return;

		boolean unbalanced=false;
		if(arr_right.size()>arr_left.size()+3){
			unbalanced=true;
			int m=(int)random(arr_right.size());
			arr_right.get(m).mmotion.goBridge();
		}
		if(arr_left.size()>arr_right.size()+3){
			unbalanced=true;
			int m=(int)random(arr_left.size());
			arr_left.get(m).mmotion.goBridge();
		}
		// if(!unbalanced && random(20)<1){
		// 	int mright=(int)random(arr_right.size());
		// 	arr_right.get(mright).mmotion.goBridge();

		// 	int mleft=(int)random(arr_left.size());
		// 	arr_left.get(mleft).mmotion.goBridge();
		// }

	}

	// private void addNewFace(String name,PImage img,int ichar,boolean add_left){

	// 	if(add_left){
	// 		int cur_size=arr_avatar_left.size();
	// 		arr_avatar_left.add(cur_size,new FaceAvatar(name,img,ichar,oldest_index_left,arr_left_build));
	// 		oldest_index_left++;
	// 		cur_size++;	
	// 		//println("add to "+cur_size);

	// 		if(cur_size>MPEOPLE/2){
	// 			for(FaceAvatar face:arr_avatar_left){
	// 				if(face.sarr_index<oldest_index_left-MPEOPLE/2){
	// 					if(!face.isGoingOut()) face.goOut();
	// 				}
	// 			}
	// 		}
	// 	}else{
	// 		int cur_size=arr_avatar_right.size();
	// 		arr_avatar_right.add(cur_size,new FaceAvatar(name,img,ichar,oldest_index_right,arr_right_build));	
	// 		oldest_index_right++;
	// 		cur_size++;
	// 		if(cur_size>MPEOPLE/2){
	// 			for(FaceAvatar face:arr_avatar_right){
	// 				if(face.sarr_index<oldest_index_right-MPEOPLE/2){
	// 					if(!face.isGoingOut()) face.goOut();
	// 				}
	// 			}
	// 		}
	// 	} 

	// }

	private void saveImage(String image_file_path,byte[] image_byte_array){

		try{

	    	File file=new File(image_file_path);
	    	FileOutputStream fos=new FileOutputStream(file);
	        
	    	System.out.println("save image "+file.getPath());

	        fos.write(image_byte_array,0,image_byte_array.length);
	        fos.flush();
	        fos.close();

    	}catch(Exception e){
    		System.out.println("Save Image Error!\n"+e);
    	}
	
	}
    void toggleClockMode(){
    	clock_mode=!clock_mode;
    	if(clock_mode){
    		show_qrcode=false;	
    		initClockMode();
    	}else{
    		show_qrcode=true;	
    		for(ClockAvatarNumber num:arr_clock_number){
				num.pause();
			}
    	}

    }
	void initClockMode(){
		
		clock_mode=true;

		for(int i=0;i<3;++i) arr_clock_movie[i].loop();

		isecond=millis();

		String nmonth=nf(month(),2);
		String nday=nf(day(),2);
		String nhour=nf(hour(),2);
		String nminute=nf(minute(),2);

		// float cmillisecond=(Calendar.getInstance().get(Calendar.MILLISECOND))%1000;
		// int csecond=second()%30;
		int cur_frame=0;
		// if(csecond<1){
		// 	cur_frame=(int)(cmillisecond/1000*12);
		// }else if(csecond<29){
		// 	cur_frame=(int)(12+cmillisecond/500*6);
		// }else{
		// 	cur_frame=(int)(18+cmillisecond/1000*12);
		// }
		
		// arr_clock_number[0].Reset(Integer.valueOf(nmonth.charAt(0))-48,cur_frame);
		// arr_clock_number[1].Reset(Integer.valueOf(nmonth.charAt(1))-48,cur_frame);
		// arr_clock_number[2].Reset(10,cur_frame);
		// arr_clock_number[3].Reset(Integer.valueOf(nday.charAt(0))-48,cur_frame);
		// arr_clock_number[4].Reset(Integer.valueOf(nday.charAt(1))-48,cur_frame);		
		
		// arr_clock_number[5].Reset(Integer.valueOf(nhour.charAt(0))-48,cur_frame);
		// arr_clock_number[6].Reset(Integer.valueOf(nhour.charAt(1))-48,cur_frame);
		// arr_clock_number[7].Reset(11,cur_frame);
		// arr_clock_number[8].Reset(Integer.valueOf(nminute.charAt(0))-48,cur_frame);
		// arr_clock_number[9].Reset(Integer.valueOf(nminute.charAt(1))-48,cur_frame);
		
		arr_clock_number[0].updateNum(Integer.valueOf(nmonth.charAt(0))-48);
		arr_clock_number[1].updateNum(Integer.valueOf(nmonth.charAt(1))-48);
		arr_clock_number[2].updateNum(10);
		arr_clock_number[3].updateNum(Integer.valueOf(nday.charAt(0))-48);
		arr_clock_number[4].updateNum(Integer.valueOf(nday.charAt(1))-48);		
		
		arr_clock_number[5].updateNum(Integer.valueOf(nhour.charAt(0))-48);
		arr_clock_number[6].updateNum(Integer.valueOf(nhour.charAt(1))-48);
		arr_clock_number[7].updateNum(11);
		arr_clock_number[8].updateNum(Integer.valueOf(nminute.charAt(0))-48);
		arr_clock_number[9].updateNum(Integer.valueOf(nminute.charAt(1))-48);

		int findex=0;
		for(ClockAvatarNumber num:arr_clock_number){
			findex=updateClockAvatar(num,findex);
			num.start();
		}

	}

	private void drawClockNumber(PGraphics pg,ClockAvatarNumber clock_num){
		
		int _mavatar=clock_num.getAvatarSize();
		int cur_frame=clock_num.getCurFrame();
		float ani_pos=clock_num.getAniPortion();
		float ani_change=clock_num.getChangePortion();

		for(int i=0;i<_mavatar;++i){
			ClockAvatar _avatar=clock_num.getAvatar(i);
			PImage img_body=clock_people_movie.get(_avatar.icharacter).get(cur_frame);
			if(img_body==null) println("image null: "+_avatar.icharacter+"-"+cur_frame);
			_avatar.draw(pg,img_body,ani_pos,ani_change);
			// _avatar.draw(pg,people_movie.get(_avatar.icharacter).get(_avatar.getCurFrame()));
		}
	}
	private void updateClockNumber(ClockAvatarNumber clock_num,int set_num){
		if(clock_num.updateNum(set_num)){
			updateClockAvatar(clock_num,0);
		}
	}
	private int updateClockAvatar(ClockAvatarNumber clock_num,int from_findex){
		
		int total=arr_avatar.size();
		
		int _mavatar=clock_num.getPosSize();
		int _msrc=clock_num.getAvatarSize();
		println("Update Clock: "+_msrc+" -> "+_mavatar);

		if(_msrc>_mavatar){
			for(int i=_msrc-1;i>=_mavatar;--i) clock_num.removeAvatar(i);
		}

		for(int i=0;i<_mavatar;++i){
			if(i<_msrc){
				clock_num.updateAvatar(i);
			}else{
				FaceAvatar face=arr_avatar.get((from_findex+i)%total);
				clock_num.addAvatar(i,face.icharacter,face.face_image);
			}
		}
		clock_num.startChange();

		return from_findex+_mavatar-1;
	}

}