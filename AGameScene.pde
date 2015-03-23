import java.util.UUID;


class RayLine{
	float x,y,len;
	float z;
	float vel;
	RayLine(float x_,float y_,float len_){
		x=x_; y=y_; len=len_;
		z=-width/2; vel=random(50)+20;
	}
	void draw(PGraphics pg){
		pg.stroke(255,120);
		pg.line(x,y,z,x,y,z+len);
		update();
	}
	void update(){
		z+=vel;
		if(z>width*2) z=-width/2;
	}
}

class AGameScene extends GameScene{
	int mhouse=9;
	HashMap<String,House> house_map;

	int mray=100;
	RayLine[] arayline;



	@Override
	void Init(){
		super.Init();
		
		house_map=new HashMap<String,House>();
		
		arayline=new RayLine[mray];	
		for(int i=0;i<mray;++i) arayline[i]=new RayLine(random(width),random(height),random(10,width/2));

		// for(int i=0;i<mhouse;++i) 
		// 	addNewHouse(UUID.randomUUID().toString(),"name_"+i);
		this.StartGame();

	}

	@Override
	void Update(){

	}
	
	@Override
	void Draw(){

		pg.beginDraw();

		pg.background(50);
		
		for(int i=0;i<mray;++i) arayline[i].draw(pg);

		// for(int i=0;i<20;++i) pg.ellipse(random(width),random(height),20,20);
		for(House house:house_map.values()) house.draw(pg);


		pg.endDraw();

	}
	// @Override
	void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){
		
		println("GameA Got Event: "+event_code.toString());
		switch(event_code){
			case Server_Set_Name:
				addNewHouse((String)params.get((byte)100),(String)params.get((byte)1));
				break;
			case Server_Set_Blow:
				setBlow((String)params.get((byte)100));
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
		return new int[]{98,99};
	}

	void setRotateLevel(boolean up){
		for(House house:house_map.values()) house.setRotateLevel(up);		
	}

	// String createHouseId(){
	// 	return "a_user_"+UUID.randomUUID();
	// }

	void addNewHouse(String user_id,String user_name){
		println(" new house: "+user_id+" - "+user_name);
		int i=house_map.size();
		house_map.put(user_id,new House(width/4*(ceil(i/3)+.5),height/4*(i%3+.5),user_name));

	}
	void setBlow(String user_id){
		House house=house_map.get(user_id);
		println("set blow: "+house.user_name);
		house.setBlow();
	}
}

