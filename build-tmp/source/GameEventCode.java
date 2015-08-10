
public enum GameEventCode{
	
	
	LJoin(101),
	LScore(102),
	LStartRun(103),
	LEatIcon(104),
	LSwitchGame(105),
	
	Server_Add_House(211),
	Server_Set_Name(212),
	Server_Set_House(213),

	Server_Set_Blow(214),
	Server_Set_Light(215),
	Server_Set_Shake(216),
	Server_Set_User_Leave(217),

	Server_Game_Start(220),
	Server_User_Color(221),
	Server_Set_Rotate(222),
	Server_Start_Run(223),

	Server_Set_Face(230),

	Server_Login_Success(150),
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
			case 103:
				return LStartRun;
			case 104:
				return LEatIcon;
			case 105:
				return LSwitchGame;
				
			case 150:
				return Server_Login_Success;
			case 151:
				return Server_Game_Info;


			case 211:
				return Server_Add_House;				
			case 212:
				return Server_Set_Name;
			case 213:
				return Server_Set_House;
			case 214:
				return Server_Set_Blow;
			case 215:
				return Server_Set_Light;
			case 216:
				return Server_Set_Shake;
			case 217:
				return Server_Set_User_Leave;
				
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
			case 223:
				return Server_Start_Run;
		}
		return null;
	}
	public int getValue(){
		return value;
	}
	
}
