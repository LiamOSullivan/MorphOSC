package net.liamosullivan.morphosc;

import processing.core.PApplet;
import processing.core.PVector;

public class ValueZone extends Zone {

	public ValueZone(PApplet parent_, float x_, float y_, float w_, float h_) {
		super(parent_, x_, y_, w_, h_);
		// TODO Auto-generated constructor stub
	}

	public ValueZone(PApplet parent_, PVector pos_, PVector size_) {
		super(parent_, pos_, size_);
		// TODO Auto-generated constructor stub
	}
	
	void display(){
		parent.rect(this.x,this.y,this.width,this.height);
	}

}
