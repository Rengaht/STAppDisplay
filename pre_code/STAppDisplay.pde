import de.exitgames.api.loadbalancing.LoadBalancingClient;
import de.exitgames.api.loadbalancing.LoadBalancingPeer;
import java.security.Provider;
import java.security.Security;
import java.util.Enumeration;
// import org.bouncycastle.jce.provider.BouncyCastleProvider;
import java.util.Collections;
import java.util.Iterator;
import java.lang.reflect.Field;
import java.util.Collection;
import java.util.Calendar;
import java.util.Arrays;

import processing.video.*;

boolean DRAW_DEBUG=false;
boolean OFFLINE=true;
final int MGAME=3;
boolean DO_EASTER_EGG=false;

final boolean DRAW_FRAME=true;
final boolean WRITE_LOG=true;
PrintWriter log_output;


final float ORIGIN_DISPLAY_WIDTH=4080;
final float ORIGIN_DISPLAY_HEIGHT=376;

final String PARAM_FILE_PATH="stapp_display_params.json";
GlobalParameter Global_Param;

// final int Left_Screen_X=1024;
// final int Right_Screen_X=3056;

PhotonClient photon_client;
Thread photon_thread;
int igame_scene=-1;
GameScene[] agame_scene;
boolean show_game_over=false;

PFont font,name_font,timer_font;
PApplet gapplet;

PImage img_qrcode_android,img_qrcode_ios;

PShader shd_rmv_bg;

PVector scale_to_screen;


public void init(){
	if(!DRAW_FRAME){
		// to make a frame not displayable, you can
		// use frame.removeNotify()		
		frame.removeNotify();
		frame.setUndecorated(true);

		// addNotify, here i am not sure if you have 
		// to add notify again.  
		frame.addNotify();
	}
	super.init();

}
void setup(){
	
	frame.setLocation(0,0);

	Global_Param=new GlobalParameter(PARAM_FILE_PATH);
	Global_Param.readParameters();

	scale_to_screen=new PVector(Global_Param.Display_Size.x/ORIGIN_DISPLAY_WIDTH,Global_Param.Display_Size.y/ORIGIN_DISPLAY_HEIGHT);

	frameRate(60);
	size((int)Global_Param.Window_Size.x,(int)Global_Param.Window_Size.y,P3D);


	gapplet=this;
	
	if(WRITE_LOG){
		String log_name="log/STDisplayLog_"+year()+nf(month(),2)+nf(day(),2)+nf(hour(),2)+nf(minute(),2)+".txt";
		println("Create Log: "+log_name);
		log_output=createWriter(log_name);	
		printlnA("STDisplay Start!");
		//initLogger(log_name,"ALL");
	} 


	/* for Photon SDK*/
	Security.addProvider(new BouncyCastleProvider());
	try{ 
		Field field = Class.forName("javax.crypto.JceSecurity").
		getDeclaredField("isRestricted");
		field.setAccessible(true);
		field.set(null, java.lang.Boolean.FALSE); 
	}catch(Exception ex){
		ex.printStackTrace();
	}
	
	// img_qrcode_title=loadImage("APP_TITLE.png");
	img_qrcode_android=loadImage("qr_android.png");
	img_qrcode_ios=loadImage("qr_ios.png");

	agame_scene=new GameScene[MGAME];
	agame_scene[0]=new AGameScene();
	agame_scene[1]=new BGameScene();
	agame_scene[2]=new CGameScene();

	// for(GameScene game_scene:agame_scene) game_scene.Init();

	// println(agame_scene[6]);
	font=loadFont("GameOver_Font.vlw");
	textFont(font, 20);
	
	name_font=loadFont("Combined-Bold-22.vlw");
	timer_font=loadFont("Timer_Font.vlw");

	shd_rmv_bg=loadShader("Rmv_Black.glsl");
	

	background(0);
	
	
}


void draw(){
	
	background(0);

	scale_to_screen.x=Global_Param.Display_Size.x/ORIGIN_DISPLAY_WIDTH;
	scale_to_screen.y=Global_Param.Display_Size.y/ORIGIN_DISPLAY_HEIGHT;


	String str_log="";

	boolean all_loaded=true;
	for(int i=0;i<MGAME;++i){
		if(agame_scene[i]!=null && !agame_scene[i].finish_load) all_loaded=false;
	}
	if(!all_loaded){
		
		str_log+="LOADING";
		for(int i=0;i<(frameCount/10)%5;++i) str_log+=".";
		str_log+="\n";
	}else{

		if(!OFFLINE && photon_client==null){
			photon_client=new PhotonClient();
			photon_thread=new Thread(photon_client);
			photon_thread.start();
		}
		
		if(igame_scene<0){
			str_log+="NO GAME";
			for(int i=0;i<(frameCount/10)%5;++i) str_log+=".";
			str_log+="\n";

			
		}else{
			
			pushMatrix();
			translate(Global_Param.Display_Loc.x,Global_Param.Display_Loc.y);
			scale(scale_to_screen.x,scale_to_screen.y);

			agame_scene[igame_scene].SUpdate();
			agame_scene[igame_scene].Draw();
			agame_scene[igame_scene].DrawOnGraph(this.g);

			popMatrix();
		}
	}


	frame.setTitle(String.valueOf(frameRate));

	if(DRAW_DEBUG){
		if(OFFLINE) str_log+="OFFLINE\n";
		else str_log+="ONLINE\n";
		
		str_log+="Display Loc:   "+Global_Param.Display_Loc.x+" , "+Global_Param.Display_Loc.y;
		str_log+="\nDisplay Size:  "+Global_Param.Display_Size.x+" , "+Global_Param.Display_Size.y;

		str_log+="\nDisplay Scale: "+scale_to_screen.x+" , "+scale_to_screen.y;
		fill(255,0,0);
		text(str_log,20,height-100);
	}

	// if(mousePressed) saveFrame("STApp_cap_#####.png");

}


void setGame(int game_index){
	// game_index-=101;

	printlnA("Set Game : "+game_index);

	if(game_index<0 || game_index>MGAME-1) return;

	
	
	if(game_index>-1)
	 if(agame_scene[game_index]!=null){
	 	agame_scene[game_index].Init();
	 	igame_scene=game_index;
	 } 

}

void printlnA(String str_print){
	println(str_print);
	log_output.println(getTimeStamp()+str_print);
}

String getTimeStamp(){
	return nf(hour(),2)+nf(minute(),2)+nf(second(),2)+"  ";
}

void keyPressed(){
	switch(key){
		case 'a':
			setGame((igame_scene+1)%MGAME);
			break;
		case 'g':
			show_game_over=!show_game_over;
			break;
		case 'h':
			// if(igame_scene==0) ((AGameScene)agame_scene[igame_scene]).addNewHouse("test_id"+frameCount,(int)random(2));
			break;
		case 'd':
			//DRAW_DOOR=!DRAW_DOOR;
			DRAW_DEBUG=!DRAW_DEBUG;
			break;

		case 'o':
			OFFLINE=!OFFLINE;
			background(0);
			if(!OFFLINE){
				photon_client=new PhotonClient();
				new Thread(photon_client).start();
			}else{
				photon_client.disconnect();
				photon_thread=null;
			}
			break;

		case 'c':
			if(igame_scene==2) ((CGameScene)agame_scene[2]).toggleClockMode();
			break;
	
		case 's':
			if(igame_scene==1) ((BGameScene)agame_scene[1]).StartGame();
			if(igame_scene==0) ((AGameScene)agame_scene[0]).triggerBuilding();
			break;
		case 't':
			if(igame_scene==0) ((AGameScene)agame_scene[0]).triggerTurb();
			break;
		case ENTER:
			if(!OFFLINE) photon_client.sendSwitchGameEvent((igame_scene+1)%3);
			break;
		case 'n':
			if(igame_scene==0) ((AGameScene)agame_scene[0]).triggerCat();
			break;

		case 'e':
			DO_EASTER_EGG=!DO_EASTER_EGG;
			break;

		case 'Z':
			if(DRAW_DEBUG) Global_Param.Display_Size.x+=1;
			break;
		case 'X':
			if(DRAW_DEBUG) Global_Param.Display_Size.x-=1;
			break;
		case 'Q':
			if(DRAW_DEBUG) Global_Param.Display_Size.y+=1;
			break;
		case 'W':
			if(DRAW_DEBUG) Global_Param.Display_Size.y-=1;
			break;

		case 'S':
			if(DRAW_DEBUG) Global_Param.saveParameters();
			break;
		case 'R':
			if(DRAW_DEBUG) Global_Param.readParameters();
			break;
		
	}
	if(key==CODED){
    	switch(keyCode){
	    	case UP:
	    		if(DRAW_DEBUG) Global_Param.Display_Loc.y-=1;			
	    		break;
	    	case DOWN:
	    		if(DRAW_DEBUG) Global_Param.Display_Loc.y+=1;			
	    		break;
	    	case LEFT:
	    		if(DRAW_DEBUG) Global_Param.Display_Loc.x-=1;			
	    		break;
	    	case RIGHT:
	    		if(DRAW_DEBUG) Global_Param.Display_Loc.x+=1;			
	    		break;
    	}
    }
}


String drawIlandText(String build_name,int left_right){
	
	if(build_name==null) return null;

	// println("Draw Iland Text "+build_name);
	PGraphics pg_text=createGraphics(120,52,P3D);
	pg_text.beginDraw();
		pg_text.translate(pg_text.width/2,pg_text.height/2);
		pg_text.textFont(name_font,22);
		pg_text.textAlign(CENTER,CENTER);
		
		float twid=pg_text.textWidth(build_name);
		float tscale=(twid<120)?1:120/twid;
		pg_text.scale(tscale,2.2);

		pg_text.background(0,0);
		pg_text.fill(255);

		pg_text.text(build_name,0,0);
		for(int i=0;i<2;++i) pg_text.filter(DILATE);

		// if(left_right==1) pg_text.fill(65,103,177);
		// else pg_text.fill(239,74,82);
		pg_text.fill(0);

		pg_text.text(build_name,0,0);

		// pg_text.shader(shd_rmv_bg);
		// pg_text.loadPixels();
		// for(int i=0;i<pg_text.width;++i)
		// 	for(int j=0;j<pg_text.height;++j){
		// 		color tcolor=pg_text.get(i,j);
		// 		if(red(tcolor)<65 || green(tcolor)<103 || blue(tcolor)<177) pg_text.set(i,j,color(0,0));
		// 		else pg_text.set(i,j,color(tcolor,255));
		// 	}
		// pg_text.updatePixels();
	pg_text.endDraw();


	String file_name="tag_name_"+nf(frameCount,5)+"_"+nf((int)random(1000),4)+".png";
	pg_text.save(file_name);
	// saveStrings("tag_str_"+nf(frameCount,5),new String[]{build_name});
	return file_name;

}


void exit(){

  println("PROGRAM EXIT!");
  if(WRITE_LOG){
	  log_output.flush();  // Writes the remaining data to the file
	  log_output.close();  // Finishes the file
  }
  super.exit();
}