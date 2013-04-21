package net.liamosullivan.morphosc;

import processing.core.*;
import controlP5.*;
import java.awt.Frame;
import java.awt.BorderLayout;
public class MorphView {
	PApplet parent;
	ControlFrame cf;
	ControlP5 cp5;

	public MorphView(PApplet parent_) {

		// TODO Auto-generated constructor stub
		parent = parent_;


	}

	void addControlFrame(){
		cf = addControlFrame("GUI", parent.width/2, parent.height/2 );
		
	}


}
