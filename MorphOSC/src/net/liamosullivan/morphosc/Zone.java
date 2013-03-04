package net.liamosullivan.morphosc;

import processing.core.PVector;
import processing.core.PApplet;
public class Zone {
	PApplet parent;
	int id;
	protected float x;
	protected float y;
	private PVector pos;
	protected float width;
	protected float height;
	private PVector size;
	private float halfWidth;
	private float halfHeight;

	Zone(PApplet parent_, float x_, float y_, float w_, float h_)
	{

		parent=parent_;
		width=w_;
		height=h_;
		size = new PVector(width, height);
		halfWidth=width/2;
		halfHeight=height/2;
		x=x_;
		y=y_;
		pos = new PVector(x, y);

	}
	Zone(PApplet parent_, PVector pos_, PVector size_)
	{
		parent=parent_;
		width=size_.x;
		height=size_.y;
		this.size=size_;
		halfWidth=width;
		halfHeight=height;
		x=pos_.x;
		y=pos_.y;
		this.pos=pos_;

	}

	void setPosition(PVector p_){

		this.pos = p_;
	}

	PVector getPosition(){
		return pos;

	}

	void setSize(PVector p_){

		this.size = p_;
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
