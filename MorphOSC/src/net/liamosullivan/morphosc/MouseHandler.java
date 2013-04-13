package net.liamosullivan.morphosc;

import controlP5.ControlEvent;
import controlP5.Controller;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;
import processing.core.PApplet;
import processing.core.PImage;
import processing.core.PConstants;
import processing.core.PVector;
import processing.event.KeyEvent;
import processing.event.MouseEvent;

public class MouseHandler {

	MorphOSC parent;
	PVector mouseVector;
	protected MouseHandler(MorphOSC parent_) {
		parent = parent_;
	}


	protected void pressed(PVector v_) {
		PVector v = v_;
		setMouseVector(v);
		if (parent.guiIsLocked) { // Gestures cause interpolated output when GUI is
			// locked
			boolean keepChecking = true;
			for (int i = 0; i < parent.nSafeZones && keepChecking; i += 1) { 
				SafeZone sz = parent.sZoneList.get(i);
				if (sz.select(v)) {
					//					System.out.println("Safe Zone " + sz.getId() + " selected");
					if(sz.getId()==0){ //safe 0 is GUI lock toggle
						parent.guiIsLocked=!parent.guiIsLocked;
					}
					keepChecking = false;

				}
			}
			//Press on layers when locked to produce interpolated values
			//from anchors.
			for (int i = parent.nMLayers - 1; i >= 0 && keepChecking; i--) {
				MorphLayer ml = parent.mlList.get(i);
				if (ml.select(v)) {
					//					System.out.print("Layer " + i + " selected");
					//					System.out.println(" has " + ml.getNMAs() + " anchors");
					String msg = "l"+i;
					if(ml.getNMAs()>1){ //only try to interpolate if 2 or more anchors present in layer.
						MorphParameter [] interps = ml.interpolate(v);
						//System.out.print("Interp Values :");

						for(int j=0;j<interps.length;j+=1){
							//							System.out.print("\t " 						//Interpolated output!!!
							//									+interps[i].getName() +"\t "
							//									+interps[i].getId() +"\t "
							//									+PApplet.nf(interps[j].getValue(), 2, 2)+"\t "
							//									);
							msg+="\t"+"p"+interps[i].getId();							
							msg+="\t"+interps[j].getValue();


						}
						//System.out.println();
						msg+="\n";
						relayOSCMessage(msg);
					}

				}
				keepChecking = false; //place inside above condition?
			}
			if (keepChecking) {
				// System.out.println(" Free space ");
			}

		} else if (!parent.guiIsLocked) {
			boolean keepChecking = true;
			// Check if over a SafeZone (GUI elements which exist in MorphOSC
			// object)
			for (int i = 0; i < parent.nSafeZones && keepChecking; i += 1) { 
				SafeZone sz = parent.sZoneList.get(i);
				if (sz.select(v)) {
					//					System.out.println("Safe Zone " + sz.getId() + " selected");
					if(sz.getId()==0){ //safe 0 is GUI lock toggle
						parent.guiIsLocked=!parent.guiIsLocked;

					}
					keepChecking = false;

				}
			}
			// Check if over a SelectZone (GUI elements which exist in
			// MorphParamater objects)
			for (int i = 0; i < parent.nMParams && keepChecking; i += 1) {
				MorphParameter mp = parent.mpList.get(i);
				SelectZone slz = mp.getSelectZone();
				if (slz.select(v)) {
					//					System.out.println(" MorphParameter " + mp.getId()
					//							+ " selected");
					parent.isDraggingMParameter = true;
					parent.dragMParamID = i;
					keepChecking = false;

				}
			}
			// Check if over a ValueZone (GUI elements in MorphParamater objects
			// that hold the current MP value)
			for (int i = 0; i < parent.nMParams && keepChecking; i += 1) {
				MorphParameter mp = parent.mpList.get(i);
				ValueZone vlz = mp.getValueZone();
				if (vlz.select(v)) {
					//					System.out.println(" MorphParameter value id" + mp.getId()
					//							+ " selected");
					parent.isDraggingMPValue = true;
					parent.draggingMPValue = i;
					parent.mpValue = parent.cList.get(i).getValue(); // get the value from the
					// controller
					//System.out.println(" MPValue is:  " + mpValue);
					keepChecking = false;

				}
			}
			// Check if over a MorphLayer Handle
			for (int i = parent.nMLayers - 1; i >= 0 && keepChecking; i--) { 
				MorphLayer tl = parent.mlList.get(i);
				if (tl.selectHandle(v)) {
					//					System.out.println(" Layer " + i + " Handle selected");
					keepChecking = false;
					parent.resizeLayer = i;
					parent.layerIsResizing = true;
				}
			}
			// Check if over a MorphLayer Bar
			for (int i = parent.nMLayers - 1; i >= 0 && keepChecking; i--) {
				MorphLayer tl = parent.mlList.get(i);
				if (tl.selectBar(v)) {
					//	System.out.println(" Layer " + i + " bar selected");
					keepChecking = false;
					parent.movingLayer = i;
					parent.layerIsMoving = true;
					tl.setStartPosition(v);
				}
			}
			// Check if over a MorphLayer 
			for (int i = parent.nMLayers - 1; i >= 0 && keepChecking; i--) {
				MorphLayer tl = parent.mlList.get(i);
				if (tl.select(v)) {
					//System.out.println(" Layer " + i + " selected");
					// Check if over a MorphAnchor on this layer
					ArrayList mal = tl.getMAList();   
					for(int j =0;j<mal.size();j+=1)
					{
						MorphAnchor ma = (MorphAnchor) mal.get(j);
						if (ma.select(PVector.sub(v, tl.getPosition()))){
							System.out.println("Selecting MA #"+ma.getId()+" on layer #"+tl.id);
							parent.isDraggingMAnchor = true;
							parent.dragMAnchorID[0] = tl.id; //anchor layer
							parent.dragMAnchorID[1] = ma.getId(); //anchorID
						}

					}
					keepChecking = false;
				}
			}
			if (keepChecking) {
				if (parent.showMenu) {// && v.x>(width-groupW)) {
					// Hack to ignore click over open settings menu
					// TO DO: Add ability to drag-and-drop parameters from here
				} else {
					//					System.out.println(" Left-Click in free space ");
					parent.addMorphLayer(v);
				}
			} else {
				// do nothing if keepChecking is false
			}
		}
		// System.out.println("MousePressed");
	}

	protected void released(PVector v_) {
		PVector v = v_;
		setMouseVector(v);

		if(parent.isDraggingMAnchor){
			//if anchor has been dragged off the layer, destroy it, recalculate interpolation space.
			MorphLayer tl = parent.mlList.get(parent.dragMAnchorID[0]);
			// Check if over a MorphAnchor on this layer
			ArrayList mal = tl.getMAList();   
			for(int j =0;j<mal.size();j+=1){
				if (!tl.select(v)) {
					tl.removeMorphAnchor(parent.dragMAnchorID[1]);	
					break;
				}
			}
			parent.isDraggingMAnchor = false;
			parent.dragMAnchorID[0] = -1;
			parent.dragMAnchorID[1] = -1;

		}

		if (parent.isDraggingMParameter) {
			MorphParameter mpDrag = parent.mpList.get(parent.dragMParamID);
			for (int i = 0; i < parent.mlList.size(); i += 1) {
				MorphLayer ml = parent.mlList.get(i);
				if (ml.select(v)) {
					ml.addMorphParameter(mpDrag);
				}
			}
			parent.isDraggingMParameter = false;
		}
		// dragging a MP value box to a layer...
		if (parent.isDraggingMPValue) {
			boolean keepChecking = true;
			MorphParameter mpVDrag = parent.mpList.get(parent.draggingMPValue);
			mpVDrag.setValue(parent.mpValue);
			//System.out.println("Value of mpVDrag is "+mpValue);
			// check if mouse released over any layers
			for (int i = 0; i < parent.mlList.size(); i += 1) {
				MorphLayer ml = parent.mlList.get(i);
				if (ml.select(v)) {
					//Get parent.mpList and maList list for the layer(s)
					ArrayList mpl = (ArrayList)ml.getMPList();
					ArrayList mal = (ArrayList)ml.getMAList();
					//1. new MP is NOT in layer, there are NO MPs in Layer, there are NO anchors
					//add new MP to layer, add MP to new MA, add MA to Layer
					if (!mpl.contains(mpVDrag)&& mpl.size()==0 && mal.size()==0) {
						//						System.out
						//						.println("MorphParameter to be added to Layer "
						//								+ i);
						ml.addMorphParameter(mpVDrag);
						//No MPs means no existing anchors, so just
						//Add an anchor and add the MP and value to it...
						MorphAnchor maNew = new MorphAnchor(mal.size(), v); //id and position vector
						maNew.addMorphParameter(mpVDrag);
						maNew.setMorphParameterValueById(mpVDrag.getId(), parent.mpValue);
						System.out.println("MorphAnchor #"+maNew.getId()+" to be added to Layer #"+ i);
						ml.addMorphAnchor(maNew); //adds MA to maList


					}

					//2. new MP is NOT in layer, there ARE MPs in Layer, there are NO anchors 
					//add new MP to layer, add existing MPs (with values) to new anchor, add anchor 
					else if (!mpl.contains(mpVDrag) && mpl.size()>0 && mal.size()==0){
						ml.addMorphParameter(mpVDrag); 
						MorphAnchor maNew = new MorphAnchor(mal.size(), v);
						//System.out.println("Adding existing MPs to new Anchor");
						for(int j=0;j<mpl.size();j+=1){
							MorphParameter mpExists = (MorphParameter)mpl.get(j);  //TODO: get rid of cast
							maNew.addMorphParameter(mpExists);
							maNew.setMorphParameterValueById(mpExists.getId(),mpExists.getValue()); //TODO: determine how to set values of MPs with existing MAs
						}
						ml.addMorphAnchor(maNew); //adds MA to maList
					}

					//3. new MP is NOT in layer, there ARE MPs in Layer, there are ARE anchors 
					//add new MP, add existing MPs to new MA, update all MAs with new MP, add MA 
					else if (!mpl.contains(mpVDrag) && mpl.size()>0 && mal.size()>0){
						ml.addMorphParameter(mpVDrag); 
						MorphAnchor maNew = new MorphAnchor(mal.size(), v);
						//Add all MPs to new MA
						for(int j=0;j<mpl.size();j+=1){
							MorphParameter mpExists = (MorphParameter)mpl.get(j);  //TODO: get rid of cast
							maNew.addMorphParameter(mpExists);
							maNew.setMorphParameterValueById(mpExists.getId(),mpExists.getValue()); //TODO: determine how to set values of MPs with existing MAs
							//							System.out.println("Existing MP #"+mpExists.getId()+" has value "+mpExists.getValue());
						}
						//update all anchors with all other params
						for(int j=0;j<mal.size();j+=1){
							MorphAnchor a = (MorphAnchor)mal.get(j);
							ArrayList ampl = (ArrayList) a.getMPList();
							if(!ampl.contains(mpVDrag)){   //TODO: does contains work okay here? What about values?
								a.addMorphParameter(mpVDrag);

							}
						}

						ml.addMorphAnchor(maNew); //adds MA to maList

					}
					//4. MP in layer, so MPList size >0, but NO anchors
					//
					else if (mpl.contains(mpVDrag) && mal.size()==0){
						MorphAnchor maNew = new MorphAnchor(mal.size(), v);
						for(int j=0;j<mpl.size();j+=1){
							MorphParameter mpExists = (MorphParameter)mpl.get(j);  //TODO: get rid of cast
							maNew.addMorphParameter(mpExists);
							maNew.setMorphParameterValueById(mpExists.getId(),mpExists.getValue()); //TODO: determine how to set values of MPs with existing MAs
							//System.out.println("Existing MP #"+mpExists.getId()+" has value "+mpExists.getValue());
						}
						ml.addMorphAnchor(maNew); //adds MA to maList
					}
					//5. MP in layer, there ARE anchors
					//TODO: Add ability to drop values on existing anchors here
					else if (mpl.contains(mpVDrag) && mal.size()>0){
						//check if over an anchor, if so set the MP value, if not create anchor
						boolean foundAnchor =false;
						//TODO: use getter method instead of accessing maList
						for(i=0; i<ml.getMAList().size();i+=1 ){
							ArrayList mas = ml.getMAList();
							MorphAnchor ma = (MorphAnchor)mas.get(i);
							if(ma.select(PVector.sub(v, ml.getPosition()))){
								ma.setMorphParameterValueById(mpVDrag.getId(), parent.mpValue);
								System.out.println("Over existing anchor!");
								foundAnchor =true;
							}
						}
						if(!foundAnchor){
							MorphAnchor maNew = new MorphAnchor(mal.size(), v);
							for(int j=0;j<mpl.size();j+=1){
								MorphParameter mpExists = (MorphParameter)mpl.get(j);  //TODO: get rid of cast
								maNew.addMorphParameter(mpExists);
								maNew.setMorphParameterValueById(mpExists.getId(),mpExists.getValue()); //TODO: determine how to set values of MPs with existing MAs
								//System.out.println("Existing MP #"+mpExists.getId()+" has value "+mpExists.getValue());
							}
							ml.addMorphAnchor(maNew); //adds MA to maList
							//update all anchors with all other params
						}
						for(int j=0;j<mal.size();j+=1){
							MorphAnchor a = (MorphAnchor)mal.get(j);
							ArrayList ampl = (ArrayList) a.getMPList();
							if(!ampl.contains(mpVDrag)){   //TODO: does contains work okay here? What about values?
								a.addMorphParameter(mpVDrag);

							}
						}
					}

				}
			}

			parent.isDraggingMPValue = false;
		}

		if (parent.layerIsResizing) {
			MorphLayer tl = parent.mlList.get(parent.resizeLayer);
			parent.layerIsResizing = false;
		}
		parent.layerIsMoving = false;

		// TODO: make this more efficient by keeping track of dragged layers
		// rather than brute force
		for (int i = 0; i < parent.mlList.size(); i += 1) {
			MorphLayer tl = parent.mlList.get(i);
			tl.isDraggingOnLayer = false;
		}

	}

	protected void clicked(PVector v_) {
		PVector v = v_;
		setMouseVector(v);
	}

	protected void dragged(PVector v_) {
		PVector v = v_;
		setMouseVector(v);
		if (parent.guiIsLocked) {
			for (int i = parent.nMLayers - 1; i >= 0; i--) { 
				MorphLayer ml = parent.mlList.get(i);
				if (ml.select(v)) {
					ml.isDraggingOnLayer = true;
					//Drag on layer when locked to produce interpolated values
					//from anchors.
					if (ml.select(v)) {
						String msg = "l"+i;
						//						System.out.print("Layer " + i + " selected");
						//						System.out.println(" has " + ml.getNMAs() + " anchors");
						if(ml.getNMAs()>1){ //only try to interpolate if 2 or more anchors present in layer.
							MorphParameter [] interps = ml.interpolate(v);
							//System.out.print("Interp Values :");
							for(int j=0;j<interps.length;j+=1){
								//								System.out.print("\t "
								//										+interps[i].getName() +"\t "
								//										+interps[i].getId() +"\t "
								//										+PApplet.nf(interps[j].getValue(), 2, 2)+"\t "
								//										);

								msg+="\t"+"p"+interps[i].getId();							
								msg+="\t"+interps[j].getValue();


							}
							msg+="\n";
							relayOSCMessage(msg);

						}

					}
				}

				else {
					ml.isDraggingOnLayer = false;
				}

			}//end for loop
		} 
		else if (!parent.guiIsLocked) {
			if (parent.layerIsMoving) {
				MorphLayer tlMove = parent.mlList.get(parent.movingLayer);
				tlMove.move(v);

			}
			if (parent.layerIsResizing) {
				MorphLayer tlResize = parent.mlList.get(parent.resizeLayer);
				tlResize.resize(v);
			}
			if (parent.isDraggingMAnchor) {
				MorphAnchor ma = parent.getMAFromLayerById(parent.dragMAnchorID[0], parent.dragMAnchorID[1]);
				ma.move(PVector.sub(v, parent.mlList.get(parent.getMLayerIndexById(parent.dragMAnchorID[0])).getPosition()));
				System.out.println("Dragging MorphAnchor");
			}


		}

	}

	protected void moved(PVector v_) {
		PVector v = v_;
		setMouseVector(v);
		boolean keepChecking = true;
		for (int i = parent.nMLayers - 1; i >= 0 && keepChecking; i--) { 
			MorphLayer tl = parent.mlList.get(i);
			if (tl.selectHandle(v)) {
				//				System.out.println("Over handle " + tl.handleId
				//						+ " for layer id " + tl.id);
				tl.isOverHandle = true;
				tl.isOverLayer = true;
				keepChecking = false;
			} else {
				tl.isOverHandle = false;
				tl.isOverLayer = false;
			}
		}
		for (int i = parent.nMLayers - 1; i >= 0 && keepChecking; i--) {
			MorphLayer tl = parent.mlList.get(i);
			if (tl.selectBar(v)) {
				// println(" Over Layer "+i);
				// overLayer = i;
				tl.isOverLayerBar = true;
				// tl.isOverHandle = false;
				keepChecking = false;
			} else {
				tl.isOverLayerBar = false;
				// tl.isOverHandle = false;
			}
		}
	}



	void setMouseVector(PVector mv_) {
		mouseVector = mv_;

	}

	PVector getMouseVector() {

		return mouseVector;

	}

	private void relayOSCMessage(String msg_){
		String msg=msg_;
		parent.relayOSCMessage(msg);

	}

}
