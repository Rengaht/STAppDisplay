import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import de.exitgames.api.loadbalancing.LoadBalancingClient; 
import de.exitgames.api.loadbalancing.LoadBalancingPeer; 
import java.security.Provider; 
import java.security.Security; 
import java.util.Enumeration; 
import java.util.Collections; 
import java.util.Iterator; 
import java.lang.reflect.Field; 
import java.util.UUID; 
import org.apache.commons.codec.binary.Base64; 
import java.io.File; 
import java.nio.file.Files; 
import java.io.FileOutputStream; 
import java.util.Map.Entry; 

import org.bouncycastle.math.field.*; 
import org.bouncycastle.jce.provider.*; 
import org.bouncycastle.i18n.filter.*; 
import org.bouncycastle.crypto.encodings.*; 
import org.bouncycastle.asn1.crmf.*; 
import org.bouncycastle.crypto.parsers.*; 
import org.bouncycastle.crypto.ec.*; 
import org.bouncycastle.asn1.util.*; 
import org.bouncycastle.jcajce.provider.asymmetric.dh.*; 
import org.bouncycastle.jcajce.provider.keystore.bc.*; 
import org.bouncycastle.pqc.jcajce.provider.gmss.*; 
import org.bouncycastle.crypto.modes.gcm.*; 
import org.bouncycastle.jcajce.provider.asymmetric.dsa.*; 
import org.bouncycastle.asn1.gnu.*; 
import org.bouncycastle.util.io.pem.*; 
import org.bouncycastle.util.*; 
import org.bouncycastle.jcajce.spec.*; 
import org.bouncycastle.jcajce.provider.asymmetric.ies.*; 
import org.bouncycastle.asn1.*; 
import org.bouncycastle.crypto.util.*; 
import org.bouncycastle.jce.spec.*; 
import org.bouncycastle.asn1.microsoft.*; 
import org.bouncycastle.asn1.pkcs.*; 
import org.bouncycastle.crypto.*; 
import org.bouncycastle.math.raw.*; 
import org.bouncycastle.math.ec.tools.*; 
import org.bouncycastle.jcajce.provider.symmetric.*; 
import org.bouncycastle.crypto.prng.*; 
import org.bouncycastle.asn1.cms.ecc.*; 
import org.bouncycastle.asn1.x9.*; 
import org.bouncycastle.asn1.sec.*; 
import org.bouncycastle.crypto.agreement.srp.*; 
import org.bouncycastle.jcajce.provider.util.*; 
import org.bouncycastle.x509.util.*; 
import org.bouncycastle.jcajce.provider.digest.*; 
import de.exitgames.client.photon.*; 
import org.bouncycastle.crypto.io.*; 
import org.bouncycastle.jcajce.util.*; 
import org.bouncycastle.jcajce.provider.asymmetric.x509.*; 
import org.bouncycastle.asn1.mozilla.*; 
import org.bouncycastle.asn1.ess.*; 
import org.bouncycastle.asn1.x500.style.*; 
import org.bouncycastle.asn1.eac.*; 
import org.bouncycastle.pqc.crypto.rainbow.*; 
import org.bouncycastle.asn1.x509.sigi.*; 
import org.apache.commons.codec.language.*; 
import org.bouncycastle.crypto.digests.*; 
import org.bouncycastle.asn1.cryptopro.*; 
import org.bouncycastle.asn1.cms.*; 
import org.bouncycastle.pqc.math.linearalgebra.*; 
import org.bouncycastle.jce.*; 
import org.bouncycastle.asn1.cmp.*; 
import org.bouncycastle.util.io.*; 
import org.bouncycastle.asn1.esf.*; 
import org.bouncycastle.pqc.asn1.*; 
import org.bouncycastle.crypto.commitments.*; 
import org.bouncycastle.crypto.macs.*; 
import org.bouncycastle.jcajce.*; 
import org.bouncycastle.math.ec.custom.djb.*; 
import org.bouncycastle.pqc.crypto.gmss.util.*; 
import org.bouncycastle.math.ec.*; 
import de.exitgames.client.photon.enums.*; 
import org.bouncycastle.asn1.dvcs.*; 
import org.bouncycastle.crypto.prng.drbg.*; 
import org.bouncycastle.asn1.smime.*; 
import org.bouncycastle.asn1.bsi.*; 
import org.bouncycastle.jce.exception.*; 
import org.bouncycastle.jcajce.provider.asymmetric.dstu.*; 
import org.bouncycastle.jcajce.provider.asymmetric.ecgost.*; 
import org.bouncycastle.asn1.nist.*; 
import org.bouncycastle.asn1.ua.*; 
import org.bouncycastle.crypto.modes.*; 
import org.bouncycastle.asn1.icao.*; 
import org.bouncycastle.pqc.crypto.rainbow.util.*; 
import org.bouncycastle.asn1.kisa.*; 
import org.bouncycastle.asn1.iana.*; 
import org.bouncycastle.asn1.teletrust.*; 
import org.apache.commons.codec.digest.*; 
import org.bouncycastle.asn1.misc.*; 
import org.bouncycastle.asn1.isismtt.x509.*; 
import org.bouncycastle.crypto.engines.*; 
import org.bouncycastle.crypto.params.*; 
import org.bouncycastle.asn1.bc.*; 
import org.bouncycastle.asn1.x509.*; 
import org.bouncycastle.jcajce.provider.asymmetric.elgamal.*; 
import org.bouncycastle.crypto.tls.*; 
import org.apache.commons.codec.*; 
import org.bouncycastle.crypto.kems.*; 
import de.exitgames.api.loadbalancing.*; 
import org.bouncycastle.asn1.oiw.*; 
import org.bouncycastle.crypto.agreement.jpake.*; 
import org.bouncycastle.jce.interfaces.*; 
import org.bouncycastle.jcajce.provider.asymmetric.rsa.*; 
import org.bouncycastle.jcajce.provider.keystore.*; 
import org.bouncycastle.crypto.agreement.*; 
import org.bouncycastle.asn1.x500.*; 
import org.bouncycastle.pqc.jcajce.provider.rainbow.*; 
import org.bouncycastle.x509.*; 
import org.bouncycastle.pqc.jcajce.provider.*; 
import org.bouncycastle.*; 
import org.bouncycastle.pqc.jcajce.spec.*; 
import org.apache.commons.codec.binary.*; 
import org.bouncycastle.crypto.signers.*; 
import org.bouncycastle.jcajce.provider.asymmetric.*; 
import org.bouncycastle.jcajce.provider.symmetric.util.*; 
import org.bouncycastle.pqc.crypto.mceliece.*; 
import org.bouncycastle.asn1.isismtt.*; 
import org.bouncycastle.jcajce.provider.keystore.pkcs12.*; 
import org.bouncycastle.jcajce.provider.asymmetric.util.*; 
import org.bouncycastle.asn1.isismtt.ocsp.*; 
import org.bouncycastle.asn1.ocsp.*; 
import org.bouncycastle.math.ec.custom.sec.*; 
import org.bouncycastle.util.test.*; 
import org.bouncycastle.x509.extension.*; 
import org.bouncycastle.crypto.paddings.*; 
import org.bouncycastle.i18n.*; 
import org.bouncycastle.jcajce.provider.config.*; 
import org.bouncycastle.crypto.agreement.kdf.*; 
import org.bouncycastle.math.ec.endo.*; 
import org.bouncycastle.crypto.generators.*; 
import org.apache.commons.codec.net.*; 
import org.bouncycastle.jcajce.provider.asymmetric.gost.*; 
import org.bouncycastle.asn1.x509.qualified.*; 
import org.bouncycastle.pqc.jcajce.provider.util.*; 
import org.bouncycastle.jcajce.io.*; 
import org.bouncycastle.asn1.tsp.*; 
import org.bouncycastle.asn1.ntt.*; 
import org.bouncycastle.pqc.jcajce.provider.mceliece.*; 
import org.bouncycastle.pqc.crypto.gmss.*; 
import org.bouncycastle.pqc.crypto.*; 
import org.bouncycastle.util.encoders.*; 
import org.bouncycastle.jcajce.provider.asymmetric.ec.*; 
import org.apache.commons.codec.language.bm.*; 
import org.bouncycastle.crypto.examples.*; 
import org.bouncycastle.jce.netscape.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class STPhotonP5Client extends PApplet {






// import org.bouncycastle.jce.provider.BouncyCastleProvider;





final int MGAME=3;
PhotonClient photon_client;
int igame_scene=0;
GameScene[] agame_scene;
boolean show_game_over=false;

PFont font;


public void setup(){

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


public void draw(){

	// if(mousePressed) photon_client.sendSomeEvent();

	agame_scene[igame_scene].Update();
	agame_scene[igame_scene].Draw();

	agame_scene[igame_scene].DrawOnGraph(this.g);

	if(show_game_over){
		text("GAME OVER",20,height/2);
	}
	frame.setTitle(String.valueOf(frameRate));
}


public void setGame(int game_index){
	// game_index-=101;
	if(game_index<0 || game_index>MGAME-1) return;
	println("Set Game : "+game_index);
	
	igame_scene=game_index;
	

	agame_scene[igame_scene].Init();

}


public void keyPressed(){
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



class RayLine{
	float x,y,len;
	float z;
	float vel;
	RayLine(float x_,float y_,float len_){
		x=x_; y=y_; len=len_;
		z=-width/2; vel=random(50)+20;
	}
	public void draw(PGraphics pg){
		pg.stroke(255,120);
		pg.line(x,y,z,x,y,z+len);
		update();
	}
	public void update(){
		z+=vel;
		if(z>width*2) z=-width/2;
	}
}

class AGameScene extends GameScene{
	int mhouse=9;
	HashMap<String,House> house_map;

	int mray=100;
	RayLine[] arayline;



	public @Override
	void Init(){
		super.Init();
		
		house_map=new HashMap<String,House>();
		
		arayline=new RayLine[mray];	
		for(int i=0;i<mray;++i) arayline[i]=new RayLine(random(width),random(height),random(10,width/2));

		// for(int i=0;i<mhouse;++i) 
		// 	addNewHouse(UUID.randomUUID().toString(),"name_"+i);
		this.StartGame();

	}

	public @Override
	void Update(){

	}
	
	public @Override
	void Draw(){

		pg.beginDraw();

		pg.background(50);
		
		for(int i=0;i<mray;++i) arayline[i].draw(pg);

		// for(int i=0;i<20;++i) pg.ellipse(random(width),random(height),20,20);
		for(House house:house_map.values()) house.draw(pg);


		pg.endDraw();

	}
	// @Override
	public void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){
		
		println("GameA Got Event: "+event_code.toString());
		switch(event_code){
			case Server_Set_Name:
				addNewHouse((String)params.get((byte)100),(String)params.get((byte)1));
				break;
			case Server_Set_Blow:
				setBlow((String)params.get((byte)100));
				break;
			case Server_LGG:
				println("------The End------");
				break;
			default :
				println("illegal event: "+event_code.toString());
				break;	
		}


	}

	public @Override
	int[] GetScores(){
		return new int[]{98,99};
	}

	public void setRotateLevel(boolean up){
		for(House house:house_map.values()) house.setRotateLevel(up);		
	}

	// String createHouseId(){
	// 	return "a_user_"+UUID.randomUUID();
	// }

	public void addNewHouse(String user_id,String user_name){
		println(" new house: "+user_id+" - "+user_name);
		int i=house_map.size();
		house_map.put(user_id,new House(width/4*(ceil(i/3)+.5f),height/4*(i%3+.5f),user_name));

	}
	public void setBlow(String user_id){
		House house=house_map.get(user_id);
		println("set blow: "+house.user_name);
		house.setBlow();
	}
}

class BGameScene extends GameScene{
	
	EnergyCar[] acar;	
	int iwinner;
	

	public @Override
	void Init(){
		super.Init();
		acar=new EnergyCar[2];
		acar[0]=new EnergyCar(width/4,height/2,0);
		acar[1]=new EnergyCar(width/4*3,height/2,1);
	}

	public @Override
	void Update(){
		if(game_state==GameState.PLAY){

			boolean one_arrive=false;
			for(int i=0;i<2;++i){
				 EnergyCar car=acar[i];
				 car.update();
				 if(car.arriveGoal()){
				 	one_arrive=true;
				 	iwinner=i;
				 }
			}
			if(one_arrive){
				 int[] scores=GetScores();
				 photon_client.sendScoreEvent(scores[0],scores[1]);
				 for(EnergyCar car:acar) car.stopRun();
				 this.EndGame();
			}
		}
	}
	
	public @Override
	void Draw(){

		pg.beginDraw();

		pg.background(255);
		// for(int i=0;i<20;++i) pg.rect(random(width),random(height),20,20);

		for(EnergyCar car:acar) car.draw(pg);

		pg.endDraw();

	}
	public @Override
	void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){

		println("GameB Got Event: "+event_code.toString());
		
		switch(event_code){
			case Server_Game_Start:
				StartGame();
				break;
			case Server_User_Color:
				int car_color=(Integer)params.get((byte)1);
				if(car_color>=0 && car_color<=1) acar[car_color].user_id=(String)params.get((byte)100);
				break;
			case Server_Set_Rotate:
				int car_index=(Integer)params.get((byte)1);
				int car_position=(Integer)params.get((byte)2);
				if(car_index>=0 && car_index<=1) acar[car_index].updatePosition(car_position);
				break;
			case Server_LGG:
				println("------The End------");
				break;
			default :
				println("illegal event: "+event_code.toString());
				break;	
		}

	}

	public @Override
	int[] GetScores(){
		return new int[]{acar[0].getScore(),acar[1].getScore()};
	}

	public @Override
	void StartGame(){
		super.StartGame();
		iwinner=-1;
	
		for(EnergyCar car:acar) car.startRun();

	}
	
}






class CGameScene extends GameScene{
	
	ArrayList<FaceAvatar> afaceavatar;
	
	public @Override
	void Init(){
		super.Init();
		afaceavatar=new ArrayList<FaceAvatar>();

	}

	public @Override
	void Update(){

	}
	
	public @Override
	void Draw(){

		pg.beginDraw();
		drawSquaresBack(pg);
		
		for(FaceAvatar face:afaceavatar) face.draw(pg);

		pg.endDraw();

	}
	public @Override
	void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){
		
		println("GameC Got Event: "+event_code.toString());
		switch(event_code){
			case Server_Set_Face:
				setFace(params);
				break;
			case Server_LGG:
				println("------The End------");
				break;
			default :
				println("illegal event: "+event_code.toString());
				break;	
		}



	}
	public @Override
	int[] GetScores(){
		return new int[]{200,300};
	}


	public void drawSquaresBack(PGraphics pg){
		int noise_scale=240;
		pg.noStroke();
		PVector color_separate=new PVector(1,1,0.1f);
		
		for(int x=0;x<=pg.width;x+=noise_scale)
			for(int y=0;y<=pg.height;y+=noise_scale){
	    		float val=noise(x+random(-1,1),y+random(-1,1));
	    		pg.fill(val*255*color_separate.x,val*255*color_separate.y,val*20*color_separate.z);
	    		pg.rectMode(CENTER);
	    		pg.rect(x,y,noise_scale,noise_scale);
	  		}

	}
	public void setFace(TypedHashMap<Byte,Object> params){

		println("GameC: set face");
		
		String user_id=(String)params.get((byte)100);
		String name=(String)params.get((byte)1);
		String encoded_image=(String)params.get((byte)2);
		int i=(Integer)params.get((byte)3);
		

		final Base64 base64=new Base64();
		byte[] image_bytes=base64.decode(encoded_image);
		String file_name="F://user_"+user_id+".png";
		saveImage(file_name,image_bytes);

		PImage img=loadImage(file_name);
		afaceavatar.add(new FaceAvatar(100*afaceavatar.size(),0,name,img));
	}

	private void saveImage(String image_file_path,byte[] image_byte_array){

		try{

	    	File file=new File(image_file_path);
	    	FileOutputStream fos=new FileOutputStream(file);
	        
	    	System.out.println("save image "+file.getPath());

	        fos.write(image_byte_array,0,image_byte_array.length);
	        fos.flush();
	        fos.close();

    	}catch(Exception e){
    		System.out.println("Save Image Error!\n"+e);
    	}
	
	}
    	

}

class EnergyCar{
	
	float x,y,wid;
	float vel;
	float cur_position=0;
	float dest_vel;
	int tmove=0;

	float MOVE_INTER=25;

	String user_id;
	int color_index;

	boolean start_run=false;
	float run_distance=0;

	float DEST_DIST=100;

	EnergyCar(float x_,float y_,int icolor){
		x=x_; y=y_; 
		wid=120;
		color_index=icolor;
	}
	public void draw(PGraphics pg){
		
		pg.pushStyle();
		
		pg.fill(255*abs(cur_position),120*(1+cur_position),120*(1-(cur_position)),120);
		pg.noStroke();
		pg.pushMatrix();

		if(random(3)<1){
			pg.pushStyle();
			if(color_index==0) pg.fill(255,0,0,150);
			else pg.fill(0,255,0,150);

			pg.rect(color_index*width/2,0,width/2,height);

			pg.popStyle();
		}

		pg.translate(x+cur_position*200,y,0);
			pg.textFont(font, 80);
			pg.text(run_distance,-80,-40);

			pg.rotateY(TWO_PI*sin((float)frameCount/100));
			pg.box(80);
		pg.popMatrix();

		pg.popStyle();


		update();
	
	}
	public void update(){
		if(tmove>0){
			cur_position+=dest_vel;
			// print(cur_position);
			tmove--;
		}
		if(start_run){
			run_distance+=random(-.1f,.5f);
			run_distance=constrain(run_distance,-DEST_DIST,DEST_DIST);
		} 
	}
	public void startRun(){
		start_run=true;
		run_distance=0;
	}
	public void stopRun(){
		start_run=false;
	}
	public void updatePosition(int delta_position){

		println("go "+delta_position);
		if(tmove<=0){
			dest_vel=(delta_position)/MOVE_INTER;
			println(dest_vel);
			tmove=(int)MOVE_INTER;
		}
	}
	public boolean arriveGoal(){
		return run_distance>=DEST_DIST;
	}
	public int getScore(){
		return (int)(run_distance/DEST_DIST*100);
	}

}
class FaceAvatar{
	
	float x,y;
	PImage face_image;
	String user_name;

	FaceAvatar(float x_,float y_,String user_,PImage face_){
		x=x_; y=y_;
		face_image=face_;
		user_name=user_;

	}
	public void draw(PGraphics pg){
		pg.pushMatrix();
		pg.translate(x,y);
			pg.image(face_image,0,0);
			pg.text(user_name,0,0);
		pg.popMatrix();
	}

}
class GameScene{
	
	PGraphics pg;
	GameState game_state;

	GameScene(){
		pg=createGraphics(width,height,P3D);
		
	}
	public void Init(){
		game_state=GameState.WAIT;
		show_game_over=false;
	}
	public void Update(){}
	public void Draw(){}
	public void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){}
	public int[] GetScores(){return null;}

	public void DrawOnGraph(PGraphics back_graph){
		back_graph.image(pg,0,0);
	}
	public void StartGame(){
		game_state=GameState.PLAY;
		
	}
	public void EndGame(){
		game_state=GameState.END;
		show_game_over=true;
	}


}
class House{
	
	final int BLOW_INTERVAL=120;

	String user_name;

	float x,y,wid,hei;
	float vel,phi;
	int fcolor;
	int mlayer;
	PVector[] corners;
	float rotate_level=0;

	int blow_time;

	House(float x_,float y_,String name_){
		
		x=x_; y=y_; user_name=name_;

		wid=random(120,200);
		hei=random(120,240);

		vel=random(50,150);
		phi=random(TWO_PI);

		fcolor=color(random(200,255),random(200,255),random(200,255));
		mlayer=(int)random(5,8);

		float elayer=hei/(float)mlayer;
		corners=new PVector[mlayer*4];
		for(int i=0;i<mlayer;++i){
			corners[i*4]=new PVector(random(-.2f,.2f)*wid,(elayer*i)*random(.2f,1.5f));
			corners[i*4+1]=new PVector(random(.5f,1.5f)*wid,(elayer*i)*random(.3f,1.5f));
			corners[i*4+2]=new PVector(random(.8f,1.5f)*wid,(elayer*(i+1))*random(.5f,1.2f));
			corners[i*4+3]=new PVector(random(-.2f,.2f)*wid,(elayer*(i+1))*random(.2f,1.8f));
		}

	}
	public void draw(PGraphics pg){
		float draw_portion=sin((float)frameCount/vel+phi);

		pg.pushMatrix();
		pg.translate(x+.15f*wid*draw_portion,y+.2f*hei*draw_portion);
		pg.pushStyle();
			pg.text(user_name,10,10);
			for(int i=0;i<mlayer;++i){
				pg.pushMatrix();
				pg.translate(wid/2,0);
				pg.rotateY((float)frameCount/(100*sin((float)i/2))*rotate_level);
				pg.translate(-wid/2,0);

				pg.fill(red(fcolor)*(1+.2f*sin(i)),green(fcolor)*(1+.2f*cos(i)),blue(fcolor),180);
				pg.beginShape();
					pg.vertex(corners[i*4].x,corners[i*4].y);
					pg.vertex(corners[i*4+1].x,corners[i*4+1].y);
					pg.vertex(corners[i*4+2].x,corners[i*4+2].y);
					pg.vertex(corners[i*4+3].x,corners[i*4+3].y);
				pg.endShape(CLOSE);
				pg.popMatrix();
			}

		pg.popStyle();

		pg.popMatrix();

		updateHouse();
	}
	public void setRotateLevel(boolean up){
		if(up) rotate_level+=.1f;
		else rotate_level-=.1f;
	}
	public void setBlow(){
		if(blow_time<=0) blow_time=BLOW_INTERVAL;

	}
	public void updateHouse(){
		if(blow_time>0){
			blow_time--;
			rotate_level=3;
		}else rotate_level=0;

	}
}



public class PhotonClient extends LoadBalancingClient implements Runnable{
	
	static final String LOG_TAG="PhotonClient";
	private int m_eventCount;
    
	public PhotonClient(){
		super();
		
	}
	@Override
	public void run(){
		if(this.connect()){
			println("Start Running!");
			while(true){
				try{
	               this.loadBalancingPeer.service();
	            }catch(Exception e){
                    println("service error: "+e);
                }
				try{
					Thread.sleep(25);
				}catch (InterruptedException e){
					e.printStackTrace();
				}	
			}
		}else{
			println("Connection Fail!");
		}
		
	}
	public boolean connect(){
		this.loadBalancingPeer=new LoadBalancingPeer(this,ConnectionProtocol.Udp);
		if(this.loadBalancingPeer.connect("192.168.2.226:5055", "STPhotonServer")){
			return true;
		}
		return false;
	}
	/**
     * Sends event 1 for testing purposes. Your game would send more useful events.
     */
    public void sendIsLedEvent(){
        HashMap<Object, Object> eventContent = new HashMap<Object, Object>();

        this.loadBalancingPeer.opRaiseEvent((byte)GameEventCode.LJoin.getValue(), eventContent, false, (byte)0);       // this is received by OnEvent()
    }
    public void sendScoreEvent(int score1,int score2){
        HashMap<Object, Object> eventContent = new HashMap<Object, Object>();
        eventContent.put((byte)1, score1);              
        eventContent.put((byte)2, score2);              

        this.loadBalancingPeer.opRaiseEvent((byte)GameEventCode.LScore.getValue(), eventContent, false, (byte)0);       // this is received by OnEvent()
    }
    @Override
    public void onStatusChanged(StatusCode statusCode){
        super.onStatusChanged(statusCode);
        
        println("OnStatusChanged: "+statusCode.name());
        
        switch(statusCode){
            case Connect:
                println("Connect!");
               
                break;
            case Disconnect:
                println("Disconnect!");
                break;
            default:
            	break;
        }
    }
    /**
     * Uses the photonEvent's provided by the server to advance the internal state and call ops as needed.
     * In this demo client, we check for a particular event (1) and count these. After that, we update the view / gui
     * @param eventData
     */
    @Override
    public void onEvent(EventData eventData){
        // super.onEvent(eventData);
        // println("got event!");
        // println(eventData.Code);
        GameEventCode rcv_event=GameEventCode.fromInt(eventData.Code.intValue());
        println("--------------------\nEvent: "+rcv_event.toString()+"  "+millis());


        TypedHashMap<Byte,Object> params=eventData.Parameters;

        if(params!=null){
            for(Entry<Byte,Object> entry:params.entrySet()){
                println(entry.getKey()+" -> "+entry.getValue());
            }
        }else println("No Parmeters!");
         println("--------------------\n");
        
        try{
            switch(rcv_event){
                case Server_LRequest_Score:
                    int[] scores=agame_scene[igame_scene].GetScores();
                    this.sendScoreEvent(scores[0],scores[1]);
                    agame_scene[igame_scene].EndGame();
                    break;
                case Server_Game_Info:
                    setGame((Integer)params.get((byte)1));
                    break;

                default :
                    agame_scene[igame_scene].HandleEvent(rcv_event,params);
                    break;    

            }
            
            // println("--------------------\nEvent: "+(int)eventData.Code+"  "+millis());
            // for(Entry<Byte,Object> entry:params.entrySet()){
            //     println(entry.getKey()+" -> "+entry.getValue());
            // }
              
                
        }catch(Exception e){
            println(e);

        }
       // 
    }


    /**
     * Uses the operationResponse's provided by the server to advance the internal state and call ops as needed.
     * In this client, we also update the form, cause new data might be available to display.
     * @param operationResponse
     */
    @Override
    public void onOperationResponse(OperationResponse operationResponse){
        
        super.onOperationResponse(operationResponse);
        TypedHashMap<Byte,Object> params=operationResponse.Parameters;
        
        GameEventCode rcv_event=GameEventCode.fromInt((int)operationResponse.OperationCode);

        println("--------------------\nOpResponse: "+rcv_event.toString()+"  "+millis());

        switch(rcv_event){
            case Server_Game_Info:
                setGame((Integer)params.get((byte)1));
                sendIsLedEvent();
                break;
            case Server_LConnected:
                println("Connected as LED");
                break;
            case Server_Score_Success:
                println("Set Score Success");
                break;
            default :
                println("--------------------\nUnhandled Operation: "+rcv_event.toString()+"  "+millis());
                for(Entry<Byte,Object> entry:params.entrySet()){
                    println(entry.getKey()+" -> "+entry.getValue());
                }
                break;    
        }
        
    }

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "STPhotonP5Client" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
