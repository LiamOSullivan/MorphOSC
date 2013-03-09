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

public class MorphOSC implements PConstants {
	PApplet parent;
	// Defaults
	int maxMParams = 32;
	int nMParams = 0;
	int maxMLayers = 5;
	int nMLayers = 0;
	int mLayerW = 100, mLayerH = 100; // default dimensions of added MorphLayers
	int[] paramColors = new int[maxMParams];
	int[] mlFillColors = new int[maxMLayers];
	int[] mlStrokeColors = new int[maxMLayers];
	int paramOpac = 200, mlFillOpac = 100, mlStrokeOpac = 125;
	int colourPad = 10;
	// Display assets
	PImage locked, unlocked;
	private float lockX, lockY; // position of the GUI lock/unlock button

	int nSafeZones = 0;

	List<Controller> cList = new ArrayList();
	List<MorphParameter> mpList = new ArrayList();
	List<MorphLayer> mlList = new ArrayList<MorphLayer>();
	List<SafeZone> sZoneList = new ArrayList<SafeZone>();
	// List <Integer> dragIds = new ArrayList <Integer>(); //list of paramIDs
	// being dragged-and-dropped.

	// Setup options
	public boolean addLayersFromGUI = true; // add MorphLayers at runtime with
	// GUI interaction
	public boolean highlightControllers = true; // color controllers added as
	// MorphParameters

	// Interaction flags
	public boolean guiIsLocked = false;
	public boolean showMenu = false;
	private boolean isMoving = false, isResizing = false, isOver = false;
	private int movingLayer = 0, resizeLayer = 0, overLayer = 0;
	private boolean isDraggingMParameter = false; // true if a MorphParam is
	// being dragged
	private boolean isDraggingMPValue = false; // true if a MorphParam value is
	// being dragged
	private int draggingMParam = 0, draggingMPValue = 0; // id of MP or MP value
	// being dragged
	private float mpValue = 0.0F;
	private PVector mouseVector = new PVector(0, 0);

	public MorphOSC(PApplet p_) {

		parent = p_;
		initGUI();
		paramColors = generateParamColors(maxMParams);
		mlFillColors = generateLayerFills(maxMLayers);
		mlStrokeColors = generateLayerStrokes(maxMLayers);

		parent.colorMode(3, 255.0F);
		parent.rectMode(CENTER);
		parent.ellipseMode(CENTER);

		parent.registerMethod("pre", this);
		parent.registerMethod("draw", this);
		parent.registerMethod("dispose", this);
		parent.registerMethod("mouseEvent", this);
		parent.registerMethod("keyEvent", this);

	}

	private void initGUI() {
		locked = parent.loadImage("data/lock_lock_01.png");
		unlocked = parent.loadImage("data/lock_unlock_01.png");
		if (guiIsLocked) {
			lockX = parent.width - (locked.width / 2);
			lockY = locked.height / 2;
		} else {
			lockX = parent.width - (unlocked.width / 2);
			lockY = unlocked.height / 2;
		}
		// SafeZones for GUI elements
		sZoneList.add(new SafeZone(parent, nSafeZones, lockX, lockY,
				(float) locked.width / 2, (float) locked.height / 2)); //GUI lock
		nSafeZones += 1;

	}

	public PVector getLockPosition() {
		PVector lk = new PVector(lockX, lockY);
		return lk;

	}

	public void setLockPosition(int lkx_, int lky_) {
		lockX = lkx_;
		lockY = lky_;
	}

	private int[] generateParamColors(int max_) {
		int max = max_;
		int baseHue = 255 / max;
		// System.out.println("Base Hue is " +baseHue);
		int baseBright = 200;
		int baseSat = 200;
		int[] pColors = new int[max];
		for (int i = 0; i < max; i++) {
			pColors[i] = parent.color(baseHue * (i + 1), baseSat, baseBright,
					paramOpac);
			System.out.println("pColours" + i + ": " + pColors[i]);
		}

		return pColors;
	}

	private int[] generateLayerFills(int max_) {
		// ***TO DO: fix color gen for HSB space.
		int max = max_;
		int baseHue = 255 / max;
		System.out.println("Base Hue is " + baseHue);
		int baseBright = 200;
		int baseSat = 150;
		int[] fColors = new int[max];
		for (int i = 0; i < max; i++) {
			fColors[i] = parent.color(baseHue * (i + 1), baseSat, baseBright,
					mlFillOpac);
			System.out.println("fColours" + i + ": " + fColors[i]);
		}

		return fColors;
	}

	private int[] generateLayerStrokes(int max_) {
		int max = max_;
		int baseHue = 255 / max;
		int baseBright = 200;
		int baseSat = 150;
		int[] sColors = new int[max];
		for (int i = 0; i < max; i++) {
			sColors[i] = parent.color(baseHue * (i + 1), baseSat * 2,
					baseBright, mlStrokeOpac);
			System.out.println("sColours" + i + ": " + paramColors[i]);
		}

		return sColors;
	}

	public void addController(Controller c_) {
		if (nMParams < maxMParams) {
			Controller c = c_;
			cList.add(c);
			Parser pr = new Parser(parent);
			MorphParameter mp = pr.parseController(c, paramColors[nMParams]);
			mp.setId(nMParams);
			mpList.add(mp);
			nMParams += 1;
			sZoneList.add(new SafeZone(parent, nSafeZones, mp.getPosition(), 
					mp.getSize()));
			nSafeZones += 1;
		} else {
			System.out.println("Can't add Controller, maximum reached");
		}
	}

	private void addMorphLayer(PVector v_) {
		// Used at runtime and called from mousePressed in this class only
		PVector v = v_;
		int mlx = (int) v.x;
		int mly = (int) v.y;
		if (nMLayers < maxMLayers) {
			// MorphLayer(PApplet p_, int id_, int x_, int y_, int w_, int h_,
			// int fC_, int sC_, int dispW_, int dispH_)
			MorphLayer ml = new MorphLayer(parent, nMLayers, mlx, mly, mLayerW,
					mLayerH, mlFillColors[nMLayers], mlStrokeColors[nMLayers],
					parent.width, parent.height);
			mlList.add(ml);
			nMLayers += 1;
			System.out.println("MorphLayer added @: (" + mlx + ", " + mly
					+ "), now there are " + nMLayers);

		} else {
			System.out.println("Can't add Morph Layer, maximum reached");
		}

	}

	public void addMorphLayer(int x_, int y_) {
		// Used if called with 2 arguments
		int mlx = x_;
		int mly = y_;
		if (nMLayers < maxMLayers) {
			// MorphLayer(PApplet p_, int id_, int x_, int y_, int w_, int h_,
			// int fC_, int sC_, int dispW_, int dispH_)
			MorphLayer ml = new MorphLayer(parent, nMLayers, mlx, mly, mLayerW,
					mLayerH, mlFillColors[nMLayers], mlStrokeColors[nMLayers],
					parent.width, parent.height);
			mlList.add(ml);
			nMLayers += 1;
			System.out.println("MorphLayer added @: (" + mlx + ", " + mly
					+ "), now there are " + nMLayers);

		} else {
			System.out.println("Can't add Morph Layer, maximum reached");
		}

	}

	public void addMorphLayer(int x_, int y_, int wIn_, int hIn_) {
		// Used if called with 4 arguments
		int mlx = x_;
		int mly = y_;
		int wIn = wIn_;
		int hIn = hIn_;
		if (nMLayers < maxMLayers) {
			// MorphLayer(PApplet p_, int id_, int x_, int y_, int w_, int h_,
			// int fC_, int sC_, int dispW_, int dispH_)
			MorphLayer ml = new MorphLayer(parent, nMLayers, mlx, mly, wIn,
					hIn, mlFillColors[nMLayers], mlStrokeColors[nMLayers],
					parent.width, parent.height);
			mlList.add(ml);
			nMLayers += 1;
			System.out.println("MorphLayer added @: (" + mlx + ", " + mly
					+ "), now there are " + nMLayers);

		} else {
			System.out.println("Can't add Morph Layer, maximum reached");
		}

	}

	private void showMParameters() {
		// parent.noStroke();
		// parent.rectMode(CORNER);
		parent.rectMode(CENTER);
		for (int i = 0; i < mpList.size(); i++) {
			MorphParameter mp = (MorphParameter) mpList.get(i);
			mp.display();

		}

	}



	public void getControllerInfo() {
		for (int i = 0; i < cList.size(); i++) {
			Controller c = (Controller) cList.get(i);
			String label = c.getLabel();
			String name = c.getName();
			String add = c.getAddress();
			String val = Float.toString(c.getValue());
			System.out.print("Controller " + i + "\t Label: " + label
					+ "\t Name: " + name);
			System.out.println("\t Address: " + add + "\t Value: " + val);
		}
	}

	private int findMPIndexById(int fid_){
		int fid = fid_;
		int index;
		MorphParameter mp;
		for(int i =0; i<mpList.size();i+=1){
			mp = mpList.get(i);
			if(mp.getId()==fid){
				return i;	
			}
		}
		return -1;
	}

	public void pre() {
		parent.background(0);
		showMParameters();
	}

	public void draw() {

		displayGUI();
		// System.out.println("Draw called");
	}

	private void displayGUI() {

		for (int i = 0; i < mlList.size(); i += 1) {
			MorphLayer ml = mlList.get(i);

			//System.out.println("Layer position: " + ml.getPosition());
			parent.pushMatrix();
			parent.translate(ml.getPosition().x, ml.getPosition().y);
			ml.display();
			parent.popMatrix();
		}

		if (guiIsLocked) {
			parent.image(locked, lockX, lockY, locked.width / 4,
					locked.width / 4);
		} else {
			parent.image(unlocked, lockX, lockY, unlocked.width / 4,
					unlocked.width / 4);
		}

		parent.stroke(255, 200);
		parent.noFill();
		parent.rectMode(CORNER);
		for (int i = 0; i < nSafeZones; i += 1) {
			SafeZone sfz = sZoneList.get(i);
			sfz.display(); // display the safe zones around controllers (MLayers
			// etc won't be created over SafeZones)

		}
		parent.noStroke();
		parent.rectMode(CENTER);

		if (isDraggingMParameter) {
			MorphParameter mpDrag = mpList.get(draggingMParam);
			PVector szSize = mpDrag.getSelectZone().getSize();
			PVector mV = getMouseVector();
			parent.fill(mpDrag.getColor());
			parent.rect(mV.x, mV.y, szSize.x, szSize.y); // show rect being
			// dragged with MP
			// color
		}
		if (isDraggingMPValue) {
			MorphParameter mpDrag = mpList.get(draggingMPValue);
			PVector vzSize = mpDrag.getValueZone().getSize();
			PVector mV = getMouseVector();
			parent.noFill();
			parent.stroke(mpDrag.getColor());
			parent.rect(mV.x, mV.y, vzSize.x, vzSize.y); // show rect being
			// dragged with MP
			// color stroke
		}

		parent.rectMode(CORNER);

	}

	public void mouseEvent(MouseEvent e_)

	{	MouseEvent e = e_;
	PVector v = new PVector(e.getX(), e.getY());
	// System.out.println("mouseEvent() called with action "+e.getAction());
	switch (e.getAction()) {

	case MouseEvent.PRESS:
		mousePressed(v);
		break;
	case MouseEvent.RELEASE:
		mouseReleased(v);
		break;
	case MouseEvent.CLICK:
		mouseClicked(v);
		break;
	case MouseEvent.DRAG:
		mouseDragged(v);
		break;
	case MouseEvent.MOVE:
		mouseMoved(v);
		break;
	}
	}

	private void mousePressed(PVector v_) {
		PVector v = v_;
		setMouseVector(v);
		if (guiIsLocked) { // Gestures cause interpolated output when GUI is
			// locked
			boolean keepChecking = true;
			for (int i = nMLayers - 1; i >= 0 && keepChecking; i--) {
				MorphLayer tl = mlList.get(i);
				if (tl.select(v)) {
					System.out.println("Layer " + i + " selected");
					keepChecking = false;

				}
			}
			if (keepChecking) {
				// System.out.println(" Free space ");
			}
		} else if (!guiIsLocked) {
			boolean keepChecking = true;
			// Check if over a SafeZone (GUI elements which exist in MorphOSC
			// object)
			for (int i = 0; i < nSafeZones && keepChecking; i += 1) { // check
				// from
				// top
				// drawn
				// layer
				// downwards
				SafeZone sz = sZoneList.get(i);
				if (sz.select(v)) {
					System.out.println("Safe Zone " + i + " selected");
					keepChecking = false;

				}
			}
			// Check if over a SelectZone (GUI elements which exist in
			// MorphParamater objects)
			for (int i = 0; i < nMParams && keepChecking; i += 1) {
				MorphParameter mp = mpList.get(i);
				SelectZone slz = mp.getSelectZone();
				if (slz.select(v)) {
					System.out.println(" MorphParameter " + mp.getId()
							+ " selected");
					isDraggingMParameter = true;
					draggingMParam = i;
					keepChecking = false;

				}
			}
			// Check if over a ValueZone (GUI elements in MorphParamater objects
			// that hold the current MP value)
			for (int i = 0; i < nMParams && keepChecking; i += 1) {
				MorphParameter mp = mpList.get(i);
				ValueZone vlz = mp.getValueZone();
				if (vlz.select(v)) {
					System.out.println(" MorphParameter value id" + mp.getId()
							+ " selected");
					isDraggingMPValue = true;
					draggingMPValue = i;
					mpValue = cList.get(i).getValue(); // get the value from the
					// controller
					//System.out.println(" MPValue is:  " + mpValue);
					keepChecking = false;

				}
			}
			//
			for (int i = nMLayers - 1; i >= 0 && keepChecking; i--) { // check
				// from
				// top
				// drawn
				// layer
				// downwards
				MorphLayer tl = mlList.get(i);
				if (tl.selectHandle(v)) {
					System.out.println(" Layer " + i + " Handle selected");
					keepChecking = false;
					resizeLayer = i;
					isResizing = true;
				}
			}
			for (int i = nMLayers - 1; i >= 0 && keepChecking; i--) {
				MorphLayer tl = mlList.get(i);
				if (tl.selectBar(v)) {
					System.out.println(" Layer " + i + " bar selected");
					keepChecking = false;
					movingLayer = i;
					isMoving = true;
					tl.setStartPosition(v);
				}
			}
			for (int i = nMLayers - 1; i >= 0 && keepChecking; i--) {
				MorphLayer tl = mlList.get(i);
				if (tl.select(v)) {
					System.out.println(" Layer " + i + " selected");
					keepChecking = false;
					// tl.addParameterNode(int(tl.xRelative),
					// int(tl.yRelative)); //.select calls getCursor(), which
					// sets relatives
				}
			}
			if (keepChecking) {
				if (showMenu) {// && v.x>(width-groupW)) {
					// Hack to ignore click over open settings menu
					// TO DO: Add ability to drag-and-drop parameters from here
				} else {
					System.out.println(" Left-Click in free space ");
					addMorphLayer(v);
				}
			} else {
				// do nothing if keepChecking is false
			}
		}
		// System.out.println("MousePressed");
	}

	private void mouseReleased(PVector v_) {
		PVector v = v_;
		setMouseVector(v);

		if (isDraggingMParameter) {
			MorphParameter mpDrag = mpList.get(draggingMParam);
			for (int i = 0; i < mlList.size(); i += 1) {
				MorphLayer ml = mlList.get(i);
				if (ml.select(v)) {
					ml.addMorphParameter(mpDrag);
				}
			}
			isDraggingMParameter = false;
		}
		// dragging a MP value box to a layer...
		if (isDraggingMPValue) {
			boolean keepChecking = true;
			MorphParameter mpVDrag = mpList.get(draggingMPValue);
			mpVDrag.setValue(mpValue);
			//System.out.println("Value of mpVDrag is "+mpValue);
			// check if mouse released over any layers
			for (int i = 0; i < mlList.size(); i += 1) {
				MorphLayer ml = mlList.get(i);
				if (ml.select(v)) {
					//Get mpList and maList list for the layer(s)
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
						maNew.setMorphParameterValueById(mpVDrag.getId(), mpValue);
						ml.addMorphAnchor(maNew); //adds MA to maList
						//						System.out
						//						.println("MorphAnchor to be added to Layer "
						//								+ i);

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
						for(int j=0;j<mpl.size();j+=1){
							MorphParameter mpExists = (MorphParameter)mpl.get(j);  //TODO: get rid of cast
							maNew.addMorphParameter(mpExists);
							maNew.setMorphParameterValueById(mpExists.getId(),mpExists.getValue()); //TODO: determine how to set values of MPs with existing MAs
							System.out.println("Existing MP #"+mpExists.getId()+" has value "+mpExists.getValue());
						}						
						for(int j=0;j<mal.size();j+=1){
							MorphAnchor a = (MorphAnchor)mal.get(j);
							ArrayList ampl = (ArrayList) a.getMPList();
							if(!ampl.contains(mpVDrag)){   //TODO: does contains work okay here? What about values?
								a.addMorphParameter(mpVDrag);
								
							}
//							for(int k=0;k<ampl.size();i+=1){
//								MorphParameter amp = (MorphParameter) ampl.get(k);
//								if(amp.getId()!= mpVDrag.getId()){
////
//								}
//							}

						}

						ml.addMorphAnchor(maNew); //adds MA to maList


					}
					//					//if MP already in layer, but no anchors present, need to  
					//					//Add an anchor and add the MP and value to it...
					//					else if (mpl.contains(mpVDrag) && mal.size()==0){
					//						
					//						MorphAnchor maNew = new MorphAnchor(mal.size()-1, v);
					//						maNew.addMorphParameter(mpVDrag);
					//						maNew.setMorphParameterValueById(mpVDrag.getId(), mpValue);
					//						ml.addMorphAnchor(maNew); //adds MA to maList
					//												
					//					}
					//					//if new MP in layer, just add a new anchor
					//					else if (mpl.contains(mpVDrag) && mal.size()>0){
					//						MorphAnchor maNew = new MorphAnchor(mal.size()-1, v);
					//						maNew.addMorphParameter(mpVDrag);
					//						maNew.setMorphParameterValueById(mpVDrag.getId(), mpValue);
					//						ml.addMorphAnchor(maNew); //adds MA to maList
					//									
					//					}
					//					


					//					// second, now the MP is added to the layer, so add the
					//					// value to an anchor
					//					// check if there are anchors in the layer
					//					if (ml.getMAList().size() > 0) {
					//						// check if over an existing anchor
					//						//System.out.println("maList has elements");
					//						List<MorphAnchor> maL = ml.getMAList();
					//						for (int j = 0; i < maL.size() && keepChecking; i += 1) {
					//							MorphAnchor ma = maL.get(i);
					//							if (ma.select(v)) {
					//								// if over an anchor, set the value of the
					//								// appropriate MP
					//								ma.setMorphParameterValueById(mpVDrag.getId(),
					//										mpValue);
					//								keepChecking = false;
					//							}
					//						}
					//						// if not over an anchor AND there are other anchors,
					//						// need to create a new anchor
					//						// As anchor must contain all MPs for Layer, need to
					//						// find values for other MPs at the
					//						// new anchor point
					//						if (keepChecking) {
					//							MorphAnchor maNew = new MorphAnchor(ml.getNMAs(), v); // TODO:
					//							// find
					//							// interpolated
					//							// values
					//							// for
					//							// all
					//							// parameters
					//							// at
					//							// new
					//							// anchor
					//							ml.addMorphAnchor(maNew);
					//						}
					//
					//					}
					//					// if there are no anchors in the layer, can just add an
					//					// anchor and set the appropriate MP
					//					else { //
					//						
					//					}
				}
			}

			isDraggingMPValue = false;
		}

		if (isResizing) {
			MorphLayer tl = mlList.get(resizeLayer);
			isResizing = false;
		}
		isMoving = false;

		// TODO: make this more efficient by keeping track of dragged layers
		// rather than brute force
		for (int i = 0; i < mlList.size(); i += 1) {
			MorphLayer tl = mlList.get(i);
			tl.isDraggingOnLayer = false;
		}
		// isPNodeMoving=false;
		// destroyInterpNode();
	}

	private void mouseClicked(PVector v_) {
		PVector v = v_;
		setMouseVector(v);
	}

	private void mouseDragged(PVector v_) {
		PVector v = v_;
		setMouseVector(v);
		if (guiIsLocked) {
			for (int i = nMLayers - 1; i >= 0; i--) { // check from front layer
				// backwards
				MorphLayer tl = mlList.get(i);
				if (tl.select(v)) {
					// println("Left Dragging on Layer "+i);
					tl.isDraggingOnLayer = true;
					// tl.getCursor(); //returns the position of the cursor
					// relative to the current layer
					// tl.interpolate(v);
					// tl.getInvDistances();
				} else {
					tl.isDraggingOnLayer = false;
				}
			}
		} else if (!guiIsLocked) {
			if (isMoving) {
				MorphLayer tlMove = mlList.get(movingLayer);
				// tlMove.getCursor();
				// pushMatrix();
				tlMove.move(v);
				// popMatrix();
			}
			if (isResizing) {
				MorphLayer tlResize = mlList.get(resizeLayer);
				tlResize.resize(v);
			}

		}

	}

	private void mouseMoved(PVector v_) {
		PVector v = v_;
		setMouseVector(v);
		boolean keepChecking = true;
		for (int i = nMLayers - 1; i >= 0 && keepChecking; i--) { // check from
			// frontmost
			// drawn
			// layer
			// backwards
			MorphLayer tl = mlList.get(i);
			if (tl.selectHandle(v)) {
				System.out.println("Over handle " + tl.handleId
						+ " for layer id " + tl.id);
				tl.isOverHandle = true;
				tl.isOverLayer = true;
				keepChecking = false;
			} else {
				tl.isOverHandle = false;
				tl.isOverLayer = false;
			}
		}
		for (int i = nMLayers - 1; i >= 0 && keepChecking; i--) {
			MorphLayer tl = mlList.get(i);
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

	public void keyEvent(KeyEvent e) {
	}

	public void dispose() {
	}

	public void controlEvent(ControlEvent e){

		System.out.println("Control event in MorphOSC from "
				+ e.getController().getName());
		System.out.println("Controller no. is "
				+ e.getController().getId());

		int index = findMPIndexById(e.getController().getId());
		System.out.println("...index is "+index);
		if(e.isController()	&& index >= 0){
			mpList.get(index).setVZValue(e.getController().getValue());
		}
	}

	protected void updateController(ControlEvent e) {


		int index = findMPIndexById(e.getController().getId());
		if(index!=-1){


		}
	}

}
