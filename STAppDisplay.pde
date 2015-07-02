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

import processing.video.*;

boolean DRAW_DEBUG=true;
boolean OFFLINE=true;
final int MGAME=3;
final boolean GIRRAFE=false;

final int Left_Screen_X=1024;
final int Right_Screen_X=3056;


PhotonClient photon_client;
Thread photon_thread;
int igame_scene=-1;
GameScene[] agame_scene;
boolean show_game_over=false;

PFont font,name_font;
PApplet gapplet;

PImage img_qrcode_title,img_qrcode_android,img_qrcode_ios;

PShader shd_rmv_bg;


void setup(){

	size(4080,560,P3D);
	gapplet=this;

	

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
	
	img_qrcode_title=loadImage("APP_TITLE.png");
	img_qrcode_android=loadImage("qr_android.png");
	img_qrcode_ios=loadImage("qr_ios.png");

	agame_scene=new GameScene[MGAME];
	agame_scene[0]=new AGameScene();
	// agame_scene[1]=new BGameScene();
	// agame_scene[2]=new CGameScene();

	// for(GameScene game_scene:agame_scene) game_scene.Init();

	// println(agame_scene[6]);
	font=loadFont("GameOver_Font.vlw");
	textFont(font, 40);
	
	name_font=loadFont("MicrosoftMHei-Bold-18.vlw");
	// textFont(name_font);

	shd_rmv_bg=loadShader("Rmv_Black.glsl");
	


	background(0);
	
	drawIlandText("");
}


void draw(){

	

	// if(mousePressed) photon_client.sendSomeEvent();

	
	boolean all_loaded=true;
	for(int i=0;i<MGAME;++i){
		if(agame_scene[i]!=null && !agame_scene[i].finish_load) all_loaded=false;
	}
	if(!all_loaded){
		background(0);
		String load_str="LOADING";
		for(int i=0;i<(frameCount/10)%5;++i) load_str+=".";
		text(load_str,20,height/2);
	}else{

		if(!OFFLINE && photon_client==null){
			photon_client=new PhotonClient();
			photon_thread=new Thread(photon_client);
			photon_thread.start();
		}
		
		if(igame_scene<0){
			String no_str="NO GAME";
			for(int i=0;i<(frameCount/10)%5;++i) no_str+=".";
			text(no_str,20,height/2+50);
			return;	
		}
		agame_scene[igame_scene].SUpdate();
		agame_scene[igame_scene].Draw();
		agame_scene[igame_scene].DrawOnGraph(this.g);
	}

	

	frame.setTitle(String.valueOf(frameRate));

	if(DRAW_DEBUG){

		if(OFFLINE){
			text("OFFLINE",1064,500);
		}else{
			text("ONLINE",1064,500);
		}
	}


	// text("啦啦啦啦蔡佳礽",20,20);
}


void setGame(int game_index){
	// game_index-=101;
	if(game_index<0 || game_index>MGAME-1) return;

	println("Set Game : "+game_index);
	
	// if(igame_scene>-1 && game_index!=igame_scene) agame_scene[igame_scene].UnLoad();

	
	
	if(game_index>-1)
	 if(agame_scene[game_index]!=null){
	 	agame_scene[game_index].Init();
	 	igame_scene=game_index;
	 } 

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
			else if(igame_scene==1) ((BGameScene)agame_scene[1]).arr_car[1].updatePosition(-1);
			break;
		
		
		case 'z':
			if(igame_scene==1) ((BGameScene)agame_scene[1]).arr_car[0].updatePosition(-1);
			break;
		case 'x':
			if(igame_scene==1) ((BGameScene)agame_scene[1]).arr_car[0].updatePosition(1);
			break;
		case 'v':
			if(igame_scene==1) ((BGameScene)agame_scene[1]).arr_car[1].updatePosition(1);
			break;

		case 's':
			if(igame_scene==1) ((BGameScene)agame_scene[1]).StartGame();
			if(igame_scene==0) ((AGameScene)agame_scene[0]).triggerBuilding();
			break;
		case 't':
			if(igame_scene==0) ((AGameScene)agame_scene[0]).triggerTurb();
			break;
					
	}

}


String drawIlandText(String build_name){
	
	if(build_name==null) return null;

	// println("Draw Iland Text "+build_name);
	PGraphics pg_text=createGraphics(200,52,P3D);
	pg_text.beginDraw();
		pg_text.translate(pg_text.width/2,pg_text.height/2);
		pg_text.scale(1,2);
		pg_text.background(0,0);
		pg_text.textFont(name_font);
		pg_text.textSize(18);
		pg_text.textAlign(CENTER,CENTER);
		pg_text.fill(255);

		pg_text.text(build_name,0,0);
		for(int i=0;i<2;++i) pg_text.filter(DILATE);

		pg_text.fill(65,103,177);
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


	String file_name="tag_name_"+nf(frameCount,5)+".png";
	pg_text.save(file_name);
	// saveStrings("tag_str_"+nf(frameCount,5),new String[]{build_name});
	return file_name;

}
