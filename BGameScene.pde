class BGameScene extends GameScene{
	
	EnergyCar[] acar;	
	int iwinner;
	

	@Override
	void Init(){
		super.Init();
		acar=new EnergyCar[2];
		acar[0]=new EnergyCar(width/4,height/2,0);
		acar[1]=new EnergyCar(width/4*3,height/2,1);
	}

	@Override
	void Update(){
		if(game_state==GameState.PLAY){

			boolean one_arrive=false;
			for(int i=0;i<2;++i){
				 EnergyCar car=acar[i];
				 car.update();
				 if(car.arriveGoal()){
				 	one_arrive=true;
				 	iwinner=i;
				 }
			}
			if(one_arrive){
				 int[] scores=GetScores();
				 photon_client.sendScoreEvent(scores[0],scores[1]);
				 for(EnergyCar car:acar) car.stopRun();
				 this.EndGame();
			}
		}
	}
	
	@Override
	void Draw(){

		pg.beginDraw();

		pg.background(255);
		// for(int i=0;i<20;++i) pg.rect(random(width),random(height),20,20);

		for(EnergyCar car:acar) car.draw(pg);

		pg.endDraw();

	}
	@Override
	void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){

		println("GameB Got Event: "+event_code.toString());
		
		switch(event_code){
			case Server_Game_Start:
				StartGame();
				break;
			case Server_User_Color:
				int car_color=(Integer)params.get((byte)1);
				if(car_color>=0 && car_color<=1) acar[car_color].user_id=(String)params.get((byte)100);
				break;
			case Server_Set_Rotate:
				int car_index=(Integer)params.get((byte)1);
				int car_position=(Integer)params.get((byte)2);
				if(car_index>=0 && car_index<=1) acar[car_index].updatePosition(car_position);
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
		return new int[]{acar[0].getScore(),acar[1].getScore()};
	}

	@Override
	void StartGame(){
		super.StartGame();
		iwinner=-1;
	
		for(EnergyCar car:acar) car.startRun();

	}
	
}