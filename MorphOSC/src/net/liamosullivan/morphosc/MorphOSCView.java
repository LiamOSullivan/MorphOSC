package net.liamosullivan.morphosc;

import processing.core.*;
import controlP5.*;
import java.awt.Frame;
import java.awt.BorderLayout;
import processing.core.PConstants;

public class MorphOSCView {
	PApplet grandparent;
	MorphOSC parent;
	ControllerFrame cf;
	ControlP5 cp5View;
	Toggle lockToggle;

	public MorphOSCView(PApplet grandparent_, MorphOSC parent_) {

		// TODO Auto-generated constructor stub
		grandparent = grandparent_;
		parent = parent_;
		addControlP5GUI();

	}
	
	private void addControlP5GUI(){
	cp5View = new ControlP5(grandparent);
	lockToggle = cp5View.addToggle("Lock")
			.setPosition(100, grandparent.height-100)
			.setSize(25,25);
	lockToggle.setId(parent.sZoneList.size());
	SafeZone szlock = new SafeZone(grandparent, parent.sZoneList.size(), lockToggle.getPosition().x, lockToggle.getPosition().y,
			(float) lockToggle.getWidth(), (float) lockToggle.getHeight()); //GUI lock
	parent.sZoneList.add(szlock); 
	}
	
	protected void displayGUI() {
		//Display layers
		
		for (int i = 0; i < parent.mlList.size(); i += 1) {
			MorphLayer ml = parent.mlList.get(i);
			//System.out.println("Layer position: " + ml.getPosition());
			grandparent.pushMatrix();
			grandparent.translate(ml.getPosition().x, ml.getPosition().y);
			ml.display();
			grandparent.popMatrix();
		}

		//		if (IsLocked) {
		//			parent.image(locked, lockX, lockY, locked.width,
		//					locked.width);
		//		} else {
		//			parent.image(unlocked, lockX, lockY, unlocked.width,
		//					unlocked.width);
		//		}

		
		//display safe zone borders
		grandparent.stroke(255, 200);
		grandparent.noFill();
		grandparent.rectMode(PApplet.CORNER);
		for (int i = 0; i < parent.sZoneList.size(); i += 1) {
			SafeZone sfz = parent.sZoneList.get(i);
			sfz.display(); // display the safe zones around controllers (MLayers
			// etc won't be created over SafeZones)

		}
		grandparent.noStroke();
		grandparent.rectMode(PApplet.CENTER);

		if (parent.isDraggingMParameter) {
			MorphParameter mpDrag = parent.mpList.get(parent.dragMParamID);
			PVector szSize = mpDrag.getSelectZone().getSize();
			PVector mV = parent.getMouseVector();
			grandparent.fill(mpDrag.getColor());
			grandparent.rect(mV.x, mV.y, szSize.x, szSize.y); // show rect being
			// dragged with MP
			// color
		}
		if (parent.isDraggingMPValue) {
			MorphParameter mpDrag = parent.mpList.get(parent.draggingMPValue);
			PVector vzSize = mpDrag.getValueZone().getSize();
			PVector mV = parent.getMouseVector();
			grandparent.noFill();
			grandparent.stroke(mpDrag.getColor());
			grandparent.rect(mV.x, mV.y, vzSize.x, vzSize.y); // show rect being
			// dragged with MP
			// color stroke
		}

		grandparent.rectMode(PApplet.CORNER);

	}
	protected void showMParameters() {
		// parent.noStroke();
		// parent.rectMode(CORNER);
		grandparent.rectMode(PApplet.CENTER);
		for (int i = 0; i < parent.mpList.size(); i++) {
			MorphParameter mp = (MorphParameter) parent.mpList.get(i);
			mp.display();

		}

	}
	
	//For Desktop Mode
		//	private void initGUI() {
		//
		//		try {
		//			locked = parent.loadImage("data/lock_lock_01_small.jpg");
		//			unlocked = parent.loadImage("data/lock_unlock_01_small.jpg");
		//		} catch (Exception e) {
		//			// TODO Implement catch block
		//			e.printStackTrace();
		//			System.out.println("Could not load images!");
		//
		//		}
		//		if (IsLocked) {
		//			lockX = 50;
		//			lockY = parent.height-locked.height;
		//		} else {
		//			lockX = 50;
		//			lockY = parent.height-unlocked.height;
		//		}
		//		// SafeZones for GUI elements
		//		SafeZone lock = new SafeZone(parent, sZoneList.size(), lockX, lockY,
		//				(float) locked.width, (float) locked.height); //GUI lock
		//		lock.setId(sZoneList.size());
		//		sZoneList.add(lock); 
		//		sZoneList.size() += 1;
		//
		//	}


		//For Android mode
		protected void initGUI() {

			//		try {
			//			locked = parent.loadImage("data/lock_lock_01_small.jpg");
			//			unlocked = parent.loadImage("data/lock_unlock_01_small.jpg");
			//		} catch (Exception e) {
			//			// TODO Implement catch block
			//			e.printStackTrace();
			//			System.out.println("Could not load images!");
			//
			//		}
			//		if (IsLocked) {
			//			lockX = 50;
			//			lockY = parent.height-locked.height;
			//		} else {
			//			lockX = 50;
			//			lockY = parent.height-unlocked.height;
			//		}
			//		// SafeZones for GUI elements
			//		SafeZone lock = new SafeZone(parent, sZoneList.size(), lockX, lockY,
			//				(float) locked.width, (float) locked.height); //GUI lock
			//		lock.setId(sZoneList.size());
			//		sZoneList.add(lock); 

			


		}

}
