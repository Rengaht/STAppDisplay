class ClockNumber{
	final float fr_vel=.2;
	final float fr_inter=5;
	private int cur_num;
	private float cur_frame;
	
	private int dest_num;
	private int dest_frame;
	
	private int total_frame;
	private int itype;

	ClockNumber(int set_num,int set_total,int set_type){
		total_frame=set_total;
		itype=set_type;
		Reset(set_num);
	}
	void Reset(int set_num){
		cur_num=set_num;
		cur_frame=cur_num*fr_inter;
		dest_frame=(int)cur_frame;
	}
	void updateNum(int set_dest){
		
		if(set_dest==dest_num) return;
		println(cur_num+"->"+set_dest);

		dest_num=set_dest;
		dest_frame=set_dest*(int)fr_inter;
	}
	void update(){
		if(dest_frame!=floor(cur_frame)){
			cur_frame=(cur_frame+fr_vel)%total_frame;
		}else{
			cur_num=dest_num;
		}
	}

	int getCurFrame(){
		return (int)cur_frame;
	}
}