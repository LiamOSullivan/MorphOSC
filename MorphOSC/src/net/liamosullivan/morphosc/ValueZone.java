package net.liamosullivan.morphosc;

import processing.core.PApplet;
import processing.core.PVector;

public class ValueZone extends Zone {

	float value;

	public ValueZone(PApplet parent_, float x_, float y_, float w_, float h_, float val_) {
		super(parent_, x_, y_, w_, h_);
		value = val_;
		// TODO Auto-generated constructor stub
	}

	public ValueZone(PApplet parent_, PVector pos_, PVector size_) {
		super(parent_, pos_, size_);
		// TODO Auto-generated constructor stub
	}

	float getValue(){
		return value;		

	}

	void setValue(float v_){
		this.value = v_;	
		//System.out.println("Value Zone updated");

	}

	void display(){
		parent.rect(this.x,this.y,this.width,this.height);
		parent.fill(255,200);
		parent.textSize(this.size.y/2);
		//parent.textAlign(0);
		parent.text(parent.nf(value, 3, 1), this.x+2,this.y+this.size.y/2);
	}

}
