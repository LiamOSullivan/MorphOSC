package net.liamosullivan.morphosc;

import processing.core.PApplet;
import processing.core.PVector;

public class SafeZone extends Zone {
	int id;

	SafeZone(PApplet parent_, int id_, float x_, float y_, float w_, float h_){
		super(parent_, x_, y_, w_, h_);
		id=id_;

	}
	SafeZone(PApplet parent_, int id_, PVector p_, PVector s_){
		super(parent_, p_, s_);
		id=id_;

	}
	void display(){
		parent.strokeWeight(2);
		parent.rect(this.x,this.y,this.width,this.height);
		
	}
	
	
}
