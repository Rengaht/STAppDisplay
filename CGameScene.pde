import org.apache.commons.codec.binary.Base64;
import java.io.File;
import java.nio.file.Files;
import java.io.FileOutputStream;


class CGameScene extends GameScene{
	
	ArrayList<FaceAvatar> afaceavatar;
	
	@Override
	void Init(){
		super.Init();
		afaceavatar=new ArrayList<FaceAvatar>();

	}

	@Override
	void Update(){

	}
	
	@Override
	void Draw(){

		pg.beginDraw();
		drawSquaresBack(pg);
		
		for(FaceAvatar face:afaceavatar) face.draw(pg);

		pg.endDraw();

	}
	@Override
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
	@Override
	int[] GetScores(){
		return new int[]{200,300};
	}


	void drawSquaresBack(PGraphics pg){
		int noise_scale=240;
		pg.noStroke();
		PVector color_separate=new PVector(1,1,0.1);
		
		for(int x=0;x<=pg.width;x+=noise_scale)
			for(int y=0;y<=pg.height;y+=noise_scale){
	    		float val=noise(x+random(-1,1),y+random(-1,1));
	    		pg.fill(val*255*color_separate.x,val*255*color_separate.y,val*20*color_separate.z);
	    		pg.rectMode(CENTER);
	    		pg.rect(x,y,noise_scale,noise_scale);
	  		}

	}
	void setFace(TypedHashMap<Byte,Object> params){

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