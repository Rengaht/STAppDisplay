class GameScene{
	
	final int[] Left_Screen_Rect={0,160,1024,400};
	final int[] Center_Screen_Rect={160,0,2016,160};//{1024,0,2016,160};
	final int[] Right_Screen_Rect={1224,160,1024,400};//{3040,0,1024,400};

	PGraphics pg;
	PGraphics left_pg,right_pg,center_pg;
	GameState game_state;

	boolean wait_mode=true;

	GameScene(){
		pg=createGraphics(width,height,P3D);
		left_pg=createGraphics(Left_Screen_Rect[2],Left_Screen_Rect[3],P3D);
		right_pg=createGraphics(Right_Screen_Rect[2],Right_Screen_Rect[3],P3D);
		center_pg=createGraphics(Center_Screen_Rect[2],Center_Screen_Rect[3],P3D);
		
		loadFiles();

	}
	void Init(){
		game_state=GameState.WAIT;
		show_game_over=false;
		wait_mode=true;
	}
	void Update(){}
	void Draw(){

		left_pg.beginDraw();
			DrawLeftScreen(left_pg);
		left_pg.endDraw();

		right_pg.beginDraw();
			DrawRightScreen(right_pg);
		right_pg.endDraw();
		
		center_pg.beginDraw();
			DrawCenterScreen(center_pg);
		center_pg.endDraw();
		

		pg.beginDraw();
		
		pg.image(left_pg,Left_Screen_Rect[0],Left_Screen_Rect[1]);
		pg.image(right_pg,Right_Screen_Rect[0],Right_Screen_Rect[1]);
		pg.image(center_pg,Center_Screen_Rect[0],Center_Screen_Rect[1]);
		
		pg.endDraw();
	}


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

	void DrawLeftScreen(PGraphics sub_pg){}
	void DrawRightScreen(PGraphics sub_pg){}
	void DrawCenterScreen(PGraphics sub_pg){}
	void loadFiles(){}

}