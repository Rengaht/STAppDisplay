class GameScene{
	
	final int[] Left_Screen_Rect={0,176,1024,384};
	final int[] Center_Screen_Rect={0,0,2032,176};
	final int[] Right_Screen_Rect={1024,176,1024,384};

	PGraphics pg;
	PGraphics left_pg,right_pg,center_pg;
	GameState game_state;

	boolean wait_mode=true;
	Thread thread_load=null;
	boolean finish_load=false;

	PImage img_qrcode_title;
	
	boolean show_qrcode;

	GameScene(){
		pg=createGraphics(width,height,P3D);
		left_pg=createGraphics(Left_Screen_Rect[2],Left_Screen_Rect[3],P3D);
		right_pg=createGraphics(Right_Screen_Rect[2],Right_Screen_Rect[3],P3D);
		center_pg=createGraphics(Center_Screen_Rect[2],Center_Screen_Rect[3],P3D);
		
		finish_load=false;
		
		Load();

	}
	void Load(){
		println("Load Game.....");

		// if(!finish_load && thread_load==null){
		// 	thread_load=new Thread(new Runnable(){
		// 	    public void run(){
		// 	    	println(".... Start Loading .....");
			        loadFiles();
			        println(".... End Loading .....");
			        finish_load=true;
			        // Init();
		// 	    }
		// 	});  
		// 	thread_load.start();
		// }
	}
	void Init(){
		
		thread_load=null;

		println("Init Game.....");
		game_state=GameState.WAIT;
		show_game_over=false;
		wait_mode=true;

		show_qrcode=true;
	}

	void SUpdate(){
	
		if(finish_load) Update();	

	}
	void Update(){}
	void Draw(){

		

		left_pg.beginDraw();
			DrawLeftScreen(left_pg);
			if(show_qrcode) drawWaitTitle(left_pg,true);
		left_pg.endDraw();

		right_pg.beginDraw();
			DrawRightScreen(right_pg);
			if(show_qrcode) drawWaitTitle(right_pg,false);
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
		show_game_over=false;
	}
	void EndGame(){
		game_state=GameState.END;
		show_game_over=true;
	}

	void UnLoad(){
		
		println("UnLoad Game.....");

		if(finish_load) unloadFiles();
		System.gc();
		finish_load=false;

	}
	void DrawLeftScreen(PGraphics sub_pg){}
	void DrawRightScreen(PGraphics sub_pg){}
	void DrawCenterScreen(PGraphics sub_pg){}
	void loadFiles(){}
	void unloadFiles(){}

	void drawWaitTitle(PGraphics pg,boolean is_android){
		pg.pushStyle();
		pg.imageMode(CENTER);
		pg.tint(255);
			pg.image(img_qrcode_title,pg.width/2,img_qrcode_title.height/2);
			// pg.tint(255,abs(sin((float)frameCount/50))*105+150);
			float thei=(pg.height+img_qrcode_title.height)/2;
			if(is_android) pg.image(img_qrcode_android,pg.width/2,thei);
			else pg.image(img_qrcode_ios,pg.width/2,thei);
		pg.popStyle();
	}
}