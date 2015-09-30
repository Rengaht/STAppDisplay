class GlobalParameter{
	
	String file_name;

	String Server_Ip,Server_Name;

	PVector Window_Size;
	PVector Display_Loc,Display_Size;
	int Left_Screen_X,Right_Screen_X;

	int AGame_Time_Span,AGame_Round_Break_Span,AGame_Background_Span_Minute;
	String CGame_File_Folder;

	
	String Slack_Tag;

	GlobalParameter(String open_file){
		file_name=open_file;
	}
	void readParameters(){
		JSONObject ojson=null;
		try{
			ojson=loadJSONObject(file_name);
		}catch(Exception e){
			printlnA("No Param File Exist!");
			ojson=createJsonFile();			
		}

		Server_Ip=ojson.getString("Server_Ip");
		Server_Name=ojson.getString("Server_Name");

		AGame_Time_Span=ojson.getInt("AGame_Time_Span");
		AGame_Round_Break_Span=ojson.getInt("AGame_Round_Break_Span");
		AGame_Background_Span_Minute=ojson.getInt("AGame_Background_Span_Minute");

		CGame_File_Folder=ojson.getString("CGame_File_Folder");

		Display_Loc=new PVector(ojson.getFloat("Display_Loc_X"),ojson.getFloat("Display_Loc_Y"));
		Display_Size=new PVector(ojson.getFloat("Display_Size_X"),ojson.getFloat("Display_Size_Y"));
		//Display_Size=new PVector(displayWidth,displayHeight);

		Window_Size=new PVector(ojson.getFloat("Window_Size_X"),ojson.getFloat("Window_Size_Y"));
		//Window_Size=new PVector(displayWidth,displayHeight);

		Left_Screen_X=ojson.getInt("Left_Screen_X");
		Right_Screen_X=ojson.getInt("Right_Screen_X");

		Slack_Tag=ojson.getString("Slack_Tag");

	}
	void saveParameters(){
		JSONObject ojson=new JSONObject();
		
		ojson.setString("Server_Ip",Server_Ip);
		ojson.setString("Server_Name",Server_Name);

		ojson.setFloat("Display_Loc_X",Display_Loc.x);
		ojson.setFloat("Display_Loc_Y",Display_Loc.y);
		ojson.setFloat("Display_Size_X",Display_Size.x);
		ojson.setFloat("Display_Size_Y",Display_Size.y);

		ojson.setFloat("Window_Size_X",Window_Size.x);
		ojson.setFloat("Window_Size_Y",Window_Size.y);


		ojson.setInt("Left_Screen_X",Left_Screen_X);
		ojson.setInt("Right_Screen_X",Right_Screen_X);


		ojson.setInt("AGame_Time_Span",AGame_Time_Span);
		ojson.setInt("AGame_Round_Break_Span",AGame_Round_Break_Span);
		ojson.setInt("AGame_Background_Span_Minute",AGame_Background_Span_Minute);

		ojson.setString("CGame_File_Folder",CGame_File_Folder);
		ojson.setString("Slack_Tag",Slack_Tag);

		saveJSONObject(ojson,file_name);

	}

	JSONObject createJsonFile(){

		printlnA("Create Default Param Json");

		JSONObject ojson=new JSONObject();
		
		ojson.setString("Server_Ip","kerkerker.artgital.com:5055");
		ojson.setString("Server_Name","STPhotonServer");

		ojson.setFloat("Display_Loc_X",0);
		ojson.setFloat("Display_Loc_Y",0);
		ojson.setFloat("Display_Size_X",4080);
		ojson.setFloat("Display_Size_Y",376);

		ojson.setFloat("Window_Size_X",1920);
		ojson.setFloat("Window_Size_Y",1080);


		ojson.setInt("Left_Screen_X",1024);
		ojson.setInt("Right_Screen_X",3056);


		ojson.setInt("AGame_Time_Span",296000);
		ojson.setInt("AGame_Round_Break_Span",5000);
		ojson.setInt("AGame_Background_Span_Minute",2);

		ojson.setString("CGame_File_Folder","F://kerker_face");
		ojson.setString("Slack_Tag","#ONLINE_PC#  ");

		saveJSONObject(ojson,file_name);
		
		return ojson;

	}

}