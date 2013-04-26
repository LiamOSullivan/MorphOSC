package net.liamosullivan.morphosc;

import processing.core.PVector;
import processing.core.PApplet;
import processing.core.PConstants;
public class Zone {
	PApplet parent;
	int id;
	protected float x;
	protected float y;
	private PVector pos;
	protected float width;
	protected float height;
	protected PVector size;
//	private float halfWidth;
//	private float halfHeight;

	Zone(PApplet parent_, float x_, float y_, float w_, float h_)
	{

		this.parent=parent_;
		this.width=w_;
		this.height=h_;
		this.size = new PVector(width, height);
//		halfWidth=width/2;
//		halfHeight=height/2;
		this.x=x_;
		this.y=y_; //correct for drawing controls at corners
		this.pos = new PVector(x, y);

	}
	Zone(PApplet parent_, PVector pos_, PVector size_)
	{
		this.parent=parent_;
		this.size = new PVector();
		this.size.x= size_.x;
		this.size.y= size_.y;
		this.width=size.x;
		this.height=size.y;
//		halfWidth=width;
//		halfHeight=height;
		this.x=pos_.x;
		this.y=pos_.y; 
		this.pos=pos_;

	}
	
	void setId(int id_){

		id=id_;
	}

	int getId(){
		return id;

	}

	void setPosition(PVector p_){

		this.pos.x = p_.x;
		this.pos.y = p_.y-this.size.y/4;
	}

	PVector getPosition(){
		return pos;

	}

	void setSize(PVector p_){

		this.size.x = p_.x;
		this.size.y = p_.y*2;
	}

	PVector getSize(){
		return size;

	}

	boolean select(PVector pv_) {
		PVector pv=pv_;
		if ((pv.x > x ) && (pv.x < x + width) && 
				(pv.y > y ) && (pv.y < y + height))
		{
			return true;
		}

		return false;
	}

}
