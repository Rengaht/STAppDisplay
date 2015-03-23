class FaceAvatar{
	
	float x,y;
	PImage face_image;
	String user_name;

	FaceAvatar(float x_,float y_,String user_,PImage face_){
		x=x_; y=y_;
		face_image=face_;
		user_name=user_;

	}
	void draw(PGraphics pg){
		pg.pushMatrix();
		pg.translate(x,y);
			pg.image(face_image,0,0);
			pg.text(user_name,0,0);
		pg.popMatrix();
	}

}