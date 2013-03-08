package net.liamosullivan.morphosc;

import processing.core.PApplet;
import processing.core.PVector;


public class SelectZone extends Zone {

	SelectZone(PApplet parent_, float x_, float y_, float w_, float h_){
		super(parent_, x_, y_, w_, h_);

	}
	void display(){
		parent.ellipseMode(parent.CORNER);
		parent.ellipse(this.x,this.y,this.width,this.height);
	}

}
