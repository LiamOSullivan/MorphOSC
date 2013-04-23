package net.liamosullivan.morphosc;
import processing.core.*;
import java.awt.Frame;

// ControlFrame extends the PApplet class by initialising a CP5 object witin it
class ControllerFrame extends PApplet {
	int w, h;
	PApplet p;
	ControllerFrame(PApplet p_, int w_, int h_){
		p=p_;
		w=w_;
		h=h_;

	}
	public void setup() {
		//size of control frame set
		size(w, h);
		
	}

	public void draw() {
		fill(255);
		ellipse(w/2,h/2,200,200);
	}

	ControllerFrame addControlFrame(String theName, int theWidth, int theHeight) {
		Frame f = new Frame(theName);
		ControllerFrame cf = new ControllerFrame(this, theWidth, theHeight);
		f.add(cf);
		cf.init();
		f.setTitle(theName);
		f.setSize(cf.w, cf.h);
		f.setLocation(100, 100);
		f.setResizable(false);
		f.setVisible(true);
		return cf;
	}

}
