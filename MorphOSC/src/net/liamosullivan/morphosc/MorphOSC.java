package net.liamosullivan.morphosc;

import controlP5.ControlEvent;
import controlP5.Controller;
import controlP5.Toggle;
import controlP5.Slider;
import controlP5.ControlP5;
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
	ControlP5 cp5;
	//OscP5 oscP5;
	// Defaults
	int maxMParams = 64;
	int nMParams = 0;
	int maxMLayers = 5;
	int nMLayers = 0;
	int mLayerW = 100, mLayerH = 100; // default dimensions of added MorphLayers

	// Display assets
	private float lockX, lockY; // position of the GUI lock/unlock button
	int lockImageScale = 4;
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
	public boolean useControlFrame= false;
	public boolean useSoftwareBus = false; //sends data back to sketch
	public boolean useOSCAgent = false; //sends data out via OSCAgent

	MorphOSCView gui;

	// Interaction flags
	public boolean IsLocked = false;
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

	private MorphOSCController moscController;
	protected OSCAgent oscA;
	//protected ControllerFrame GUI;

	public MorphOSC(PApplet p_){

		parent = p_;
		cp5 = new ControlP5(parent);
	

		parent.registerMethod("pre", this);
		parent.registerMethod("draw", this);
		parent.registerMethod("dispose", this);
		parent.registerMethod("mouseEvent", this);
		parent.registerMethod("keyEvent", this);
		addMouseHandler();
		addMorphOSCView();
		//		if(useControlFrame){
		//			GUI.addControlFrame("2", 500,500);
		//		}
		//oscP5 = new OscP5(this,8001);
		addOSCAgent();



	}


	public PVector getLockPosition() {
		PVector lk = new PVector(lockX, lockY);
		return lk;

	}

	public void setLockPosition(int lkx_, int lky_) {
		lockX = lkx_;
		lockY = lky_;

	}

	public void addController(Controller c_) {
		if (nMParams < maxMParams  && c_ instanceof Slider) {
			Controller c = c_;
			cList.add(c);
			
			Parser pr = new Parser(parent);
			MorphParameter mp = pr.parseController(c);
			mp.setId(nMParams);
			mpList.add(mp);
			nMParams += 1;
			addSafeZone(c);
			

		} else {
			System.out.println("Can't add Controller, maximum reached");
		}
	}

	public void addAllControllers(ControlP5 cp5In) {
		List controllerList = cp5In.getAll();
		for(int i=0;i<controllerList.size();i+=1){
			if(controllerList.get(i) instanceof Slider){
				Controller c = (Controller)controllerList.get(i);
				addController(c);
			}
		}

	}
	
	void addSafeZone(Controller c){
		SafeZone sz = new SafeZone(parent, sZoneList.size(), c.getPosition().x, 
				c.getPosition().y,(float) c.getWidth(), (float) c.getHeight()); 
		sz.setId(sZoneList.size());
		sZoneList.add(sz); 
		System.out.println("Safe Zone #"+sz.getId()+" added to controller #"+c.getId()
				+" @ ("+sz.getPosition().x+", "+sz.getPosition().y+")");

	}


	void addMorphLayer(PVector v_) {
		// Used at runtime and called from mousePressed in this class only
		PVector v = v_;
		int mlx = (int) v.x;
		int mly = (int) v.y;
		if (nMLayers < maxMLayers) {
			// MorphLayer(PApplet p_, int id_, int x_, int y_, int w_, int h_,
			// int dispW_, int dispH_)
			MorphLayer ml = new MorphLayer(parent, nMLayers, mlx, mly, mLayerW,
					mLayerH, parent.width, parent.height);
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
					mLayerH, parent.width, parent.height);
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
					hIn, parent.width, parent.height);
			mlList.add(ml);
			nMLayers += 1;
			System.out.println("MorphLayer added @: (" + mlx + ", " + mly
					+ "), now there are " + nMLayers);

		} else {
			System.out.println("Can't add Morph Layer, maximum reached");
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
		IsLocked = set_;
	}

	protected boolean getGUILockStatus(){
		return IsLocked;

	}


	public void pre() {
		parent.background(0);


	}

	public void draw() {
		gui.draw();
		// System.out.println("Draw called");
	}

	public void mouseEvent(MouseEvent e_)

	{	MouseEvent e = e_;
	PVector v = new PVector(e.getX(), e.getY());
	// System.out.println("mouseEvent() called with action "+e.getAction());
	switch (e.getAction()) {

	case MouseEvent.PRESS:
		moscController.pressed(v);
		break;
	case MouseEvent.RELEASE:
		moscController.released(v);
		break;
	case MouseEvent.CLICK:
		moscController.clicked(v);
		break;
	case MouseEvent.DRAG:
		moscController.dragged(v);
		break;
	case MouseEvent.MOVE:
		moscController.moved(v);
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

	protected void addMouseHandler(){
		moscController = new MorphOSCController(this);

	}

	protected void setMouseVector(PVector mv_) {
		mouseVector = mv_;

	}

	protected PVector getMouseVector() {
		return mouseVector;

	}

	private void addMorphOSCView(){
		gui= new MorphOSCView(parent, this);		
	}

	private void addOSCAgent(){
		oscA = new OSCAgent(this);

	}

	protected void relayOSCMessage(OscMessage msg_){
		oscA.setMessage(msg_);
		oscA.send();
	}

	public void setUseSoftwareBus(boolean in){
		useSoftwareBus=in;	
	}

	public boolean getUseSoftwareBus(){
		return useSoftwareBus;	
	}

	public void setUseOSCAgent(boolean in){
		useOSCAgent=in;	
	}

	public boolean getUseOSCAgent(){
		return useOSCAgent;	
	}

	

}
