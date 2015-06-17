import de.exitgames.api.loadbalancing.LoadBalancingClient;
import de.exitgames.api.loadbalancing.LoadBalancingPeer;
import java.security.Provider;
import java.security.Security;
import java.util.Enumeration;
// import org.bouncycastle.jce.provider.BouncyCastleProvider;
import java.util.Collections;
import java.util.Iterator;
import java.lang.reflect.Field;


import processing.video.*;

boolean DRAW_DEBUG=true;
boolean OFFLINE=false;
final int MGAME=3;
final boolean GIRRAFE=false;

final int Left_Screen_X=1024;
final int Right_Screen_X=3056;


PhotonClient photon_client;
Thread photon_thread;
int igame_scene=-1;
GameScene[] agame_scene;
boolean show_game_over=false;

PFont font;
PApplet gapplet;

PImage img_qrcode_title,img_qrcode_android,img_qrcode_ios;


void setup(){

	size(3056,560,P3D);
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
	agame_scene[1]=new BGameScene();
	agame_scene[2]=new CGameScene();

	// for(GameScene game_scene:agame_scene) game_scene.Init();

	// println(agame_scene[6]);
	font=loadFont("GameOver_Font.vlw");
	textFont(font, 40);

	background(0);
	

}


void draw(){

	

	// if(mousePressed) photon_client.sendSomeEvent();

	
	boolean all_loaded=true;
	for(int i=0;i<MGAME;++i){
		if(!agame_scene[i].finish_load) all_loaded=false;
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
}


void setGame(int game_index){
	// game_index-=101;
	if(game_index<0 || game_index>MGAME-1) return;

	println("Set Game : "+game_index);
	
	// if(igame_scene>-1 && game_index!=igame_scene) agame_scene[igame_scene].UnLoad();

	igame_scene=game_index;
	
	if(igame_scene>-1) agame_scene[igame_scene].Init();

}


void keyPressed(){
	switch(key){
		case 'a':
			setGame((igame_scene+1)%MGAME);
			break;
		case 'g':
			show_game_over=!show_game_over;
			break;
		case 'q':
			if(igame_scene==0) ((AGameScene)agame_scene[igame_scene]).addNewHouse("test_id","test_name",1);
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
			break;

					
	}

}