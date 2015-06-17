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
import processing.video.*; 
import java.util.UUID; 
import org.apache.commons.codec.binary.Base64; 
import java.io.File; 
import java.nio.file.Files; 
import java.io.FileOutputStream; 
import java.util.Comparator; 
import java.util.Map.Entry; 
import java.util.Timer; 
import java.util.TimerTask; 

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

public class STAppDisplay extends PApplet {






// import org.bouncycastle.jce.provider.BouncyCastleProvider;







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


public void setup(){

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


public void draw(){

	

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


public void setGame(int game_index){
	// game_index-=101;
	if(game_index<0 || game_index>MGAME-1) return;

	println("Set Game : "+game_index);
	
	// if(igame_scene>-1 && game_index!=igame_scene) agame_scene[igame_scene].UnLoad();

	igame_scene=game_index;
	
	if(igame_scene>-1) agame_scene[igame_scene].Init();

}


public void keyPressed(){
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
	HashMap<String,House> left_house_map;
	HashMap<String,House> right_house_map;

	int mray=100;
	RayLine[] arayline;



	public @Override
	void Init(){
		super.Init();
		
		right_house_map=new HashMap<String,House>();
		left_house_map=new HashMap<String,House>();
		
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
	void DrawLeftScreen(PGraphics sub_pg){

		sub_pg.background(50);
		
		for(int i=0;i<mray;++i) arayline[i].draw(sub_pg);

		// for(int i=0;i<20;++i) pg.ellipse(random(width),random(height),20,20);
		for(House house:left_house_map.values()) house.draw(sub_pg);

	}

	public @Override
	void DrawRightScreen(PGraphics sub_pg){
		sub_pg.background(50);
		
		for(int i=0;i<mray;++i) arayline[i].draw(sub_pg);

		// for(int i=0;i<20;++i) pg.ellipse(random(width),random(height),20,20);
		for(House house:right_house_map.values()) house.draw(sub_pg);
	}

	public @Override
	void DrawCenterScreen(PGraphics sub_pg){

		DrawLeftScreen(sub_pg);
	}

	// @Override
	public void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){
		
		println("GameA Got Event: "+event_code.toString());
		switch(event_code){
			case Server_Set_Name:
				addNewHouse((String)params.get((byte)100),(String)params.get((byte)1),(Integer)params.get((byte)101));
				break;
			case Server_Set_Blow:
				setBlow((String)params.get((byte)100),(Integer)params.get((byte)101));
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

	// void setRotateLevel(boolean up){
	// 	for(House house:house_map.values()) house.setRotateLevel(up);		
	// }

	// String createHouseId(){
	// 	return "a_user_"+UUID.randomUUID();
	// }

	public void addNewHouse(String user_id,String user_name,int left_right){
		println(" new house: "+user_id+" - "+user_name);
		int i=-1;
		if(left_right==1){
			i=left_house_map.size();
			left_house_map.put(user_id,new House(width/4*(ceil(i/3)+.5f),height/4*(i%3+.5f),user_name));
		}else if(left_right==0){
			i=right_house_map.size();
			right_house_map.put(user_id,new House(width/4*(ceil(i/3)+.5f),height/4*(i%3+.5f),user_name));
		}
	}
	public void setBlow(String user_id,int left_right){
		House house=null;
		if(left_right==1) house=left_house_map.get(user_id);
		else if(left_right==0) house=right_house_map.get(user_id);

		if(house==null) return;

		println("set blow: "+house.user_name);
		house.setBlow();
	}

}

final float MOTION_VEL=6;
//final PVector MOTION_BOUND=new PVector(1024,400);
final float MOTION_BOUND_X[]={-50,4060};
final float MOTION_BOUND_Y[]={35,400,50,160};

final PVector AVATAR_THRES=new PVector(135,35);
final PVector AVATAR_SIZE=new PVector(80,160);

final float VEL_CONTROL=.25f;

final float GIRAFFE_SPAN=240;

class AvatarMotion{
	
	float vel_control=VEL_CONTROL;

	PVector pos,land_pos;
	PVector vel,acc;
	float mscale,depth_scale;
	float scale_vel=.01f;

	AvatarAction istage;
	ImageSeq img_seq;

	SpeakBubble speak_bubble;
	float action_delay=0;

	boolean is_intersecting=false;
	
	float bridge_vel=0;

	boolean is_giraffe=false;
	float giraffe_dest;

	AvatarMotion(BuildBlock[] arr_block){
		PVector _pos=getRandomBornPlace();
		int mrand=0;
		while(mrand<12 && regionIntersect(_pos,arr_block)){
			_pos=getRandomBornPlace();
			mrand++;
		}
		setup(_pos);
	}
	public PVector getRandomBornPlace(){
		float _posx=random(200,824);
		float _posy=random(120,300);
		if(random(2)<1) _posx+=Right_Screen_X;

		return new PVector(_posx,_posy);		
	}
	public boolean regionIntersect(PVector _pos,BuildBlock[] arr_block){
		
		if(arr_block==null) return false;

		for(BuildBlock bb:arr_block){
			// if(abs(bb.pos.x-_pos.x)<bb.sizee.x/2 || abs(bb.pos.y-_pos.y)<bb.sizee.y/2){
			// 	return true;
			// }
			if(regionIntersect(_pos,bb,false)) return true;
		}
		return false;
	}
	public boolean regionIntersect(PVector _pos,BuildBlock bb,boolean feet_only){

		//if(bb==null) return false;
		if(feet_only)
			return !(bb.pos.x+bb.sizee.x<_pos.x-AVATAR_SIZE.x/2*depth_scale || bb.pos.x>_pos.x+AVATAR_SIZE.x/2*depth_scale || 
					bb.pos.y+bb.sizee.y<_pos.y+AVATAR_SIZE.y/4*depth_scale || bb.pos.y>_pos.y+AVATAR_SIZE.y/2*depth_scale );
		else
			return !(bb.pos.x+bb.sizee.x<_pos.x-AVATAR_SIZE.x/2*depth_scale || bb.pos.x>_pos.x+AVATAR_SIZE.x/2*depth_scale || 
					bb.pos.y+bb.sizee.y<_pos.y-AVATAR_SIZE.y/2*depth_scale || bb.pos.y>_pos.y+AVATAR_SIZE.y/2*depth_scale );
	}

	AvatarMotion(PVector _pos){
		setup(_pos);
	}
	public void setup(PVector _pos){
		pos=_pos.get();
		land_pos=pos.get();
		vel=new PVector(MOTION_VEL,0);
		vel.rotate(random(TWO_PI));

		acc=new PVector(0,0);

		istage=AvatarAction.BORN;
		mscale=0;
		depth_scale=1;

		img_seq=new ImageSeq(6);
		img_seq.play();

		action_delay=0;
		speak_bubble=new SpeakBubble((int)random(10));

	}
	public void update(ArrayList<AvatarMotion> arr_motion,BuildBlock[] arr_block){
		switch(istage){
			case BORN: // landing
				
				if(mscale<1) mscale+=DRAW_DOOR?scale_vel:scale_vel*5;
				else{
					mscale=1;
					istage=AvatarAction.WALK;	
				} 
				break;

			case WALK: // walking
				
				if(arr_motion!=null) detectAvatarCollision(arr_motion);
				if(arr_block!=null) detectBuildBlockCollision(arr_block);
				
				detectBoundary();
				detectBridge();
				updatePos();
				
				updateScale();
				if(arr_motion!=null && arr_block!=null) detectTalking(arr_motion,arr_block);

				if(isInRange() && random(250)<1 && action_delay==0){
					istage=AvatarAction.PAUSE;
					action_delay=90+random(60);
					// img_seq.pause();
				}
				break;
			case PAUSE:
				if(action_delay<=0){
					istage=AvatarAction.WALK;
					resetVel();
					// img_seq.resume();
				}
				if(arr_motion!=null && arr_block!=null) detectTalking(arr_motion,arr_block);

				break;
			case TALK: //talking
				if(speak_bubble.isFinished()){
					istage=AvatarAction.WALK;
					action_delay=60+random(60);
					speak_bubble.Reset();
					resetVel();					
				}
				speak_bubble.update();
				break;
			case BRIDGE:
				
				if(arr_motion!=null) detectAvatarCollision(arr_motion);
				detectBoundary();
				acc.add(bridge_vel,0,0);
				updatePos();
				updateScale();

				detectBridge();
				break;
			case LEAVE: // go out
				if(arr_motion!=null) detectCollision(arr_motion,arr_block);
				vel.y=MOTION_VEL;
				updatePos();

				if(pos.y>MOTION_BOUND_Y[1]+200) istage=AvatarAction.DEAD;
				break;

			case DEAD: //dead
				break;
		}

		img_seq.update();
		

		if(action_delay>0){
			action_delay--;
			if(is_giraffe && action_delay==GIRAFFE_SPAN/2) giraffe_dest=pos.x;

		}else is_giraffe=false;
		//if(random(50)<1) speak_bubble.setIndex((int)random(10));


	}
	public void resetVel(){
		vel.setMag(MOTION_VEL);
		vel.rotate(random(TWO_PI));
		vel_control=(random(3)<1)?(random(2)<1?VEL_CONTROL*.75f:VEL_CONTROL*1.25f):VEL_CONTROL;
	}
	public void updatePos(){

		vel.add(acc);
		vel.limit(MOTION_VEL);

		pos.add(vel.x*vel_control,vel.y*vel_control,0);
		acc.mult(0);
	}

	//boolean setPaused(boolean set_pause,boolean trigger_speak){
	public void startTalking(int tindex,boolean isbuild){
		
		if(isbuild) speak_bubble.setIndex(tindex);
		else speak_bubble.setIndex(tindex);
		istage=AvatarAction.TALK;

	}
	public boolean readyToTalk(){
		
		if(action_delay>0) return false;
		if(istage!=AvatarAction.WALK && istage!=AvatarAction.PAUSE) return false;
		
		return true;
	}
	public void detectCollision(ArrayList<AvatarMotion> arr_motion,BuildBlock[] arr_block){
		detectAvatarCollision(arr_motion);
		detectBuildBlockCollision(arr_block);
	}

	public void detectAvatarCollision(ArrayList<AvatarMotion> arr_motion){
		


		PVector seperate_acc=new PVector(0,0);
		PVector align_acc=new PVector(0,0);
		PVector cohesion_acc=new PVector(0,0);
		
		int mneighbor=0;
		
		for(AvatarMotion _motion:arr_motion){

			float dist_mag=PVector.dist(_motion.pos,pos);
			if(dist_mag<AVATAR_SIZE.mag()*.8f){

				mneighbor++;

				// seperate
				PVector tmp_acc=PVector.sub(pos,_motion.pos);
				// tmp_acc.normalize();
				// tmp_acc.setMag(.55);
				// if(istage==AvatarAction.BRIDGE) tmp_acc.setMag(.1);

				if(action_delay<=0) tmp_acc.setMag(8/dist_mag);
				else tmp_acc.setMag(6/dist_mag);

				if(istage==AvatarAction.BRIDGE) tmp_acc.setMag(1/dist_mag);
				seperate_acc.add(tmp_acc);


				if(istage==AvatarAction.BRIDGE) continue;

				// cohesion
				PVector a_tmp=PVector.sub(_motion.pos,pos);
				a_tmp.normalize();
				cohesion_acc.add(a_tmp);

				// align
				align_acc.add(_motion.vel);

				
				
			}
			
		} 
		if(mneighbor<=0) return;

		// seperate_acc.div(mneighbor);
		// seperate_acc.normalize();
		// seperate_acc.mult(.75);

		cohesion_acc.div(mneighbor);
		cohesion_acc.mult(.01f);

		align_acc.div(mneighbor);
		align_acc.mult(.01f);

		// println(seperate_acc);

		acc.add(seperate_acc);
		acc.add(cohesion_acc);
		acc.add(align_acc);

	}
	public void detectBuildBlockCollision(BuildBlock[] arr_block){

		PVector turn_acc=new PVector(0,0);
		is_intersecting=false;
		for(BuildBlock _block:arr_block){

			
			// float dist_x=abs(_block.pos.x-pos.x);
			// float dist_y=abs(_block.pos.y-pos.y);

			//if(dist_x<(_block.sizee.x/2+AVATAR_SIZE.x/3) && dist_y<(_block.sizee.y/2+AVATAR_SIZE.y/2)){
			if(regionIntersect(pos,_block,true)){

				// float overlap_area=(min(_block.pos.x+_block.sizee.x,pos.x+AVATAR_SIZE.x/2*depth_scale)-max(_block.pos.x,pos.x-AVATAR_SIZE.x/2*depth_scale))
				// 					*(min(_block.pos.y+_block.sizee.y,pos.y+AVATAR_SIZE.y/2*depth_scale)-max(_block.pos.y,pos.y-AVATAR_SIZE.y/2*depth_scale));
				// float overlap_x=(min(_block.pos.x+_block.sizee.x,pos.x+AVATAR_SIZE.x/2*depth_scale)+max(_block.pos.x,pos.x-AVATAR_SIZE.x/2*depth_scale))/2;
				// float overlap_y=(min(_block.pos.y+_block.sizee.y,pos.y+AVATAR_SIZE.y/2*depth_scale)-max(_block.pos.y,pos.y-AVATAR_SIZE.y/2*depth_scale))/2;
				PVector tmp_acc=new PVector((pos.x-_block.pos.x),pos.y-_block.pos.y);
				
				// tmp_acc.setMag(overlap_area);
				// tmp_acc.mult(1/19000.0f/20.0f);
				tmp_acc.setMag(2);
				//println("build block mag= "+tmp_acc.mag());
				turn_acc.add(tmp_acc);
				is_intersecting=true;		
			}

		}

		acc.add(turn_acc);
		// if(turn_vel.mag()>.2){
		// 	//turn_vel.setMag(MOTION_VEL);	
		// 	vel.add(turn_acc);
		// 	vel.setMag(MOTION_VEL);
		// }
		
	}
	public boolean goBridge(){
		if(istage==AvatarAction.WALK){
			if(pos.x<Left_Screen_X){
				bridge_vel=1;
				istage=AvatarAction.BRIDGE;
				return true;
			}
			if(pos.x>Right_Screen_X){
				bridge_vel=-1;
				istage=AvatarAction.BRIDGE;
				return true;
			}
		}
		return false;

	}
	public void detectBridge(){

		//if(action_delay>0) return;

		if(istage==AvatarAction.WALK){
			// catch those already on the bridge
			if(pos.x>Left_Screen_X && pos.x<Right_Screen_X){
				bridge_vel=random(2)>1?1:-1;
				istage=AvatarAction.BRIDGE;
				return;
			}
			// if is near the bridge region
			if(regionIntersect(pos,arr_bridge_block[0],false)){
				if(action_delay>0){
					acc.add(-2,0,0);
					return;	
				} 
				bridge_vel=1;
				istage=AvatarAction.BRIDGE;
				return;
			}
			if(regionIntersect(pos,arr_bridge_block[1],false)){
				if(action_delay>0){
					acc.add(2,0,0);
					return;	
				} 
				bridge_vel=-1;
				istage=AvatarAction.BRIDGE;
				
				return;

				
			}
		}
		if(istage==AvatarAction.BRIDGE){
			if(bridge_vel>0 && pos.x>Right_Screen_X+AVATAR_SIZE.x){
				istage=AvatarAction.WALK;
				bridge_vel=0;	
				action_delay=350;
			} 
			if(bridge_vel<0 && pos.x<Left_Screen_X-AVATAR_SIZE.x){
				istage=AvatarAction.WALK;
				bridge_vel=0;	
				action_delay=350;
			} 
		}
	}



	public void detectTalking(ArrayList<AvatarMotion> arr_motion,BuildBlock[] arr_block){

		if(istage!=AvatarAction.WALK && istage!=AvatarAction.PAUSE) return;

		for(BuildBlock _block:arr_block){
			
			float mag_dist=PVector.dist(_block.pos,pos);

			float y_dist=abs(_block.pos.y-pos.y);
			if(y_dist>AVATAR_THRES.y) continue;

			float x_dist=abs(_block.pos.x-pos.x);
			if(mag_dist<AVATAR_THRES.mag()){//if(x_dist<AVATAR_THRES.x){
				if(_block.to_talk && this.readyToTalk()){
					// this.startTalking(true);
					// return;
				}
			} 
		}

		for(AvatarMotion _motion:arr_motion){

			//if(_motion.istage!=AvatarAction.WALK) continue;
			float mag_dist=PVector.dist(_motion.pos,pos);

			float y_dist=abs(_motion.pos.y-pos.y);
			// print(" y dist= "+y_dist);
			if(y_dist>AVATAR_THRES.y) continue;

			float x_dist=abs(_motion.pos.x-pos.x);
			// println(" x dist= "+x_dist);

			if(mag_dist<AVATAR_THRES.x && mag_dist>AVATAR_SIZE.x*.8f){//if(x_dist<AVATAR_THRES.x){
				if(_motion.readyToTalk() && this.readyToTalk() ){
					int tindex=(int)random(2)*5;
					_motion.startTalking(tindex+(int)random(5),false);
					this.startTalking(tindex+(int)random(5),false);
					return;
				}
			} 
			
		} 
		
	}
	public void detectBoundary(){
		PVector turn_acc=new PVector(0,0);
		if(pos.x+AVATAR_SIZE.x/2>MOTION_BOUND_X[1]){
			acc.mult(0);
			acc.add(-5,0,0);	
			action_delay=520;
		} 
		if(pos.x-AVATAR_SIZE.x/2<MOTION_BOUND_X[0]){
			acc.mult(0);
			acc.add(5,0,0);	

			if(GIRRAFE && !is_giraffe && random(5)<1){
				action_delay=GIRAFFE_SPAN;
				is_giraffe=true;
			}
		} 
		
		if(pos.x<Left_Screen_X){
			if(pos.y+AVATAR_SIZE.y/2*depth_scale>MOTION_BOUND_Y[1]) turn_acc.y-=1.5f;
			if(pos.y-AVATAR_SIZE.y/2*depth_scale<MOTION_BOUND_Y[0]) turn_acc.y+=1.5f;
		}else if(pos.x<Right_Screen_X){
			if(pos.y+AVATAR_SIZE.y/2*depth_scale>MOTION_BOUND_Y[3]) turn_acc.y-=1.5f;
			if(pos.y-AVATAR_SIZE.y/2*depth_scale<MOTION_BOUND_Y[2]) turn_acc.y+=1.5f;
		
		}else{
			if(pos.y+AVATAR_SIZE.y/2*depth_scale>MOTION_BOUND_Y[1]) turn_acc.y-=1.5f;
			if(pos.y-AVATAR_SIZE.y/2*depth_scale<MOTION_BOUND_Y[0]) turn_acc.y+=1.5f;
		
		}
		
		//if(turn_acc.mag()>0) action_delay=120;
		acc.add(turn_acc);
		  
		

	}
	public boolean isInRange(){
		return pos.x>MOTION_BOUND_X[0] && pos.x<MOTION_BOUND_X[1]
				&& pos.y>MOTION_BOUND_Y[0] && pos.y<MOTION_BOUND_Y[1];
	}

	public void startGoOut(){

		if(istage!=AvatarAction.WALK) return;

		istage=AvatarAction.LEAVE;
		vel=new PVector(0,MOTION_VEL*1.5f);
	}

	public void drawDebugRegion(PGraphics pg){
		pg.pushStyle();
		pg.noFill();
		if(istage==AvatarAction.DEAD) pg.fill(0);

		if(action_delay>0){
			pg.stroke(0);
			pg.strokeWeight(4);
			pg.rect(pos.x-AVATAR_SIZE.x/2*depth_scale,pos.y-AVATAR_SIZE.y/2*depth_scale,AVATAR_SIZE.x*depth_scale,AVATAR_SIZE.y*depth_scale);
		}

		pg.strokeWeight(1);
		if(istage==AvatarAction.BRIDGE) pg.stroke(0,0,255);
		else{
			if(is_intersecting) pg.stroke(255,255,0);
			else pg.stroke(0,255,0);
		}
		pg.rect(pos.x-AVATAR_SIZE.x/2*depth_scale,pos.y-AVATAR_SIZE.y/2*depth_scale,AVATAR_SIZE.x*depth_scale,AVATAR_SIZE.y*depth_scale);
		pg.rect(pos.x-AVATAR_SIZE.x/2*depth_scale,pos.y+AVATAR_SIZE.y/4*depth_scale,AVATAR_SIZE.x*depth_scale,AVATAR_SIZE.y/4*depth_scale);


		pg.popStyle();
	}

	public void updateScale(){
		switch(istage){
			case WALK:
				//if(depth_scale<1) depth_scale+=.02;
				depth_scale=getDepthScale();
				break;
			case BRIDGE:
				//if(depth_scale>.7) depth_scale-=.02;
				depth_scale=getDepthScale();
				break;
		}
	}
	public float getDepthScale(){
		if(pos.y>300) return 1;
		return sin((pos.y)/300*HALF_PI)*.3f+.7f;
	}
}

final int ITRANSCAR=8;
final float[] ROAD_LINE={240,795};

class BGameScene extends GameScene{

	final String DataFolder="GAME_B/";
	

	EnergyCar[] arr_car;	
	int iwinner;
	int mcur_player=0;

	Movie mov_back_center,mov_back_side;

	AlphaMovie mov_road_loop;
	
	AlphaMovie mov_road_left,mov_road_right;
	PImage[] arr_img_city;


	ArrayList<ArrayList<PImage>> arr_img_car;
	ArrayList<ArrayList<PImage>> arr_img_effect;
	PImage[] arr_img_origin_car;

	ArrayList<PImage> arr_img_icon;
	ArrayList<PImage> arr_img_icontext;

	PImage[] arr_mapcar_img;
	PImage[] arr_map_img;
	PImage[] arr_img_fighting;

	IconLine[] arr_icon_line;

	Timer timer_sleep;

	BGameScene(){
		super();
		arr_car=new EnergyCar[2];
		arr_car[0]=new EnergyCar(512,200,0);
		arr_car[1]=new EnergyCar(512,200,1);
	}

	public @Override
	void loadFiles(){

		arr_img_car=new ArrayList<ArrayList<PImage>>();
		for(int i=0;i<ITRANSCAR;++i){
			arr_img_car.add(new ArrayList<PImage>());
			for(int x=0;x<59;++x){
				String _fn=DataFolder+"TRANSCAR/car"+nf(i+1,2)+"_/car/car"+nf(i+1,2)+"_"+nf(x,5)+".png";
				PImage _img=loadImage(_fn);
				(arr_img_car.get(i)).add(_img);
				println(_fn);
			}
		}

		arr_img_effect=new ArrayList<ArrayList<PImage>>();
		for(int i=0;i<ITRANSCAR;++i){
			arr_img_effect.add(new ArrayList<PImage>());
			for(int x=0;x<59;++x){
				String _fn=DataFolder+"TRANSCAR/car"+nf(i+1,2)+"_/effect/car"+nf(i+1,2)+"_effect_"+nf(x,5)+".png";
				PImage _img=loadImage(_fn);
				(arr_img_effect.get(i)).add(_img);
				println(_fn);
			}
		}


		
		arr_img_icon=new ArrayList<PImage>();
		for(int i=0;i<ITRANSCAR;++i){
			PImage _img=loadImage(DataFolder+"TRANSICON/icon-"+nf(i+1,2)+".png");
			arr_img_icon.add(_img);
		}

		arr_img_icontext=new ArrayList<PImage>();
		for(int i=0;i<ITRANSCAR;++i){
			PImage _img=loadImage(DataFolder+"ICONTEXT/icontext-"+nf(i+1,2)+".png");
			arr_img_icontext.add(_img);	
		}

		arr_img_origin_car=new PImage[4];
		arr_img_origin_car[0]=loadImage(DataFolder+"car00_blue.png");
		arr_img_origin_car[1]=loadImage(DataFolder+"car00_red.png");
		arr_img_origin_car[2]=loadImage(DataFolder+"other_1.png");
		arr_img_origin_car[3]=loadImage(DataFolder+"other_2.png");


		arr_mapcar_img=new PImage[3];
		arr_mapcar_img[0]=loadImage(DataFolder+"map_car_blue.png");
		arr_mapcar_img[1]=loadImage(DataFolder+"map_car_red.png");
		arr_mapcar_img[2]=loadImage(DataFolder+"map_car_blue_right.png");


		arr_map_img=new PImage[2];
		arr_map_img[0]=loadImage(DataFolder+"map_blue.png");
		arr_map_img[1]=loadImage(DataFolder+"map_red.png");

		mov_back_center=new Movie(gapplet,DataFolder+"BACK/BACK_CENTER.mov");
		mov_back_side=new Movie(gapplet,DataFolder+"BACK/BACK_SIDE.mov");

		mov_road_left=new AlphaMovie(gapplet,DataFolder+"BACK/raceScene_sign.mov");
		mov_road_right=new AlphaMovie(gapplet,DataFolder+"BACK/raceScene_sign.mov");

		mov_road_loop=new AlphaMovie(gapplet,DataFolder+"BACK/raceScene_empty.mov");

		arr_img_city=new PImage[2];
		arr_img_city[0]=loadImage(DataFolder+"BACK/city_01.png");
		arr_img_city[1]=loadImage(DataFolder+"BACK/city_02.png");

		arr_img_fighting=new PImage[2];
		arr_img_fighting[0]=loadImage(DataFolder+"Fighting_yellow.png");
		arr_img_fighting[1]=loadImage(DataFolder+"Fighting_red.png");

		
		

		arr_icon_line=new IconLine[6];
		arr_icon_line[0]=new IconLine((int)random(ITRANSCAR),-1);
		arr_icon_line[1]=new IconLine((int)random(ITRANSCAR),0);
		arr_icon_line[2]=new IconLine((int)random(ITRANSCAR),1);
		arr_icon_line[3]=new IconLine((int)random(ITRANSCAR),-1);
		arr_icon_line[4]=new IconLine((int)random(ITRANSCAR),0);
		arr_icon_line[5]=new IconLine((int)random(ITRANSCAR),1);
		

	}
	public @Override
	void Init(){

		super.Init();
		
		println("--------- Game B Init ---------");
		


		mov_back_center.loop();
		mov_back_side.loop();

		mov_road_loop.loop();

		// CAR_DEST_DIST=mov_road_left.duration();

		for(int i=0;i<2;++i) arr_car[i].reset();
	}


	public @Override
	void Update(){

		

		for(int i=0;i<2;++i){
			EnergyCar car=arr_car[i];
			int cur_frame=car.getCurFrame();
			PImage cur_img=(car.cur_icar<0 || car.cur_icar>=ITRANSCAR)?arr_img_origin_car[i]:arr_img_car.get(car.cur_icar).get(cur_frame);
			PImage dest_img=(car.dest_icar<0 || car.dest_icar>=ITRANSCAR)?arr_img_origin_car[i]:arr_img_car.get(car.dest_icar).get(cur_frame);			

			int cur_eframe=car.getCurEffectFrame();
			PImage dest_effect=(car.dest_icar<0 || car.dest_icar>=ITRANSCAR)?null:arr_img_effect.get(car.dest_icar).get(cur_eframe);			
			
			car.update(cur_img,dest_img,dest_effect);

		}
		

		if(game_state==GameState.WAIT){
			for(int i=0;i<2;++i){
				if(random(30)<1){
					arr_car[i].updatePosition((int)random(-2,2));
				}
			}
			mov_road_loop.read();

		}else if(game_state==GameState.PLAY){

			if(mcur_player==1){
				if(random(50)<1) arr_car[1].updatePosition((int)random(-2,2));
			}


			for(IconLine icon:arr_icon_line) icon.update();

			for(int i=0;i<3;++i){
				IconLine _icon=arr_icon_line[i];
				if(_icon.isReached() && !_icon.is_explode){
					
					if(abs(_icon.pos_x-arr_car[0].getCurPosition())<.1f){
						PImage _icontext=(_icon.icon_index<ITRANSCAR)?arr_img_icontext.get(_icon.icon_index):null;
						arr_car[0].changeCar(_icon.icon_index,_icontext);
						_icon.startExplode(_icontext);								
					} 
				}
			}

			for(int i=3;i<6;++i){
				IconLine _icon=arr_icon_line[i];
				if(_icon.isReached() && !_icon.is_explode){
					//println("icon "+i+" reached!  "+_icon.pos_x+"  "+arr_car[0].getCurPosition());
					if(abs(_icon.pos_x-arr_car[1].getCurPosition())<.1f){
						PImage _icontext=(_icon.icon_index<ITRANSCAR)?arr_img_icontext.get(_icon.icon_index):null;
						arr_car[1].changeCar(_icon.icon_index,_icontext);
						_icon.startExplode(_icontext);								
					} 
				}
			}

			mov_road_left.speed(arr_car[0].getCurVel());
			mov_road_right.speed(arr_car[1].getCurVel());

			
			arr_car[0].run_distance=mov_road_left.time();
			arr_car[1].run_distance=mov_road_right.time();
			// println(arr_car[0].run_distance+"  "+arr_car[1].run_distance);

		

			boolean one_arrive=false;
			for(int i=0;i<2;++i){
				 EnergyCar car=arr_car[i];
				 //car.update();
				 if(car.arriveGoal()){
				 	one_arrive=true;
				 	iwinner=i;
				 	break;
				 }
			}
			if(one_arrive){
				 println("ARRIVE!!");
				 int[] scores=GetScores();
				 if(!OFFLINE) photon_client.sendScoreEvent(scores[0],scores[1]);
				 endRound();
			}
		}else{
			
		}

		mov_back_center.read();
		mov_back_side.read();

		mov_road_left.read();
		mov_road_right.read();

	
	}
	
	
	public @Override
	void DrawLeftScreen(PGraphics sub_pg){
		// hint(DISABLE_DEPTH_TEST);
		sub_pg.hint(DISABLE_DEPTH_TEST);
		//sub_pg.background(255);
		
		sub_pg.image(mov_back_side,0,0);
		
		if(game_state==GameState.WAIT) sub_pg.image(mov_road_loop,0,0);	
		else sub_pg.image(mov_road_left,0,0);
		
		arr_car[0].draw(sub_pg);


		if(game_state!=GameState.PLAY) return;

		for(int i=0;i<3;++i){
			int _index=arr_icon_line[i].icon_index;
			PImage _icon=(_index>ITRANSCAR-1)?arr_img_origin_car[_index-ITRANSCAR+2]:arr_img_icon.get(_index);
			
			arr_icon_line[i].draw(sub_pg,_icon);	
		} 
			
	}

	public @Override
	void DrawRightScreen(PGraphics sub_pg){

		sub_pg.hint(DISABLE_DEPTH_TEST);
		//sub_pg.background(255);
		sub_pg.image(mov_back_side,0,0);
		
		if(game_state==GameState.WAIT){
			sub_pg.image(mov_road_loop,0,0);		
			arr_car[1].draw(sub_pg);			

		}else{
			// if(mcur_player==2){
				sub_pg.image(mov_road_right,0,0);
				arr_car[1].draw(sub_pg);
		
				if(game_state!=GameState.PLAY) return;


				for(int i=3;i<6;++i){
					int _index=arr_icon_line[i].icon_index;
					PImage _icon=(_index>ITRANSCAR-1)?arr_img_origin_car[_index-ITRANSCAR+2]:arr_img_icon.get(_index);
					
					arr_icon_line[i].draw(sub_pg,_icon);		
				}	
			// }else{
			// 	DrawLeftScreen(sub_pg);
			// }
		} 
		

		
		 
		
	}

	public @Override
	void DrawCenterScreen(PGraphics sub_pg){
		sub_pg.background(255);
		sub_pg.image(mov_back_center,0,0);
		
		if(game_state==GameState.WAIT){
			
			sub_pg.pushMatrix();
			sub_pg.translate(80,88);
				sub_pg.pushStyle();
				sub_pg.rectMode(CENTER);
				sub_pg.noStroke();
				sub_pg.fill(255,120);
				sub_pg.rect(0,0,120,120,16);
				sub_pg.popStyle();
			sub_pg.popMatrix();

			sub_pg.pushMatrix();
			sub_pg.translate(160,50);
				sub_pg.image(arr_map_img[0],0,0);
			sub_pg.popMatrix();

			sub_pg.pushMatrix();
				sub_pg.image(arr_img_fighting[0],1016-336,88-35);
			sub_pg.popMatrix();
			
			sub_pg.pushMatrix();
			sub_pg.translate(1952,88);
				sub_pg.pushStyle();
				sub_pg.rectMode(CENTER);
				sub_pg.noStroke();
				sub_pg.fill(255,120);
					sub_pg.rect(0,0,120,120,16);
				sub_pg.popStyle();
			sub_pg.popMatrix();

			sub_pg.pushMatrix();
			sub_pg.translate(2032-160,50);
				sub_pg.image(arr_map_img[1],-arr_map_img[1].width,0);
			sub_pg.popMatrix();				

			return;
		}

		sub_pg.pushMatrix();
		sub_pg.translate(80,88);
			sub_pg.pushStyle();
			sub_pg.rectMode(CENTER);
			sub_pg.noStroke();
			sub_pg.fill(255,120);
			sub_pg.rect(0,0,120,120,16);
			sub_pg.popStyle();
			PImage cur_icon=(arr_car[0].cur_icar<0 || arr_car[0].cur_icar>=ITRANSCAR)?null:arr_img_icon.get(arr_car[0].cur_icar);
			PImage dest_icon=(arr_car[0].dest_icar<0 || arr_car[0].dest_icar>=ITRANSCAR)?null:arr_img_icon.get(arr_car[0].dest_icar);
			arr_car[0].drawIcon(sub_pg,cur_icon,dest_icon);
		sub_pg.popMatrix();

		sub_pg.pushMatrix();
		sub_pg.translate(160,50);
			sub_pg.image(arr_map_img[0],0,0);
				// float left_pos=arr_car[0].run_distance;
	
			float left_pos=arr_car[0].run_distance/CAR_DEST_DIST;
			sub_pg.pushStyle();
			sub_pg.imageMode(CENTER);
			sub_pg.translate(30+left_pos*387,0);
				sub_pg.image(arr_mapcar_img[0],0,76);
			sub_pg.popStyle();
	
		sub_pg.popMatrix();

		sub_pg.pushMatrix();
			sub_pg.image(arr_img_fighting[0],1016-336,88-35);
		sub_pg.popMatrix();
		
		sub_pg.pushMatrix();
		sub_pg.translate(1952,88);
			sub_pg.pushStyle();
			sub_pg.rectMode(CENTER);
			sub_pg.noStroke();
			sub_pg.fill(255,120);
				sub_pg.rect(0,0,120,120,16);
			sub_pg.popStyle();
			// if(mcur_player==2){
				PImage rcur_icon=(arr_car[1].cur_icar<0 || arr_car[1].cur_icar>=ITRANSCAR)?null:arr_img_icon.get(arr_car[1].cur_icar);
				PImage rdest_icon=(arr_car[1].dest_icar<0 || arr_car[1].dest_icar>=ITRANSCAR)?null:arr_img_icon.get(arr_car[1].dest_icar);
				arr_car[1].drawIcon(sub_pg,rcur_icon,rdest_icon);				
			// } else if(mcur_player==1){
			// 	arr_car[0].drawIcon(sub_pg,cur_icon,dest_icon);
			// }			
		sub_pg.popMatrix();

		sub_pg.pushMatrix();
		sub_pg.translate(2032-160,50);
			sub_pg.image(arr_map_img[1],-arr_map_img[1].width,0);

			// float right_pos=arr_car[1].run_distance;
			float right_pos=0;
			// if(mcur_player==2){
				right_pos=arr_car[1].run_distance/CAR_DEST_DIST;				
			// }else if(mcur_player==1){
			// 	right_pos=left_pos;
			// }
			sub_pg.pushStyle();
				sub_pg.imageMode(CENTER);
				sub_pg.translate(-30-right_pos*387,0);
				// if(mcur_player==2) 
					sub_pg.image(arr_mapcar_img[1],0,76);
				// else if(mcur_player==1) sub_pg.image(arr_mapcar_img[2],0,76);
			sub_pg.popStyle();
		sub_pg.popMatrix();
	}



	public @Override
	void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){

		println("GameB Got Event: "+event_code.toString());
		
		switch(event_code){
			case Server_Game_Start:
				mcur_player=(Integer)params.get((byte)201);
				arr_car[0].user_id=(String)params.get((byte)100);
				if(mcur_player==2) arr_car[1].user_id=(String)params.get((byte)200);
				StartGame();
				break;
			// case Server_User_Color:
			// 	int car_color=(Integer)params.get((byte)1);
			// 	if(car_color>=0 && car_color<=1) arr_car[car_color].user_id=(String)params.get((byte)100);
			// 	break;
			case Server_Set_Rotate:
				if(game_state==GameState.PLAY){
					int car_index=(Integer)params.get((byte)101);
					int car_position=(Integer)params.get((byte)1);
					if(car_index==0 || car_index==1) arr_car[car_index].updatePosition(car_position);
				}
				break;
			case Server_Score_Success:

				break;
			case Server_LGG:
				println("------The End------");
				this.EndGame();
				break;
			default :
				println("Illegal event: "+event_code.toString());
				break;	
		}

	}

	public @Override
	int[] GetScores(){
		return new int[]{arr_car[0].getScore(),arr_car[1].getScore()};
	}

	public @Override
	void StartGame(){

		if(timer_sleep!=null){
			timer_sleep.cancel();
			timer_sleep=null;
			// this.Init();
		}

		
		super.StartGame();
		iwinner=-1;
		
		for(int i=0;i<mcur_player;++i) arr_car[i].startRun();
		for(IconLine icon:arr_icon_line) icon.restart();

	
		mov_road_right.play();
		mov_road_right.jump(0);
		
		mov_road_left.play();		
		mov_road_left.jump(0);

		// CAR_DEST_DIST=mov_road_left.duration();
		println("CAR_DEST_DIST= "+CAR_DEST_DIST);

		mov_road_loop.stop();
	}

	public void endRound(){

		println("----- End Round -----");
		mov_road_left.pause();
		mov_road_right.pause();

		
		for(EnergyCar car:arr_car) car.stopRun();
		for(IconLine icon:arr_icon_line) icon.pause();

		if(!OFFLINE) photon_client.sendScoreEvent(arr_car[0].getScore(),arr_car[1].getScore());

		super.EndGame();

		timer_sleep=new Timer();
        TimerTask task=new TimerTask(){
            @Override
            public void run(){
                Init();
            }
        };
        timer_sleep.schedule(task, 5000);
		// this.Init();
	}

	public @Override
	void EndGame(){
		super.EndGame();

		mov_back_side.stop();
		mov_back_center.stop();

		mov_road_left.stop();
		mov_road_right.stop();

		mov_road_loop.stop();
	}
	public @Override
	void unloadFiles(){

		arr_img_car.clear();

		arr_img_effect.clear();

		
		arr_img_icon.clear();

		arr_img_icontext.clear();

		arr_img_origin_car=null;

		arr_mapcar_img=null;
		arr_map_img=null;

		mov_back_center=null;
		mov_back_side=null;

		mov_road_left=null;
		mov_road_right=null;

		mov_road_loop=null;

		arr_img_city=null;
		arr_img_fighting=null;
		

		arr_icon_line=null;
		
	}
}
class BuildBlock{
	PVector pos;
	PVector sizee;
	boolean to_talk;
	
	BuildBlock(float x,float y,float wid,float hei){
		init(new PVector(x,y),new PVector(wid,hei),false);
	}
	BuildBlock(float x,float y,float wid,float hei,boolean set_talk){
		init(new PVector(x,y),new PVector(wid,hei),set_talk);
	}
	BuildBlock(PVector set_pos,PVector set_size,boolean set_talk){
		init(set_pos,set_size,set_talk);
	}
	public void init(PVector set_pos,PVector set_size,boolean set_talk){
		pos=set_pos.get();
		// pos.x+=set_size.x/2;
		// pos.y+=set_size.y/2;

		sizee=set_size.get();
		to_talk=set_talk;
	}
	public void draw(PGraphics pg){
		pg.pushStyle();
		// pg.rectMode(CENTER);
		pg.stroke(255,0,0);
		pg.noFill();
		pg.rect(pos.x,pos.y,sizee.x,sizee.y);
		pg.popStyle();
	}

}

// void initMapBlock(){

// 	BuildBlock b1=new BuildBlock(0,0,344,163,false);
// 	BuildBlock b2=new BuildBlock(483,0,541,163,false);

// 	BuildBlock b3=new BuildBlock(1024,0,290,93,false);
// 	BuildBlock b4=new BuildBlock(1314,0,1478,118,false);
// 	BuildBlock b5=new BuildBlock(2792,0,297,93,false);

// 	BuildBlock b6=new BuildBlock(3090,0,438,135,false);
// 	BuildBlock b7=new BuildBlock(3527,0,521,164,false);
// 	BuildBlock b8=new BuildBlock(3024,308,1024,92,false);
// 	BuildBlock b9=new BuildBlock(2792,0,297,93,false);


// }







PImage[] arr_img_door;
BuildBlock[] arr_bridge_block;

PImage img_giraffe;
	
class CGameScene extends GameScene{

	final String DataFolder="GAME_C/";
	final int MPEOPLE=20;
	final int IPEOPLE=12;
	final int MDEFAULT_FACE=11;
	final int NUM_9_FRAMECOUNT=51;
	final int NUM_6_FRAMECOUNT=35;
	final int NUM_FRAME_INTERVAL=5;

	// ArrayList<FaceAvatar> arr_avatar_left;
	// ArrayList<FaceAvatar> arr_avatar_right;
	ArrayList<FaceAvatar> arr_avatar;//_center;
	
	Movie[] back_movie;
	PImage[] arr_front_building;
	// BuildBlock[] arr_left_build,arr_right_build,arr_center_build;
	BuildBlock[] arr_build;

	//ImageSeq[] people_movie=new ImageSeq[12];
	ArrayList<ArrayList<PImage>> people_movie;
	ArrayList<PImage> default_face;
	ArrayList<PImage> speak_bubble;

	int oldest_index_left=0;
	int oldest_index_right=0;

	int oldest_index=0;


	// clock
	boolean clock_mode=false;
	
	Movie[] arr_clock_movie;
	AlphaMovie num_movie_6,num_movie_9;
	PImage point_1,point_2;
	PImage[] arr_num_img_9;	
	PImage[] arr_num_img_6;
	int isecond;
	ClockNumber[] arr_clock_number;

	

	public @Override
	void loadFiles(){
		if(gapplet==null) return;

		back_movie=new Movie[3];
		back_movie[0]=new Movie(gapplet,DataFolder+"BACK/LEFT_FINAL.mov");
		back_movie[1]=new Movie(gapplet,DataFolder+"BACK/MIDDLE_FINAL.mov");
		back_movie[2]=new Movie(gapplet,DataFolder+"BACK/RIGHT_FINAL.mov");

		arr_front_building=new PImage[4];
		arr_front_building[0]=loadImage(DataFolder+"BACK/LEFT_BUILD_1.png");
		arr_front_building[1]=loadImage(DataFolder+"BACK/LEFT_BUILD_2.png");
		arr_front_building[2]=loadImage(DataFolder+"BACK/RIGHT_BUILD_1.png");
		arr_front_building[3]=loadImage(DataFolder+"BACK/RIGHT_BUILD_2.png");

	

		
		arr_build=new BuildBlock[5];
		arr_build[0]=new BuildBlock(0,275,200,125,true);
		arr_build[1]=new BuildBlock(440,350,205,50,true);
		
		arr_build[2]=new BuildBlock(3056+0,248,180,45,true);
		arr_build[3]=new BuildBlock(3056+584,345,234,55,true);

		arr_build[4]=new BuildBlock(1024,176,2032,240,true);
		
	
		arr_bridge_block=new BuildBlock[2];
		arr_bridge_block[0]=new BuildBlock(1024,50,50,50);
		arr_bridge_block[1]=new BuildBlock(3056,0,50,50);


		people_movie=new ArrayList<ArrayList<PImage>>();

		for(int i=1;i<=13;++i){
			people_movie.add(new ArrayList<PImage>());
			String file_name="";
			if(i<11) file_name=getRepeatText("P",i);
			else if(i==11) file_name="GOD";
			else if(i==12) file_name="CAT";
			else if(i==13) file_name="F";

			//people_movie[i]=new ImageSeq(DataFolder+"PEOPLE/P"+nf(i,3)+"/"+file_name,6);
			int frame_count=6;
			for(int j=0;j<frame_count;++j){
				String fname=DataFolder+"PEOPLE/P"+nf(i,3)+"/"+file_name+"_"+nf(j,5)+".png";
				println(fname);
				PImage load_image=loadImage(fname);
				(people_movie.get(i-1)).add(load_image);
			}
		}

		default_face=new ArrayList<PImage>();
		for(int i=1;i<=MDEFAULT_FACE;++i){
			String fname=DataFolder+"Face/FACE"+nf(i,3)+".png";
			println(fname);
			PImage load_image=loadImage(fname);
			default_face.add(load_image);
		}			

		speak_bubble=new ArrayList<PImage>();
		for(int i=0;i<10;++i){
			String fname=DataFolder+"ICON/P"+nf(i,3)+".png";
			println(fname);
			PImage load_image=loadImage(fname);
			speak_bubble.add(load_image);
		}

		arr_clock_movie=new Movie[3];
		arr_clock_movie[0]=new Movie(gapplet,DataFolder+"CLOCK_BACK/LEFT_FINAL.mov");
		arr_clock_movie[1]=new Movie(gapplet,DataFolder+"CLOCK_BACK/RIGHT_FINAL.mov");
		arr_clock_movie[2]=new Movie(gapplet,DataFolder+"CLOCK_BACK/MIDDLE_FINAL.mov");
		
		num_movie_6=new AlphaMovie(gapplet,DataFolder+"CLOCK/NUMBER0_6.mov");
		num_movie_9=new AlphaMovie(gapplet,DataFolder+"CLOCK/NUMBER0_9.mov");
		point_1=loadImage(DataFolder+"CLOCK/POINT_1.png");
		point_2=loadImage(DataFolder+"CLOCK/POINT_2.png");

		arr_num_img_9=new PImage[NUM_9_FRAMECOUNT];
		for(int i=0;i<NUM_9_FRAMECOUNT;++i) arr_num_img_9[i]=loadImage(DataFolder+"CLOCK/NUMBER0_9/NUMBER0_9"+nf(i,2)+".png");
		arr_num_img_6=new PImage[NUM_6_FRAMECOUNT];
		for(int i=0;i<NUM_6_FRAMECOUNT;++i) arr_num_img_6[i]=loadImage(DataFolder+"CLOCK/NUMBER0_6/NUMBER0_6"+nf(i,2)+".png");

		arr_clock_number=new ClockNumber[8];
		for(int i=0;i<8;++i){
			if(i!=6) arr_clock_number[i]=new ClockNumber(0,NUM_9_FRAMECOUNT,0);
			else arr_clock_number[i]=new ClockNumber(0,NUM_6_FRAMECOUNT,1);
		}


		arr_img_door=new PImage[24];
		for(int i=0;i<24;++i){
			arr_img_door[i]=loadImage(DataFolder+"door/door_1"+nf(i,2)+".png");
		}
		
		img_giraffe=loadImage(DataFolder+"giraffe.png");



	}
	public String getRepeatText(String rtext,int num){
		String result="";
		for(int i=0;i<num;++i) result+=rtext;
		return result;
	}

	public @Override
	void Init(){
		super.Init();

		if(clock_mode){
			initClockMode();
			return;
		}

		
		// arr_avatar_left=new ArrayList<FaceAvatar>();
		// arr_avatar_right=new ArrayList<FaceAvatar>();

		arr_avatar=new ArrayList<FaceAvatar>();

		// for(int i=0;i<MPEOPLE/2;++i){
		// 	arr_avatar_left.add(new FaceAvatar((int)random(12)));	
		// 	arr_avatar_right.add(new FaceAvatar((int)random(12)));	
		// } 
		// for(FaceAvatar face:arr_avatar_left) face.play();
		// for(FaceAvatar face:arr_avatar_right) face.play();

		for(int i=0;i<3;++i) back_movie[i].play();

		oldest_index=0;
		for(int i=0;i<MPEOPLE;++i){
			// addNewFace("",default_face.get((int)random(MDEFAULT_FACE)),(int)random(12),true);
			// addNewFace("",default_face.get((int)random(MDEFAULT_FACE)),(int)random(12),false);
			addNewFace("",default_face.get((int)random(MDEFAULT_FACE)),(int)random(12));
		}
		println(arr_avatar.size());

		// for(FaceAvatar face:arr_avatar_left){
		// 	face.mmotion.istage=AvatarAction.WALK;
		// 	//face.mmotion.mscale=1;	
		// } 
		// for(FaceAvatar face:arr_avatar_right){
		// 	face.mmotion.istage=AvatarAction.WALK;
		// 	//face.mmotion.mscale=1;	
		// } 
		for(FaceAvatar face:arr_avatar) face.mmotion.istage=AvatarAction.WALK;

	}

	public @Override
	void Update(){

		if(clock_mode){
			for(int i=0;i<3;++i) arr_clock_movie[i].read();
			for(int i=0;i<8;++i) arr_clock_number[i].update();
			return;
		}



		// if(arr_avatar_right.size()<MPEOPLE/2 || arr_avatar_left.size()<MPEOPLE/2){
		// 	if(random(150)<1)
		// 		addNewFace("",default_face.get((int)random(MDEFAULT_FACE)),(int)random(12));
		// }
		boolean one_end=false;
		for(int i=0;i<3;++i){
			back_movie[i].read();
			if(back_movie[i].time()==back_movie[i].duration()){
				one_end=true; break;
			}
		}
		if(one_end){
			for(int i=0;i<3;++i) back_movie[i].jump(0);	
		}
		

		// println(back_movie[0].time()+" "+back_movie[1].time()+" "+back_movie[2].time());
		// for(FaceAvatar face:arr_avatar_left){
		// 	face.update(arr_avatar_left,arr_left_build);	
		// }


		// Iterator<FaceAvatar> iter=arr_avatar_left.iterator();
		// while(iter.hasNext()){
		// 	FaceAvatar face=iter.next();
		// 	if(face.isDead()) iter.remove();
		// }

		// Collections.sort(arr_avatar_left,new Comparator<FaceAvatar>(){
  //           public int compare(FaceAvatar o1, FaceAvatar o2){
  //               return o1.getDepth().compareTo(o2.getDepth());
  //           }
  //       });

		// for(FaceAvatar face:arr_avatar_right){
		// 	face.update(arr_avatar_right,arr_right_build);	
		// }
		// Iterator<FaceAvatar> iter2=arr_avatar_right.iterator();
		// while(iter2.hasNext()){
		// 	FaceAvatar face=iter2.next();
		// 	if(face.isDead()) iter2.remove();
		// }
		
		// Collections.sort(arr_avatar_right,new Comparator<FaceAvatar>(){
  //           public int compare(FaceAvatar o1, FaceAvatar o2){
  //               return o1.getDepth().compareTo(o2.getDepth());
  //           }
  //       });


        for(FaceAvatar face:arr_avatar){
			//if(arr_build!=null) 
			face.update(arr_avatar,arr_build);	
			
		}
		// adjust Avatar
		if(frameCount%200==0) adjustAvatar();

		if(arr_avatar.size()>MPEOPLE){
			for(FaceAvatar face:arr_avatar){
				if(face.sarr_index<oldest_index-MPEOPLE){
					if(!face.isGoingOut()) face.goOut();
				}
			}
		}

		Iterator<FaceAvatar> iter=arr_avatar.iterator();
		while(iter.hasNext()){
			FaceAvatar face=iter.next();
			if(face.isDead()) iter.remove();
		}

		Collections.sort(arr_avatar,new Comparator<FaceAvatar>(){
            public int compare(FaceAvatar o1, FaceAvatar o2){
                return o1.getDepth().compareTo(o2.getDepth());
            }
        });


        // ani_giraffe.Update();
        // if(!ani_giraffe.ani_start){
        // 	if(random(650)<1) ani_giraffe.Restart();		
        // } 
	}
	

	public @Override
	void DrawLeftScreen(PGraphics sub_pg){

		if(clock_mode){
			sub_pg.image(arr_clock_movie[0],0,0);

			float base_y=25;
			float base_x=100;
			float margin_x=200;

			String nmonth=nf(month(),2);
			String nday=nf(day(),2);
			for(int i=0;i<2;++i){
				int inum=Integer.valueOf(nmonth.charAt(i))-48;
				arr_clock_number[i].updateNum(inum);
				int cur_fr=arr_clock_number[i].getCurFrame();
				//print(inum+"-"+cur_fr+" ");
				sub_pg.image(arr_num_img_9[cur_fr],base_x+margin_x*i,base_y);
			}
			
			sub_pg.image(point_1,base_x+margin_x*2,260+base_y);

			for(int i=0;i<2;++i){
				int inum=Integer.valueOf(nday.charAt(i))-48;
				arr_clock_number[2+i].updateNum(inum);
				int cur_fr=arr_clock_number[2+i].getCurFrame();
				
				sub_pg.image(arr_num_img_9[cur_fr],base_x+45+margin_x*(2+i),base_y);
			}
			
			return;
		}




		//drawSquaresBack(sub_pg);
		sub_pg.image(back_movie[0],0,0);
		// for(FaceAvatar face:arr_avatar_left){
		// 	if(face.getDepth()+AVATAR_SIZE.y/2<356)
		// 		face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		// } 


		


		for(FaceAvatar face:arr_avatar){
			if(face.getPosX()-AVATAR_SIZE.x/2>Left_Screen_X) continue;
			if(face.getDepth()+AVATAR_SIZE.y/2<356)
				face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		} 
		sub_pg.image(arr_front_building[0],0,0);

		// for(FaceAvatar face:arr_avatar_left){
		// 	if(face.getDepth()+AVATAR_SIZE.y/2>=356)
		// 		face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		// } 

		for(FaceAvatar face:arr_avatar){
			if(face.getPosX()-AVATAR_SIZE.x/2>Left_Screen_X) continue;
			if(face.getDepth()+AVATAR_SIZE.y/2>=356)
				face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		} 
		sub_pg.image(arr_front_building[1],0,0);


		if(DRAW_DEBUG){
			if(arr_build==null) return;
			for(BuildBlock bb:arr_build)
				if(bb.pos.x<Left_Screen_X) bb.draw(sub_pg);	
		} 
	}

	public @Override
	void DrawRightScreen(PGraphics sub_pg){
		
		if(clock_mode){
			sub_pg.image(arr_clock_movie[1],0,0);
			float base_y=25;
			float base_x=100;
			float margin_x=200;

			String nhour=nf(hour(),2);
			String nminute=nf(minute(),2);
			for(int i=0;i<2;++i){
				int inum=Integer.valueOf(nhour.charAt(i))-48;
				arr_clock_number[4+i].updateNum(inum);
				int cur_fr=arr_clock_number[4+i].getCurFrame();
				
				sub_pg.image(arr_num_img_9[cur_fr],base_x+margin_x*i,base_y);
			}
			
			int t=millis();
			if(t-isecond<500) sub_pg.image(point_2,base_x+margin_x*2,135+base_y);
			if(t-isecond>=1000){
				isecond=t;
				//println(isecond);
			}

			for(int i=0;i<2;++i){
				int inum=Integer.valueOf(nminute.charAt(i))-48;
				arr_clock_number[6+i].updateNum(inum);
				int cur_fr=arr_clock_number[6+i].getCurFrame();
				
				if(i==0) sub_pg.image(arr_num_img_6[cur_fr],base_x+46+margin_x*(2+i),base_y);
				else sub_pg.image(arr_num_img_9[cur_fr],base_x+46+margin_x*(2+i),base_y);
			}
			

			return;
		}		//drawSquaresBack(sub_pg);
		sub_pg.image(back_movie[2],0,0);

		// for(FaceAvatar face:arr_avatar_right){
		// 	if(face.getDepth()+AVATAR_SIZE.y/2<285)
		// 		face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		// } 
		sub_pg.pushMatrix();
		sub_pg.translate(-Right_Screen_X,0);
		for(FaceAvatar face:arr_avatar){
			if(face.getPosX()+AVATAR_SIZE.x/2<Right_Screen_X) continue;
			if(face.getDepth()+AVATAR_SIZE.y/2<285)
				face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		} 
		sub_pg.popMatrix();

		sub_pg.image(arr_front_building[2],0,0);
		// for(FaceAvatar face:arr_avatar_right){
		// 	if(face.getDepth()+AVATAR_SIZE.y/2>=285)
		// 		face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		// } 
		sub_pg.pushMatrix();
		sub_pg.translate(-Right_Screen_X,0);
		for(FaceAvatar face:arr_avatar){
			if(face.getPosX()+AVATAR_SIZE.x/2<Right_Screen_X) continue;
			if(face.getDepth()+AVATAR_SIZE.y/2>=285)
				face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		} 

		if(DRAW_DEBUG){
			if(arr_build!=null)
			for(BuildBlock bb:arr_build)
				if(bb.pos.x>=Right_Screen_X) bb.draw(sub_pg);	
		} 
		sub_pg.popMatrix();

		sub_pg.image(arr_front_building[3],0,0);

	}

	public @Override
	void DrawCenterScreen(PGraphics sub_pg){

		if(clock_mode){
			sub_pg.image(arr_clock_movie[2],0,0);
			return;
		}

		sub_pg.image(back_movie[1],0,0);

		sub_pg.pushMatrix();
		sub_pg.translate(-Left_Screen_X,0);
		for(FaceAvatar face:arr_avatar){
			if(face.getPosX()-AVATAR_SIZE.x/2>Right_Screen_X || face.getPosX()+AVATAR_SIZE.x/2<Left_Screen_X) continue;
			
			face.draw(sub_pg,people_movie.get(face.icharacter).get(face.getCurFrame()),speak_bubble.get(face.getSpeakBubbleIndex()));	
		} 

		if(DRAW_DEBUG){
			if(arr_build!=null)
			for(BuildBlock bb:arr_build)
				if(bb.pos.x<Right_Screen_X && bb.pos.x>=Left_Screen_X) bb.draw(sub_pg);	
		} 

		sub_pg.popMatrix();


		//drawSquaresBack(sub_pg);
		

		
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
		if(!wait_mode) wait_mode=true;

		String user_id=(String)params.get((byte)100);
		String name=(String)params.get((byte)1);
		String encoded_image=(String)params.get((byte)2);
		//String file_path=(String)params.get((byte)2);
		int iavatar=(Integer)params.get((byte)3);
		

		final Base64 base64=new Base64();
		byte[] image_bytes=base64.decode(encoded_image);
		String file_name="F://kerker_face/user_"+user_id+".png";
		saveImage(file_name,image_bytes);

		//PImage img=loadImage(file_path);
		PImage img=loadImage(file_name);

		addNewFace(name,img,iavatar);
		
	}
	private void addNewFace(String name,PImage img,int ichar){

		 // boolean add_left=random(2)<1;
		 // addNewFace(name,img,ichar,add_left);	

	 	int cur_size=arr_avatar.size();
		arr_avatar.add(cur_size,new FaceAvatar(name,img,ichar,oldest_index,arr_build));
		oldest_index++;
		cur_size++;	
		//println("add to "+cur_size);

		
	}
	private void adjustAvatar(){
		ArrayList<FaceAvatar> arr_left=new ArrayList<FaceAvatar>();
		ArrayList<FaceAvatar> arr_right=new ArrayList<FaceAvatar>();
		int on_bridge=0;
		for(FaceAvatar face:arr_avatar){
			if(face.mmotion.istage==AvatarAction.BRIDGE){
				on_bridge++;
				continue;	
			} 
			if(face.mmotion.istage!=AvatarAction.WALK) continue;

			if(face.getPosX()<Left_Screen_X) arr_left.add(face);
			else if(face.getPosX()>Right_Screen_X) arr_right.add(face);
		
		}
		
		if(on_bridge>MPEOPLE/3) return;

		boolean unbalanced=false;
		if(arr_right.size()>arr_left.size()+3){
			unbalanced=true;
			int m=(int)random(arr_right.size());
			arr_right.get(m).mmotion.goBridge();
		}
		if(arr_left.size()>arr_right.size()+3){
			unbalanced=true;
			int m=(int)random(arr_left.size());
			arr_left.get(m).mmotion.goBridge();
		}
		// if(!unbalanced && random(20)<1){
		// 	int mright=(int)random(arr_right.size());
		// 	arr_right.get(mright).mmotion.goBridge();

		// 	int mleft=(int)random(arr_left.size());
		// 	arr_left.get(mleft).mmotion.goBridge();
		// }

	}

	// private void addNewFace(String name,PImage img,int ichar,boolean add_left){

	// 	if(add_left){
	// 		int cur_size=arr_avatar_left.size();
	// 		arr_avatar_left.add(cur_size,new FaceAvatar(name,img,ichar,oldest_index_left,arr_left_build));
	// 		oldest_index_left++;
	// 		cur_size++;	
	// 		//println("add to "+cur_size);

	// 		if(cur_size>MPEOPLE/2){
	// 			for(FaceAvatar face:arr_avatar_left){
	// 				if(face.sarr_index<oldest_index_left-MPEOPLE/2){
	// 					if(!face.isGoingOut()) face.goOut();
	// 				}
	// 			}
	// 		}
	// 	}else{
	// 		int cur_size=arr_avatar_right.size();
	// 		arr_avatar_right.add(cur_size,new FaceAvatar(name,img,ichar,oldest_index_right,arr_right_build));	
	// 		oldest_index_right++;
	// 		cur_size++;
	// 		if(cur_size>MPEOPLE/2){
	// 			for(FaceAvatar face:arr_avatar_right){
	// 				if(face.sarr_index<oldest_index_right-MPEOPLE/2){
	// 					if(!face.isGoingOut()) face.goOut();
	// 				}
	// 			}
	// 		}
	// 	} 

	// }

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
    public void toggleClockMode(){
    	clock_mode=!clock_mode;
    	if(clock_mode) initClockMode();

    }
	public void initClockMode(){
		
		clock_mode=true;

		for(int i=0;i<3;++i) arr_clock_movie[i].loop();

		isecond=millis();

		String nmonth=nf(month(),2);
		String nday=nf(day(),2);
		String nhour=nf(hour(),2);
		String nminute=nf(minute(),2);
		
		arr_clock_number[0].Reset(Integer.valueOf(nmonth.charAt(0))-48);
		arr_clock_number[1].Reset(Integer.valueOf(nmonth.charAt(1))-48);
		arr_clock_number[2].Reset(Integer.valueOf(nday.charAt(0))-48);
		arr_clock_number[3].Reset(Integer.valueOf(nday.charAt(1))-48);
		
		arr_clock_number[4].Reset(Integer.valueOf(nhour.charAt(0))-48);
		arr_clock_number[5].Reset(Integer.valueOf(nhour.charAt(1))-48);
		arr_clock_number[6].Reset(Integer.valueOf(nminute.charAt(0))-48);
		arr_clock_number[7].Reset(Integer.valueOf(nminute.charAt(1))-48);
		

	}

}
class ClockNumber{
	final float fr_vel=.2f;
	final float fr_inter=5;
	private int cur_num;
	private float cur_frame;
	
	private int dest_num;
	private int dest_frame;
	
	private int total_frame;
	private int itype;

	ClockNumber(int set_num,int set_total,int set_type){
		total_frame=set_total;
		itype=set_type;
		Reset(set_num);
	}
	public void Reset(int set_num){
		cur_num=set_num;
		cur_frame=cur_num*fr_inter;
		dest_frame=(int)cur_frame;
	}
	public void updateNum(int set_dest){
		
		if(set_dest==dest_num) return;
		println(cur_num+"->"+set_dest);

		dest_num=set_dest;
		dest_frame=set_dest*(int)fr_inter;
	}
	public void update(){
		if(dest_frame!=floor(cur_frame)){
			cur_frame=(cur_frame+fr_vel)%total_frame;
		}else{
			cur_num=dest_num;
		}
	}

	public int getCurFrame(){
		return (int)cur_frame;
	}
}

final float ROAD_MOV_SPEED=5;
final float CAR_BASE_VEL=1;
final float CAR_DEST_DIST=60;

class EnergyCar{
	
	float x,y,wid;
	

	float cur_vel;
	float dest_vel;
	FrameAnimation ani_vel;

	float cur_pos=0;
	float dest_pos=0;
	FrameAnimation ani_pos;

	int cur_icar;
	int dest_icar;
	FrameAnimation ani_car_transform;
	boolean is_bump_transform;
	FrameAnimation ani_icon_transform;

	FrameAnimation ani_icontext;

	FrameAnimation ani_icon_timer;
	PShader shd_motion;
	PGraphics pg_motion,pg_img;

	FrameAnimation ani_end_transform;

	String user_id;
	int color_index;

	boolean start_run=false;
	float run_distance=0;

	
	ImageSeq seq_car;
	ImageSeq seq_effect;

	PImage img_icontext=null;

	EnergyCar(float x_,float y_,int icolor){
		x=x_; y=y_; 
		wid=120;
		color_index=icolor;
		cur_icar=dest_icar=-1;

		seq_car=new ImageSeq(59);
		seq_car.frame_vel=.5f;
		seq_car.play();

		seq_effect=new ImageSeq(58);
		seq_effect.frame_vel=.5f;
		seq_effect.looped=false;
		seq_effect.play();

		ani_pos=new FrameAnimation(30);
		ani_vel=new FrameAnimation(2);

		ani_car_transform=new FrameAnimation(30);
		ani_icon_transform=new FrameAnimation(25);
		ani_icon_transform.is_elastic=true;

		ani_icon_timer=new FrameAnimation(180);

		ani_icontext=new FrameAnimation(60);


		ani_end_transform=new FrameAnimation(30);


		shd_motion=loadShader("GAME_B/motionblur.frag");
		pg_motion=createGraphics(297,297);
		pg_img=createGraphics(297,297,P3D);
		drawMotion();

	}
	public void draw(PGraphics pg){
		
		pg.pushStyle();
		pg.imageMode(CENTER);
		pg.rectMode(CENTER);

		pg.noStroke();
		pg.pushMatrix();
		if(DRAW_DEBUG){
			pg.textSize(16);
			pg.fill(255,0,0);
			pg.text(dest_vel,10,20);			
		}
		float _pos=getCurPosition();
		pg.translate(map(_pos,-1,1,ROAD_LINE[0],ROAD_LINE[1]),300,map(ani_end_transform.GetPortion(),0,1,0,-800));

			float _alpha=ani_car_transform.GetPortion();

			//println("a= "+_alpha);
			// if(img_cur_car!=null){
			// 	pg.tint(255,255*(1-_alpha));
			// 	pg.image(img_cur_car,0,0);
			// }
			// if(img_dest_car!=null){
			// 	pg.tint(255,255*(_alpha));
			// 	pg.image(img_dest_car,0,0);
			// }
			if(ani_end_transform.GetPortion()<1) pg.image(pg_img,0,0);

    		if(DRAW_DEBUG) pg.text(ani_car_transform.GetPortion(),-20,-50);
		pg.popMatrix();


		if(img_icontext!=null && ani_icontext.ani_start){
			pg.pushMatrix();
			pg.translate(512,120);
			float _port=ani_icontext.GetPortion();
			pg.scale(constrain(sin(_port*HALF_PI),0,.3f)*3.33f);				
				pg.image(img_icontext,0,0);
			pg.popMatrix();
		}	

		pg.popStyle();


		
	}
	public void drawIcon(PGraphics pg,PImage img_cur_icon,PImage img_dest_icon){
		
		float _isize=.45f;
		pg.pushStyle();
		pg.imageMode(CENTER);
			float _alpha=ani_icon_transform.GetPortion();
			if(_alpha<=0.5f){
				if(img_cur_icon!=null){
					pg.pushMatrix();
					// pg.translate(img_cur_icon.width/2,img_cur_icon.height/2);
					pg.scale((1-_alpha*2)*_isize);
					// pg.tint(255,255*(1-_alpha));
					pg.image(img_cur_icon,0,0);
					pg.popMatrix();
				}
			}else{
				if(img_dest_icon!=null){
					pg.pushMatrix();
					// pg.translate(img_dest_icon.width/2,img_dest_icon.height/2);
					pg.scale((_alpha*2-1)*_isize);
					// pg.tint(255,255*(_alpha));
					pg.image(img_dest_icon,0,0);
					pg.popMatrix();
				}
			}
		pg.popStyle();
	}
	

	public void update(PImage img_cur_car,PImage img_dest_car,PImage img_dest_effect){
		
		ani_pos.Update();
		if(ani_pos.GetPortion()==1) cur_pos=dest_pos;

		ani_vel.Update();
		if(ani_vel.GetPortion()==1) cur_vel=dest_vel;

		ani_car_transform.Update();
		ani_icontext.Update();

		if(ani_car_transform.GetPortion()==1){
			// seq_car.play();
			// seq_effect.play();	
			cur_icar=dest_icar;
			is_bump_transform=false;
		}	
		ani_end_transform.Update();


		ani_icon_transform.Update();

		ani_icon_timer.Update();
		if(ani_icon_timer.GetPortion()==1){
			// vel recovery
			cur_vel=dest_vel;
			ani_vel.Restart();
			dest_vel=1*ROAD_MOV_SPEED;
		} 

		if(start_run){
			// run_distance+=CAR_BASE_VEL*lerp(cur_vel,dest_vel,ani_vel.GetPortion());
			// run_distance=constrain(run_distance,0,CAR_DEST_DIST);
		} 

		seq_car.update();
		seq_effect.update();

		updateCar(img_cur_car,img_dest_car,img_dest_effect);

		// if(frameCount%150==0){
		// 	changeCar((int)random(5));
		// }	

	}
	public void reset(){
		cur_vel=dest_vel=ROAD_MOV_SPEED;
		cur_pos=cur_pos=0;

		cur_icar=dest_icar=-1;

		ani_vel.Reset();
		ani_pos.Reset();
		ani_car_transform.Reset();
		ani_icon_transform.Reset();

		ani_icontext.Reset();

		ani_icon_timer.Reset();

		ani_end_transform.Reset();

		run_distance=0;


	}
	public void startRun(){
		
		reset();

		start_run=true;
		
				
		
	}
	public void stopRun(){
		start_run=false;
		ani_end_transform.Restart();
		println("car stop run!!");

	}
	public void updatePosition(int delta_position){
		
		float _dest=constrain(dest_pos+delta_position,-1,1);
		if(_dest==dest_pos) return;
		
		cur_pos=lerp(cur_pos,dest_pos,ani_pos.GetPortion());
		ani_pos.Restart();

		dest_pos=_dest;
		// println("go "+dest_pos);
	}
	public float getCurPosition(){
		return lerp(cur_pos,dest_pos,ani_pos.GetPortion());
	}
	public void changeCar(int iset_car,PImage set_text){

	
		if(ani_car_transform.ani_start) return;

		img_icontext=set_text;
		cur_vel=dest_vel;
		ani_vel.Restart();
		ani_icontext.Restart();


		if(iset_car<4) dest_vel=2*ROAD_MOV_SPEED;
		else if(iset_car<ITRANSCAR) dest_vel=1.5f*ROAD_MOV_SPEED;
		else{
			dest_vel=1*ROAD_MOV_SPEED;
			ani_car_transform.Restart();
			is_bump_transform=true;
			seq_effect.pause();
			return;
		} 
		
		seq_effect.play();
		
		if(dest_icar==iset_car) return;

		cur_icar=dest_icar;
		dest_icar=iset_car;
		ani_car_transform.Restart();
		ani_icon_transform.Restart();
		is_bump_transform=false;

		if(dest_icar>=0){
		 	ani_icon_timer.Restart();		 	
		}
		seq_car.play();
		

		println("-- change car to "+iset_car);
	}
	public void drawMotion(){

		if(pg_motion==null) return;

		pg_motion.beginDraw();

		float cscale=255.0f/(float)pg_motion.width*sin(ani_car_transform.GetPortion()*PI);

		for(int i=0;i<pg_motion.width;++i)
		for(int j=0;j<pg_motion.height;++j){
		  pg_motion.set(i,j,color(255/2.0f+cscale*80*noise(i/5+frameCount)*sin((float)frameCount/1),255/2.0f+cscale*20*sin((float)j/20)*sin((float)frameCount/2),0));
		}

		pg_motion.endDraw();

		shd_motion.set("motion_texture",pg_motion);
	}
	public void updateCar(PImage img_cur_car,PImage img_dest_car,PImage img_dest_effect){

		if(frameCount%3==0) drawMotion();
		float _alpha=(ani_car_transform.ani_start)?ani_car_transform.GetPortion():1;

		if(img_dest_car!=null) shd_motion.set("trans_texture",img_dest_car);
		if(img_cur_car!=null) shd_motion.set("orig_texture",img_cur_car);
		shd_motion.set("trans_t",_alpha);

		//if(frameCount%15==0) drawMotion();
		pg_img.beginDraw();
			pg_img.pushStyle();
			pg_img.noStroke();
    		pg_img.background(0,0);
    		pg_img.imageMode(CENTER);
    		pg_img.rectMode(CENTER);

    		pg_img.pushMatrix();
    		pg_img.translate(pg_img.width/2,pg_img.height/2);

    		if(!is_bump_transform){
	    		pg_img.shader(shd_motion);
	    		pg_img.rect(0,0,215+45*noise((float)frameCount/2)*(1-_alpha),215+10*noise((float)frameCount/2)*(1-_alpha));
	    		pg_img.resetShader();
    		}else{
    			pg_img.tint(255,random(2)<1?255:0);
    			pg_img.image(img_dest_car,0,0);
    		}
    		
    		pg_img.blendMode(ADD);
    		pg_img.tint(255,220);
    		if(img_dest_effect!=null && seq_effect.isplaying) pg_img.image(img_dest_effect,0,24);//,pg_img.width*.0,pg_img.height*.8);

    		pg_img.popMatrix();
    		
    		pg_img.popStyle();
		pg_img.endDraw();


	}
	public boolean arriveGoal(){
		// println("car distance: "+run_distance+" / "+CAR_DEST_DIST);
		return run_distance>=CAR_DEST_DIST;
	}
	public boolean isFinished(){
		return ani_end_transform.GetPortion()==1;
	}
	public int getScore(){
		return (int)(run_distance/CAR_DEST_DIST*100);
	}
	public int getCurFrame(){
		//println(seq_car.icur_frame);
		return (int)seq_car.icur_frame;
	}
	public int getCurEffectFrame(){
		return (int)seq_effect.icur_frame;
	}
	public float getCurVel(){
		return constrain(lerp(cur_vel,dest_vel,ani_vel.GetPortion()),.5f,2);
	}
}

boolean DRAW_DOOR=true;

class FaceAvatar{
	
	float x,y;
	PImage face_image;
	String user_name;
	int icharacter;
	int sarr_index;

	private AvatarMotion mmotion;
	


	FaceAvatar(int icharacter_,int arr_index_,BuildBlock[] arr_block){
		setup(icharacter_,arr_index_,arr_block);
	}
	FaceAvatar(String user_,PImage face_,int icharacter_,int arr_index_,BuildBlock[] arr_block){
		setup(user_,face_,icharacter_,arr_index_,arr_block);
	}	
	public void setup(int icharacter_,int arr_index_,BuildBlock[] arr_block){
		setup("no_define",null,icharacter_,arr_index_,arr_block);
	}
	public void setup(String user_,PImage face_,int icharacter_,int arr_index_,BuildBlock[] arr_block){
	
		face_image=face_;
		user_name=user_;
		icharacter=icharacter_;
		sarr_index=arr_index_;
		
		mmotion=new AvatarMotion(arr_block);
		
	}
	public void draw(PGraphics pg,PImage char_img,PImage bubble_img){

		
		pg.pushStyle();
		pg.imageMode(CENTER);
		pg.pushMatrix();
		pg.translate(mmotion.pos.x,mmotion.pos.y);
		pg.scale(mmotion.depth_scale);


		if(mmotion.istage==AvatarAction.BORN){

			if(DRAW_DOOR){
				PGraphics tmp_pg=createGraphics(250,250);
				tmp_pg.beginDraw();
				tmp_pg.fill(40,10,137);
				tmp_pg.rect(71,45,110,160);

				tmp_pg.imageMode(CENTER);
				tmp_pg.translate(125,125);
				
				int door_fr=(mmotion.mscale>.5f)?(int)((mmotion.mscale-.5f)*46):0;

				if(door_fr!=0){
					drawAvatar(tmp_pg,face_image);
					if(char_img!=null) tmp_pg.image(char_img,0,0);
				}
				
				tmp_pg.image(arr_img_door[door_fr],0,-5);

				tmp_pg.endDraw();

				//pg.image(tmp_pg,0,0);
				float door_scale=(mmotion.mscale>.5f)?1:sin(PI/2*mmotion.mscale*2);
				
				pg.noStroke();
				pg.beginShape();
				pg.texture(tmp_pg);
					pg.vertex(-250/2,-250/2,0,0);
					pg.vertex(250/2,-250/2,250,0);
					pg.vertex(250/2,250*(-.5f+door_scale),250,door_scale*250);
					pg.vertex(-250/2,250*(-.5f+door_scale),0,door_scale*250);
				pg.endShape();
			}else{
				pg.scale(mmotion.mscale);
				drawAvatar(pg,face_image);
				if(char_img!=null) pg.image(char_img,0,0);
					
			}
			// if(mmotion.mscale>.5){
			// 	drawAvatar(pg,face_image);
			// 	if(char_img!=null) pg.image(char_img,0,0);
			// }
		}else{
			if(DRAW_DOOR && mmotion.mscale>0){
				PGraphics tmp_pg=createGraphics(250,250);
				tmp_pg.beginDraw();
				tmp_pg.imageMode(CENTER);
					
				tmp_pg.fill(40,10,137);
				tmp_pg.rect(71,45,110,160);

				tmp_pg.translate(250/2,250/2);

				int door_fr=(mmotion.mscale>.5f)?(int)((mmotion.mscale-.5f)*46):0;
				tmp_pg.image(arr_img_door[(int)(mmotion.mscale*23)],0,-5);

				tmp_pg.endDraw();

				//pg.image(tmp_pg,0,0);
				float door_scale=(mmotion.mscale>.5f)?1:abs(sin(-PI/2*mmotion.mscale*2));
				
				pg.pushMatrix();
				pg.translate(-mmotion.pos.x+mmotion.land_pos.x,-mmotion.pos.y+mmotion.land_pos.y);

				pg.noStroke();
				pg.beginShape();
				pg.texture(tmp_pg);
					pg.vertex(-250/2,-250/2,0,0);
					pg.vertex(250/2,-250/2,250,0);
					pg.vertex(250/2,250*(-.5f+door_scale),250,door_scale*250);
					pg.vertex(-250/2,250*(-.5f+door_scale),0,door_scale*250);
				pg.endShape();

				pg.popMatrix();

				mmotion.mscale-=DRAW_DOOR?mmotion.scale_vel:mmotion.scale_vel*5;
			}

			//pg.scale(mmotion.mscale);			

		


			drawAvatar(pg,face_image);
			if(char_img!=null) pg.image(char_img,0,0);
			//pg.text(user_name,0,0);
			mmotion.speak_bubble.draw(pg,0,-100,bubble_img);

		}


		pg.popMatrix();
		pg.popStyle();

		if(mmotion.is_giraffe){
			pg.pushMatrix();
			float t=mmotion.action_delay;				
			if(t<GIRAFFE_SPAN/2) pg.translate(constrain(mmotion.giraffe_dest*sin(t/GIRAFFE_SPAN*PI)-343-5,-343,0),mmotion.pos.y-50);
			else pg.translate(constrain(mmotion.pos.x-343,-343,0)-5,constrain(mmotion.pos.y-50,50,250));
			pg.scale(mmotion.depth_scale);
			
			pg.image(img_giraffe,0,0);
			
			pg.popMatrix();
		}

		if(DRAW_DEBUG) mmotion.drawDebugRegion(pg);

	}
	public void drawAvatar(PGraphics pg,PImage face_image){
		if(face_image!=null){
				switch(icharacter){
					case 0:
						pg.image(face_image,5,-28);	
						break;
					case 10:
						pg.image(face_image,0,-13);	
						break;
					case 11:
						pg.image(face_image,-5,-18);	
						break;
					case 12:
					pg.pushMatrix();
						pg.translate(18,-52);
						pg.rotate(radians(18));
						pg.scale(.68f,.42f);
						pg.image(face_image,0,0);	
					pg.popMatrix();
						break;
					default:
						pg.image(face_image,0,-28);	
						break;
				}
			} 


	}


	public void update(){
		mmotion.update(null,null);
		
	}
	public void update(ArrayList<FaceAvatar> arr_avatar,BuildBlock[] arr_build){
		ArrayList<AvatarMotion> arr_motion=new ArrayList<AvatarMotion>();
		for(FaceAvatar av:arr_avatar) 
			if(av!=this) arr_motion.add(av.mmotion);

		mmotion.update(arr_motion,arr_build);
		
	}

	public int getCurFrame(){
		return (int)(mmotion.img_seq.icur_frame);
	}
	public int getSpeakBubbleIndex(){
		return mmotion.speak_bubble.ibubble;
	}
	public void play(){
		mmotion.img_seq.play();
		
	}
	public Float getDepth(){
		return new Float(mmotion.pos.y);
	}
	public Float getPosX(){
		return mmotion.pos.x;
	}
	public void goOut(){
		mmotion.startGoOut();
	}
	public boolean isDead(){
		return mmotion.istage==AvatarAction.DEAD;
	}
	public boolean isGoingOut(){
		return mmotion.istage==AvatarAction.LEAVE;	
	}

}

class SpeakBubble{
	int ibubble;
	boolean isplaying=false;
	private int istage=0;
	private float scalee=0;
	FrameAnimation frani_start;
	FrameAnimation frani_end;
	SpeakBubble(int index){
		
		frani_start=new FrameAnimation(12);
		frani_end=new FrameAnimation(12,40);
		ibubble=index;
		Reset();
	}
	public void setIndex(int set_index){
		//if(istage!=0 && isplaying) return;

		ibubble=set_index;
		Reset();
		Restart();
	}
	public void Reset(){
		scalee=0;
		isplaying=false;
		istage=0;
		//frani.setDelay(0);
	}
	public void Restart(){
		isplaying=true;
		istage=1;
		frani_start.Restart();
	}
	public void draw(PGraphics pg,float x_,float y_,PImage bubble_img){
		
		if(istage==0 || istage==3) return;

		pg.pushStyle();
		pg.imageMode(CENTER);

		pg.pushMatrix();
		pg.translate(x_,y_);
		
		if(ibubble==5||ibubble==6||ibubble==7||ibubble==8) pg.translate(-50,0);
		else pg.translate(50,0);

		if(scalee==0) pg.rotate(PI/40*sin((float)frameCount/3));
		
		if(istage==1) pg.scale(scalee);
		else if(istage==2) pg.scale(1-scalee);
		
			pg.image(bubble_img,0,0);
		
		pg.popMatrix();

		pg.popStyle();
	}

	public void update(){
		//if(!isplaying) return;

		switch(istage){
			case 1:
				frani_start.Update();
				scalee=frani_start.GetPortion();
				if(frani_start.reachEnd()){
					frani_end.Restart();
					istage=2;
				}
				break;
			case 2:
				frani_end.Update();
				scalee=frani_end.GetPortion();
				if(frani_end.reachEnd()){
					istage=3;
				}
				break;
		}
		
		
	}
	public boolean isFinished(){
		return istage==3;
	}


}
class FrameAnimation{
	
	float ani_t,ani_vel;
	float delay_fr;

	float start_pos,end_pos;

	boolean ani_start=false;
	boolean is_reverse=false;
	boolean ani_end=false;

	boolean is_elastic=false;

	FrameAnimation(float set_length){
		setup(set_length,0);
	}
	FrameAnimation(float set_length,float set_delay){
		setup(set_length,set_delay);
	}
	FrameAnimation(float set_length,float set_delay,float set_start,float set_end){
		setup(set_length,set_delay);
		setPos(set_start,set_end);
	}
	private void setup(float set_length,float set_delay){

		ani_vel=1.0f/set_length;
		delay_fr=set_delay;

		Reset();
	}
	public void Start(){
		ani_start=true;
		ani_end=false;
	}
	public float GetPortion(){
		if(ani_t<0) return 0;
		if(ani_t==1) return 1;
		float k=0.5f;
		float r=0.5f-0.5f*cos(ani_t*(PI));
		if(is_elastic) r=0.5f-0.51f*cos(PI*ani_t+k*ani_t-k*0.5f);
		
		return is_reverse?(1-r):r;
	}
	public float GetPos(){
		// Update();
		if(ani_t<0) return start_pos;
		return lerp(start_pos,end_pos,GetPortion());
	}
	public void Update(){
		if(!ani_start) return;

		if(ani_t<1) ani_t+=ani_vel;
		else{
			ani_start=false;
			ani_t=1;
		}
	}
	public void Pause(){
		ani_start=false;
	}
	public void Reset(){
		ani_start=false;
		ani_t=-delay_fr*ani_vel;
		// Start();
	}
	public void Restart(){
		Reset();
		Start();
		is_reverse=false;
	}
	public void Reverse(){
		Reset();
		Start();
		is_reverse=true;
	}
	
	public void setPos(float set_start,float set_end){
		start_pos=set_start;
		end_pos=set_end;
	}
	public void setDelay(float set_delay){
		delay_fr=set_delay;		
	}
	public boolean reachEnd(){
		return ani_t==1;
	}
}
class GameScene{
	
	final int[] Left_Screen_Rect={0,176,1024,384};
	final int[] Center_Screen_Rect={0,0,2032,176};
	final int[] Right_Screen_Rect={2032,0,1024,384};

	PGraphics pg;
	PGraphics left_pg,right_pg,center_pg;
	GameState game_state;

	boolean wait_mode=true;
	Thread thread_load=null;
	boolean finish_load=false;

	GameScene(){
		pg=createGraphics(width,height,P3D);
		left_pg=createGraphics(Left_Screen_Rect[2],Left_Screen_Rect[3],P3D);
		right_pg=createGraphics(Right_Screen_Rect[2],Right_Screen_Rect[3],P3D);
		center_pg=createGraphics(Center_Screen_Rect[2],Center_Screen_Rect[3],P3D);
		
		finish_load=false;
		
		Load();

	}
	public void Load(){
		println("Load Game.....");

		if(!finish_load && thread_load==null){
			thread_load=new Thread(new Runnable(){
			    public void run(){
			    	println(".... Start Loading .....");
			        loadFiles();
			        println(".... End Loading .....");
			        finish_load=true;
			        // Init();
			    }
			});  
			thread_load.start();
		}
	}
	public void Init(){
		
		thread_load=null;

		println("Init Game.....");
		game_state=GameState.WAIT;
		show_game_over=false;
		wait_mode=true;
	}

	public void SUpdate(){
	
		if(finish_load) Update();	

	}
	public void Update(){}
	public void Draw(){

		

		left_pg.beginDraw();
			DrawLeftScreen(left_pg);
			if(game_state==GameState.WAIT) drawWaitTitle(left_pg,true);
		left_pg.endDraw();

		right_pg.beginDraw();
			DrawRightScreen(right_pg);
			if(game_state==GameState.WAIT) drawWaitTitle(right_pg,false);
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


	public void HandleEvent(GameEventCode event_code,TypedHashMap<Byte,Object> params){}
	public int[] GetScores(){return null;}

	public void DrawOnGraph(PGraphics back_graph){
		back_graph.image(pg,0,0);
	}
	public void StartGame(){
		game_state=GameState.PLAY;
		show_game_over=false;
	}
	public void EndGame(){
		game_state=GameState.END;
		show_game_over=true;
	}

	public void UnLoad(){
		
		println("UnLoad Game.....");

		if(finish_load) unloadFiles();
		System.gc();
		finish_load=false;

	}
	public void DrawLeftScreen(PGraphics sub_pg){}
	public void DrawRightScreen(PGraphics sub_pg){}
	public void DrawCenterScreen(PGraphics sub_pg){}
	public void loadFiles(){}
	public void unloadFiles(){}

	public void drawWaitTitle(PGraphics pg,boolean is_android){
		pg.pushStyle();
		pg.tint(255,255*sin((float)frameCount/50));
			pg.image(img_qrcode_title,0,0);
			pg.tint(255,abs(sin((float)frameCount/50))*105+150);
			if(is_android) pg.image(img_qrcode_android,383,105);
			else pg.image(img_qrcode_ios,383,105);
		pg.popStyle();
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


class IconLine{
	
	final float ICON_SPAN=60;
	final float ICON_DELAY=60;
	
	float pos_x;

	int t_icon;

	FrameAnimation ani_icon;
	
	PShader shd_explode;
	FrameAnimation ani_explode;
	boolean is_explode;
	
	FrameAnimation ani_text;
	PImage img_icontext;
	boolean is_playing=false;

	int icon_index;

	IconLine(int set_index,float set_x){
		t_icon=0;
		ani_icon=new FrameAnimation(ICON_SPAN);
		ani_text=new FrameAnimation(20);

		icon_index=set_index;
		pos_x=set_x;


		shd_explode=loadShader("GAME_B/explode.frag");
		ani_explode=new FrameAnimation(10);
		is_explode=false;
	}

	public void restart(){
		ani_icon.Restart();
		ani_icon.Pause();
		//ani_explode.Reset();
		is_playing=true;
	}
	public void pause(){
		ani_icon.Pause();
		is_playing=false;
	}
	public void update(){
		
		

		ani_icon.Update();
		
		if(is_playing && !ani_icon.ani_start && !ani_explode.ani_start){
			ani_icon.setDelay(ICON_DELAY*random(1,3));
			ani_icon.Restart();
			icon_index=(int)random(ITRANSCAR+2);
			ani_explode.Reset();
			// ani_text.Reset();
			is_explode=false;
		}
		
		ani_explode.Update();
		ani_text.Update();

		// if(ani_text.GetPortion()==1) ani_text.Reset();

		//if(ani_explode.GetPortion()==1) ani_explode.Reset();
		//shd_explode.set("trans_t",ani_explode.GetPortion());
		shd_explode.set("sampleDist",.2f+ani_icon.GetPortion());
		shd_explode.set("sampleStrength",2+2*ani_icon.GetPortion());
	}
	public boolean isRunning(){
		return ani_icon.ani_start;
	}
	public boolean isReached(){
		return ani_icon.GetPortion()>.7f;
	}
	public void startExplode(PImage set_text){
		if(!is_explode && !ani_explode.ani_start){

			println("Icon Explode!");
			ani_explode.Restart();
			
			is_explode=true;	

			
			// if(set_text!=null){
			// 	img_icontext=set_text;
			// 	ani_text.Restart();
			// }
		} 
	}

	public void draw(PGraphics pg,PImage img_icon){

		float _pos=ani_icon.GetPortion();
		if(_pos>1 || _pos<=0) return;

		

		pg.pushStyle();
		pg.imageMode(CENTER);

		pg.pushMatrix();

		boolean is_car=icon_index>ITRANSCAR-1;
		
		if(is_car) pg.translate(map(pos_x,-1,1,ROAD_LINE[0]+70,ROAD_LINE[1]-70),280,map(_pos,0,1,-800,100));
		else{
			pg.translate(map(pos_x,-1,1,ROAD_LINE[0],ROAD_LINE[1]),220,map(_pos,0,1,-800,100));
			pg.scale((1-ani_explode.GetPortion())*.75f);	
		} 
			pg.tint(255,(1-ani_explode.GetPortion())*255);
			
			//pg.shader(shd_explode);
			if(ani_explode.ani_start){
				if(is_car){
					// pg.tint(255,random(2)<1?255:0);
				}else{
					pg.translate(random(-5,5),random(-5,5));
					pg.rotateZ(PI/3*sin(random(TWO_PI)));
				}
			}
			pg.image(img_icon,0,0);
			


			pg.resetShader();
		pg.popMatrix();


		pg.popStyle();
	}

}
class ImageSeq{
	
	String file_name;
	float mframe;
	float icur_frame;
	//PImage[] arr_img;
	float frame_vel=12.0f/60.0f;

	boolean isplaying=false;
	boolean looped=true;

	ImageSeq(int _mframe){
		mframe=_mframe;
	}
	ImageSeq(String _file_name,int _mframe){
		file_name=_file_name;
		mframe=_mframe;
		
		// arr_img=new PImage[mframe];
		// for(int i=0;i<mframe;++i){
		// 	arr_img=loadImage(file_name+"_"+nf(i,5)+".png");
		// }

	}
	public void update(){
		if(!isplaying) return;
		if(icur_frame<mframe) icur_frame+=frame_vel;
		if(icur_frame>=mframe){
			if(looped) icur_frame=0;
			else isplaying=false;
		}
	}

	public void play(){
		icur_frame=0;
		resume();
	}
	public void pause(){
		isplaying=false;
	}
	public void resume(){
		isplaying=true;
	}
	public void draw(PGraphics pg,float x,float y,PImage seq_img){
		//pg.image(arr_img[icur_frame],x,y);
		pg.image(seq_img,x,y);
	}


}





// final String SERVER_IP="210.65.11.248:5055";
final String SERVER_IP="192.168.2.226:5055";

public class PhotonClient extends LoadBalancingClient implements Runnable{
	
	static final String LOG_TAG="PhotonClient";
	private int m_eventCount;
    boolean is_connected=true;
    boolean isReconnecting=false;

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
					Thread.sleep(40);
				}catch(InterruptedException e){
					e.printStackTrace();
				}	

                // reconnect when disconnected!
                if(!OFFLINE && !is_connected && !isReconnecting){
                    Timer timer=new Timer();
                    TimerTask task=new TimerTask(){
                        @Override
                        public void run(){
                            connect();
                        }
                    };
                    timer.schedule(task, 3000);
                    println(">>> Reconnect in 3 sec");
                    isReconnecting=true;
                }
			}
		}else{
			println("Connection Fail!");
		}
		
	}
	public boolean connect(){
		this.loadBalancingPeer=new LoadBalancingPeer(this,ConnectionProtocol.Udp);
		if(this.loadBalancingPeer.connect(SERVER_IP, "STGameB")){
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


        println("--------- Send Score : "+score1+" / "+score2+" ----------");
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
                is_connected=true;
                break;
            case Disconnect:
                println("Disconnect!");
                is_connected=false;
                isReconnecting=false;
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
            case Server_Login_Success:
                sendIsLedEvent();
                break;
            case Server_Game_Info:
                setGame((Integer)params.get((byte)1));
                break;
            case Server_LConnected:
                setGame((Integer)params.get((byte)1));
                println("Connected as LED");
                break;
            // case Server_Score_Success:
            //     println("Set Score Success");
            //     break;
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
    String[] appletArgs = new String[] { "STAppDisplay" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
