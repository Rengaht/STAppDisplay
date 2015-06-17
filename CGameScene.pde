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
	final int MDEFAULT_FACE=11;
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
	AlphaMovie num_movie_6,num_movie_9;
	PImage point_1,point_2;
	PImage[] arr_num_img_9;	
	PImage[] arr_num_img_6;
	int isecond;
	ClockNumber[] arr_clock_number;

	

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

		for(int i=1;i<=13;++i){
			people_movie.add(new ArrayList<PImage>());
			String file_name="";
			if(i<11) file_name=getRepeatText("P",i);
			else if(i==11) file_name="GOD";
			else if(i==12) file_name="CAT";
			else if(i==13) file_name="F";

			//people_movie[i]=new ImageSeq(DataFolder+"PEOPLE/P"+nf(i,3)+"/"+file_name,6);
			int frame_count=6;
			for(int j=0;j<frame_count;++j){
				String fname=DataFolder+"PEOPLE/P"+nf(i,3)+"/"+file_name+"_"+nf(j,5)+".png";
				println(fname);
				PImage load_image=loadImage(fname);
				(people_movie.get(i-1)).add(load_image);
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
			String fname=DataFolder+"ICON/P"+nf(i,3)+".png";
			println(fname);
			PImage load_image=loadImage(fname);
			speak_bubble.add(load_image);
		}

		arr_clock_movie=new Movie[3];
		arr_clock_movie[0]=new Movie(gapplet,DataFolder+"CLOCK_BACK/LEFT_FINAL.mov");
		arr_clock_movie[1]=new Movie(gapplet,DataFolder+"CLOCK_BACK/RIGHT_FINAL.mov");
		arr_clock_movie[2]=new Movie(gapplet,DataFolder+"CLOCK_BACK/MIDDLE_FINAL.mov");
		
		num_movie_6=new AlphaMovie(gapplet,DataFolder+"CLOCK/NUMBER0_6.mov");
		num_movie_9=new AlphaMovie(gapplet,DataFolder+"CLOCK/NUMBER0_9.mov");
		point_1=loadImage(DataFolder+"CLOCK/POINT_1.png");
		point_2=loadImage(DataFolder+"CLOCK/POINT_2.png");

		arr_num_img_9=new PImage[NUM_9_FRAMECOUNT];
		for(int i=0;i<NUM_9_FRAMECOUNT;++i) arr_num_img_9[i]=loadImage(DataFolder+"CLOCK/NUMBER0_9/NUMBER0_9"+nf(i,2)+".png");
		arr_num_img_6=new PImage[NUM_6_FRAMECOUNT];
		for(int i=0;i<NUM_6_FRAMECOUNT;++i) arr_num_img_6[i]=loadImage(DataFolder+"CLOCK/NUMBER0_6/NUMBER0_6"+nf(i,2)+".png");

		arr_clock_number=new ClockNumber[8];
		for(int i=0;i<8;++i){
			if(i!=6) arr_clock_number[i]=new ClockNumber(0,NUM_9_FRAMECOUNT,0);
			else arr_clock_number[i]=new ClockNumber(0,NUM_6_FRAMECOUNT,1);
		}


		arr_img_door=new PImage[24];
		for(int i=0;i<24;++i){
			arr_img_door[i]=loadImage(DataFolder+"door/door_1"+nf(i,2)+".png");
		}
		
		img_giraffe=loadImage(DataFolder+"giraffe.png");



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
			for(int i=0;i<8;++i) arr_clock_number[i].update();
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

			float base_y=25;
			float base_x=100;
			float margin_x=200;

			String nmonth=nf(month(),2);
			String nday=nf(day(),2);
			for(int i=0;i<2;++i){
				int inum=Integer.valueOf(nmonth.charAt(i))-48;
				arr_clock_number[i].updateNum(inum);
				int cur_fr=arr_clock_number[i].getCurFrame();
				//print(inum+"-"+cur_fr+" ");
				sub_pg.image(arr_num_img_9[cur_fr],base_x+margin_x*i,base_y);
			}
			
			sub_pg.image(point_1,base_x+margin_x*2,260+base_y);

			for(int i=0;i<2;++i){
				int inum=Integer.valueOf(nday.charAt(i))-48;
				arr_clock_number[2+i].updateNum(inum);
				int cur_fr=arr_clock_number[2+i].getCurFrame();
				
				sub_pg.image(arr_num_img_9[cur_fr],base_x+45+margin_x*(2+i),base_y);
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
			float base_y=25;
			float base_x=100;
			float margin_x=200;

			String nhour=nf(hour(),2);
			String nminute=nf(minute(),2);
			for(int i=0;i<2;++i){
				int inum=Integer.valueOf(nhour.charAt(i))-48;
				arr_clock_number[4+i].updateNum(inum);
				int cur_fr=arr_clock_number[4+i].getCurFrame();
				
				sub_pg.image(arr_num_img_9[cur_fr],base_x+margin_x*i,base_y);
			}
			
			int t=millis();
			if(t-isecond<500) sub_pg.image(point_2,base_x+margin_x*2,135+base_y);
			if(t-isecond>=1000){
				isecond=t;
				//println(isecond);
			}

			for(int i=0;i<2;++i){
				int inum=Integer.valueOf(nminute.charAt(i))-48;
				arr_clock_number[6+i].updateNum(inum);
				int cur_fr=arr_clock_number[6+i].getCurFrame();
				
				if(i==0) sub_pg.image(arr_num_img_6[cur_fr],base_x+46+margin_x*(2+i),base_y);
				else sub_pg.image(arr_num_img_9[cur_fr],base_x+46+margin_x*(2+i),base_y);
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
				setFace(params);
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
    	if(clock_mode) initClockMode();

    }
	void initClockMode(){
		
		clock_mode=true;

		for(int i=0;i<3;++i) arr_clock_movie[i].loop();

		isecond=millis();

		String nmonth=nf(month(),2);
		String nday=nf(day(),2);
		String nhour=nf(hour(),2);
		String nminute=nf(minute(),2);
		
		arr_clock_number[0].Reset(Integer.valueOf(nmonth.charAt(0))-48);
		arr_clock_number[1].Reset(Integer.valueOf(nmonth.charAt(1))-48);
		arr_clock_number[2].Reset(Integer.valueOf(nday.charAt(0))-48);
		arr_clock_number[3].Reset(Integer.valueOf(nday.charAt(1))-48);
		
		arr_clock_number[4].Reset(Integer.valueOf(nhour.charAt(0))-48);
		arr_clock_number[5].Reset(Integer.valueOf(nhour.charAt(1))-48);
		arr_clock_number[6].Reset(Integer.valueOf(nminute.charAt(0))-48);
		arr_clock_number[7].Reset(Integer.valueOf(nminute.charAt(1))-48);
		

	}

}