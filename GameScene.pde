class GameScene{
	
	PGraphics pg;
	GameState game_state;

	GameScene(){
		pg=createGraphics(width,height,P3D);
		
	}
	void Init(){
		game_state=GameState.WAIT;
		show_game_over=false;
	}
	void Update(){}
	void Draw(){}
	void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){}
	int[] GetScores(){return null;}

	void DrawOnGraph(PGraphics back_graph){
		back_graph.image(pg,0,0);
	}
	void StartGame(){
		game_state=GameState.PLAY;
		
	}
	void EndGame(){
		game_state=GameState.END;
		show_game_over=true;
	}


}