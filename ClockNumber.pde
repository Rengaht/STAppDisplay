class ClockNumber{

	final int FrameLoopStart=12;
	final int FrameLoopEnd=17;


	final float fr_vel=.2;
	final float fr_inter=5;
	private int cur_num;
	private float cur_frame;
	
	private int dest_num;
	private int dest_frame;
	
	private int total_frame;
	private int itype;

	private int MLOOP=2*28;
	private int minter_loop;

	ClockNumber(int set_num,int set_total,int set_type){
		total_frame=set_total;
		itype=set_type;
		Reset(set_num,0);
	}
	// void Reset(int set_num){
	// 	cur_num=set_num;
	// 	cur_frame=cur_num*fr_inter;
	// 	dest_frame=(int)cur_frame;
	// }
	// void updateNum(int set_dest){
		
	// 	if(set_dest==dest_num) return;
	// 	println(cur_num+"->"+set_dest);

	// 	dest_num=set_dest;
	// 	dest_frame=set_dest*(int)fr_inter;
	// }
	// void update(){
	// 	if(dest_frame!=floor(cur_frame)){
	// 		cur_frame=(cur_frame+fr_vel)%total_frame;
	// 	}else{
	// 		cur_num=dest_num;
	// 	}
	// }
	void Reset(int set_num,int set_frame){
		cur_num=set_num;
		dest_num=cur_num;
		cur_frame=set_frame;	
		minter_loop=0;	
	}
	void updateNum(){
		minter_loop=MLOOP+1;
	}
	boolean updateNum(int set_dest){
		
		if(set_dest==dest_num) return false;
		println(cur_num+"->"+set_dest);

		dest_num=set_dest;
		// updateNum();
		return true;
		// dest_frame=set_dest*(int)fr_inter;
	}
	void update(){
		
		cur_frame+=fr_vel;
		if(ceil(cur_frame)==FrameLoopEnd+1){
			if(minter_loop<MLOOP){
				cur_frame=FrameLoopStart;
				minter_loop++;
				// println("LOOP= "+minter_loop);
			}
		}

		if(cur_frame>total_frame){
			cur_frame%=total_frame;
			minter_loop=0;	

			if(dest_num!=cur_num) cur_num=dest_num;			
		}

	}
	int getCurNum(){
		return cur_num;
	}

	int getCurFrame(){
		return floor(cur_frame);
	}
}