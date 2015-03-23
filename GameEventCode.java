
public enum GameEventCode{
	
	
	LJoin(101),
	LScore(102),
	
	Server_Set_Name(210),
	Server_Set_Blow(211),

	Server_Game_Start(220),
	Server_User_Color(221),
	Server_Set_Rotate(222),

	Server_Set_Face(230),


	Server_Game_Info(151), 
	Server_LConnected(201),
	Server_LRequest_Score(202),
	Server_Score_Success(203),
	Server_LGG(204)
	;
	

	private final int value;
	GameEventCode(int value){ this.value=value; }
	public int getGameEvent(){ return value; }
	
	public static GameEventCode fromInt(int x){
		
		x=x&0xFF;

		switch(x){
			case 101:
				return LJoin;
			case 102:
				return LScore;
			case 151:
				return Server_Game_Info;
			case 210:
				return Server_Set_Name;
			case 211:
				return Server_Set_Blow;
			case 201:
				return Server_LConnected;
			case 202:
				return Server_LRequest_Score;
			case 203:
				return Server_Score_Success;
			case 204:
				return Server_LGG;
			case 230:
				return Server_Set_Face;
			case 220:
				return Server_Game_Start;
			case 221:
				return Server_User_Color;
			case 222:
				return Server_Set_Rotate;
		}
		return null;
	}
	public int getValue(){
		return value;
	}
	
}
