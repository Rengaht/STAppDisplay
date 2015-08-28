PVector[] ArrPos_ClockNum={new PVector(0,0),new PVector(1,0),new PVector(2,0),new PVector(3,0),new PVector(4,0),
						new PVector(0,1),new PVector(4,1),
						new PVector(0,2),new PVector(1,2),new PVector(2,2),new PVector(3,2),new PVector(4,2),	
						new PVector(0,3),new PVector(4,3),
						new PVector(0,4),new PVector(1,4),new PVector(2,4),new PVector(3,4),new PVector(4,4)};

class ClockAvatarNumber{
	int cur_num=-1;
	int dest_num=-1;

	ArrayList<PVector> arr_num_pos;
	ArrayList<ClockAvatar> arr_avatar;

	ImageSeq img_seq;
	FrameAnimation anima_pos,anima_change;


	ClockAvatarNumber(int set_num){
		arr_num_pos=new ArrayList<PVector>();
		arr_avatar=new ArrayList<ClockAvatar>();
		
		img_seq=new ImageSeq(6);
		img_seq.play();


		/* Go out every 10 sec */
		anima_pos=new FrameAnimation(180);
		// anima_pos.is_loop=true;
		
		
		anima_change=new FrameAnimation(90);


		updateNum(set_num);
	}
	void addAvatar(int aindex,int findex,PImage fimage){
		arr_avatar.add(new ClockAvatar(findex,fimage,arr_num_pos.get(aindex),
										new PVector(arr_num_pos.get(aindex).x+random(5,10)*(random(2)<1?1:-1),arr_num_pos.get(aindex).y+random(5,10)*(random(2)<1?1:-1))));
	}
	void updateAvatar(int aindex){
		printlnA("Update Clock Avatar: "+aindex);
		ClockAvatar _avatar=arr_avatar.get(aindex);
		_avatar.updatePos(arr_num_pos.get(aindex),
							new PVector(arr_num_pos.get(aindex).x+random(5,10)*(random(2)<1?1:-1),arr_num_pos.get(aindex).y+random(5,10)*(random(2)<1?1:-1)));
	}
	void removeAvatar(int aindex){
		printlnA("Rmv Clock Avatar: "+aindex);
		arr_avatar.get(aindex).gotoDie(anima_pos.GetPortion());
	}
	void startChange(){	
		// anima_change.setDue(min(90,180-180*anima_change.GetPortion()));	
		anima_change.Restart();
	}

	void start(){
		anima_pos.Restart();
		img_seq.play();
	}
	void pause(){
		anima_pos.Pause();
		img_seq.pause();
	}
	void update(){
		anima_pos.Update();
		img_seq.update();

		anima_change.Update();
		if(anima_change.GetPortion()==1) cur_num=dest_num;
		// for(ClockAvatar c:arr_avatar) c.update();
		Iterator<ClockAvatar> it=arr_avatar.iterator();
		while(it.hasNext()){
			ClockAvatar c=it.next();
			if(c.isDead()) it.remove();
		}
	}	
	int getAvatarSize(){
		return arr_avatar.size();
	}
	int getPosSize(){
		return arr_num_pos.size();
	}
	ClockAvatar getAvatar(int i){
		return arr_avatar.get(i);
	}
	int getCurFrame(){
		return (int)(img_seq.icur_frame);
	}
	float getAniPortion(){
		return anima_pos.GetPortion();
	}
	float getChangePortion(){
		return anima_change.GetPortion();	
	}
	
	boolean updateNum(int set_num){
		
		if(dest_num==set_num) return false;
		if(arr_avatar.size()>0 && (getAniPortion()==1 || getAniPortion()==0)) return false;
 

		dest_num=set_num;
		arr_num_pos.clear();
		// arr_avatar.clear();


		switch(dest_num){
			case 0:
				for(int i=0;i<5;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[5]);arr_num_pos.add(ArrPos_ClockNum[6]);
				arr_num_pos.add(ArrPos_ClockNum[7]);arr_num_pos.add(ArrPos_ClockNum[11]);
				arr_num_pos.add(ArrPos_ClockNum[12]);arr_num_pos.add(ArrPos_ClockNum[13]);
				for(int i=14;i<19;++i) arr_num_pos.add(ArrPos_ClockNum[i]);				
				break;
			case 1:
				arr_num_pos.add(new PVector(2,0));
				arr_num_pos.add(new PVector(2,1));
				arr_num_pos.add(new PVector(2,2));
				arr_num_pos.add(new PVector(2,3));
				arr_num_pos.add(new PVector(2,4));
				break;
			case 2:
				for(int i=0;i<5;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[6]);
				for(int i=7;i<12;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[12]);
				for(int i=14;i<19;++i) arr_num_pos.add(ArrPos_ClockNum[i]);				
				break;
			case 3:
				for(int i=0;i<5;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[6]);
				for(int i=7;i<12;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[13]);
				for(int i=14;i<19;++i) arr_num_pos.add(ArrPos_ClockNum[i]);				
				break;
			case 4:
				arr_num_pos.add(ArrPos_ClockNum[0]);arr_num_pos.add(ArrPos_ClockNum[4]);
				arr_num_pos.add(ArrPos_ClockNum[5]);arr_num_pos.add(ArrPos_ClockNum[6]);
				for(int i=7;i<12;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[13]);
				arr_num_pos.add(ArrPos_ClockNum[18]);
				break;
			case 5:
				for(int i=0;i<5;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[5]);
				for(int i=7;i<12;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[13]);
				for(int i=14;i<19;++i) arr_num_pos.add(ArrPos_ClockNum[i]);				
				break;
			case 6:
				for(int i=0;i<5;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[5]);
				for(int i=7;i<12;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[12]);arr_num_pos.add(ArrPos_ClockNum[13]);
				for(int i=14;i<19;++i) arr_num_pos.add(ArrPos_ClockNum[i]);				
				break;
			case 7:
				for(int i=0;i<5;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[6]);
				arr_num_pos.add(ArrPos_ClockNum[11]);
				arr_num_pos.add(ArrPos_ClockNum[13]);
				arr_num_pos.add(ArrPos_ClockNum[18]);
				break;
			case 8:
				for(int i=0;i<19;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				break;
			case 9:
				for(int i=0;i<5;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[5]);arr_num_pos.add(ArrPos_ClockNum[6]);
				for(int i=7;i<12;++i) arr_num_pos.add(ArrPos_ClockNum[i]);
				arr_num_pos.add(ArrPos_ClockNum[13]);
				for(int i=14;i<19;++i) arr_num_pos.add(ArrPos_ClockNum[i]);				
				break;		
			case 11: //colon
				arr_num_pos.add(new PVector(2,1));
				arr_num_pos.add(new PVector(2,3));
				break;		
			case 10:
				arr_num_pos.add(new PVector(3,0));
				arr_num_pos.add(new PVector(2.5,1));
				arr_num_pos.add(new PVector(2,2));
				arr_num_pos.add(new PVector(1.5,3));
				arr_num_pos.add(new PVector(1,4));
				break;		
		}
		return true;

	}


}