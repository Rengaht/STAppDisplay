import de.exitgames.api.loadbalancing.LoadBalancingClient;
import de.exitgames.api.loadbalancing.LoadBalancingPeer;
import java.security.Provider;
import java.security.Security;
import java.util.Enumeration;
// import org.bouncycastle.jce.provider.BouncyCastleProvider;
import java.util.Collections;
import java.util.Iterator;
import java.lang.reflect.Field;


final int MGAME=3;
PhotonClient photon_client;
int igame_scene=0;
GameScene[] agame_scene;
boolean show_game_over=false;

PFont font;


void setup(){

	size(1024,768,P3D);

	photon_client=new PhotonClient();
	new Thread(photon_client).start();


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
	

	agame_scene=new GameScene[MGAME];
	agame_scene[0]=new AGameScene();
	agame_scene[1]=new BGameScene();
	agame_scene[2]=new CGameScene();

	for(GameScene game_scene:agame_scene) game_scene.Init();

	// println(agame_scene[6]);
	font=loadFont("GameOver_Font.vlw");
	textFont(font, 120);

}


void draw(){

	// if(mousePressed) photon_client.sendSomeEvent();

	agame_scene[igame_scene].Update();
	agame_scene[igame_scene].Draw();

	agame_scene[igame_scene].DrawOnGraph(this.g);

	if(show_game_over){
		text("GAME OVER",20,height/2);
	}
	frame.setTitle(String.valueOf(frameRate));
}


void setGame(int game_index){
	// game_index-=101;
	if(game_index<0 || game_index>MGAME-1) return;
	println("Set Game : "+game_index);
	
	igame_scene=game_index;
	

	agame_scene[igame_scene].Init();

}


void keyPressed(){
	switch(key){
		case 'a':
			igame_scene++;
			igame_scene%=MGAME;
			break;
		case 's':
			show_game_over=!show_game_over;
			break;
		case 'q':
			if(igame_scene==0) ((AGameScene)agame_scene[igame_scene]).addNewHouse("test_id","test_name");
			break;
		// case 'd':
		// 	if(igame_scene==0) ((AGameScene)agame_scene[igame_scene]).setRotateLevel(false);
		// 	break;
	}

}