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
import oscP5.*;
import netP5.NetAddress;

/*TODO:
 * Add ability to drag multiple parameters to a layer at once e.g. using multi-select.


 */
public class MorphOSC implements PConstants {
	PApplet parent;
	//OscP5 oscP5;
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
	int lockImageScale = 4;

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
	boolean layerIsMoving = false, layerIsResizing = false, isOver = false;
	int movingLayer = 0;
	int resizeLayer = 0;
	int overLayer = 0;
	boolean isDraggingMParameter = false; // true if a MorphParam is
	// being dragged
	boolean isDraggingMPValue = false; // true if a MorphParam value is
	// being dragged
	int dragMParamID = 0; // id of MP or MP value
	int draggingMPValue = 0;
	// being dragged
	float mpValue = 0.0F;
	boolean isDraggingMAnchor = false;
	int [] dragMAnchorID = {-1,-1}; //id of layer and anchor
	PVector mouseVector = new PVector(0, 0);
	
	boolean addAnchorsToAllLayers = false;
	
	private MouseHandler mouseHandler;
	protected OSCAgent oscA;

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
		createMouseHandler();
		//oscP5 = new OscP5(this,8001);
		addOSCAgent();

	}

	private void initGUI() {

		try {
			locked = parent.loadImage("data/lock_lock_01_small.jpg");
			unlocked = parent.loadImage("data/lock_unlock_01_small.jpg");
		} catch (Exception e) {
			// TODO Implement catch block
			e.printStackTrace();
			System.out.println("Could not load images!");

		}
		if (guiIsLocked) {
			lockX = 50;
			lockY = parent.height-locked.height;
		} else {
			lockX = 50;
			lockY = parent.height-unlocked.height;
		}
		// SafeZones for GUI elements
		SafeZone lock = new SafeZone(parent, nSafeZones, lockX, lockY,
				(float) locked.width, (float) locked.height); //GUI lock
		lock.setId(nSafeZones);
		sZoneList.add(lock); 
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
			//System.out.println("sColours" + i + ": " + paramColors[i]);
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
			SafeZone sz = new SafeZone(parent, nSafeZones, c.getPosition().x, 
					c.getPosition().y-c.getHeight()/4,(float) c.getWidth(), (float) c.getHeight()); //GUI lock
			sz.setId(nSafeZones);
			sZoneList.add(sz); 
			//System.out.println("Safe Zone #"+sz.getId()+" added to controller #"+c.getId());
			nSafeZones += 1;
		} else {
			System.out.println("Can't add Controller, maximum reached");
		}
	}

	void addMorphLayer(PVector v_) {
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
			//			System.out.print("Controller " + i + "\t Label: " + label
			//					+ "\t Name: " + name);
			//			System.out.println("\t Address: " + add + "\t Value: " + val);
		}
	}

	private int getMPIndexById(int fid_){
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

	int getMLayerIndexById(int layerId_){
		int layerId=layerId_;
		for(int i=0; i<mlList.size();i+=1){
			if(mlList.get(i).getId()==layerId_){
				return i;
			}

		}
		return -1;


	}

	MorphAnchor getMAFromLayerById(int layerId_, int anchorId_){
		int layerId = layerId_;
		int anchorId = anchorId_;
		MorphLayer l = mlList.get(layerId);
		ArrayList<MorphAnchor> al = l.getMAList();
		MorphAnchor ma;
		int index = -1;
		for(int i=0;i<al.size();i+=1){
			ma=al.get(i);
			if(ma.getId()==anchorId){
				return ma;	
			}

		}
		return new MorphAnchor(-1,new PVector(-1,-1)); //Null MorphAnchor

	}
	
	protected void setGUILockStatus(boolean set_){
		guiIsLocked = set_;
	}
	
	protected boolean getGUILockStatus(){
		return guiIsLocked;
		
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
			parent.image(locked, lockX, lockY, locked.width,
					locked.width);
		} else {
			parent.image(unlocked, lockX, lockY, unlocked.width,
					unlocked.width);
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
			MorphParameter mpDrag = mpList.get(dragMParamID);
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
		mouseHandler.pressed(v);
		break;
	case MouseEvent.RELEASE:
		mouseHandler.released(v);
		break;
	case MouseEvent.CLICK:
		mouseHandler.clicked(v);
		break;
	case MouseEvent.DRAG:
		mouseHandler.dragged(v);
		break;
	case MouseEvent.MOVE:
		mouseHandler.moved(v);
		break;
	}
	}

	

	public void keyEvent(KeyEvent e) {
	}

	public void dispose() {
	}

	public void controlEvent(ControlEvent e){
		//
		//		System.out.println("Control event in MorphOSC from "
		//				+ e.getController().getName());
		//		System.out.println("Controller no. is "
		//				+ e.getController().getId());

		int index = getMPIndexById(e.getController().getId());
		//		System.out.println("...index is "+index);
		if(e.isController()	&& index >= 0){
			mpList.get(index).setVZValue(e.getController().getValue());
		}
	}

	protected void updateController(ControlEvent e) {


		int index = getMPIndexById(e.getController().getId());
		if(index!=-1){


		}
	}

	private void relay(){


	}
	
	protected void createMouseHandler(){
		mouseHandler = new MouseHandler(this);
	
	}
	protected void setMouseVector(PVector mv_) {
		mouseVector = mv_;

	}

	protected PVector getMouseVector() {

		return mouseVector;

	}
	private void addOSCAgent(){
		 oscA = new OSCAgent(this);
		
	}
	
	protected void relayOSCMessage(OscMessage msg_){
		oscA.setMessage(msg_);
		oscA.send();
	}
	
}
