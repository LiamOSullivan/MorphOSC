package net.liamosullivan.morphosc;

import java.util.ArrayList;
import java.util.List;
import processing.core.*;
import processing.core.PFont;
import processing.core.PShape;
import processing.core.PVector;

public class MorphLayer extends InteractiveLayer
{
	PApplet parentApplet;
	List<MorphParameter> mpList = new ArrayList();
	private int nMPs = 0; //number of MPs currently in layer
	List<MorphAnchor> maList = new ArrayList();
	int nMAs = 0; //number of MAs currently in layer
	List<Float> distances = new ArrayList();

	PFont font;
	PFont boldFont;
	int textH = 22;
	int ptSize = 10;
	float PSize = 40.0F;
	int mpSwatchSize;
	int anchorTextSize = 20;
	boolean movePoint = false;

	MorphLayer(PApplet p_, int id_, int x_, int y_, int w_, int h_, int fC_, int sC_, int dispW_, int dispH_)
	{
		super(p_, id_, x_, y_, w_, h_, fC_, sC_, dispW_, dispH_);
		mpSwatchSize= barH-10;
	}

	public void addMorphParameter(MorphParameter mp_)
	{
		MorphParameter mp = mp_;
		if(!mpList.contains(mp)){
			this.mpList.add(mp);
			System.out.println("MorphParam "+mp.getId()+" added to layer "+ this.id);
			System.out.println("Current Value is "+mp.getValue());
		}
		else{
			System.out.println("MorphParam "+mp.getId()+" already in layer "+ this.id);
			System.out.println("Current Value is "+mp.getValue());
		}
	}

	public void removeMorphParameter(int idRemove_) {
		int idRemove = idRemove_;
	}

	public List getMPList(){

		return mpList;
	}

	public int getNMPs(){

		return nMAs;
	}

	public void addMorphAnchor(MorphAnchor ma_)
	{
		MorphAnchor ma = ma_;
		PVector av = ma.getPosition();
		ma.setPosition(new PVector (av.x-lx, av.y-ly)); //correct anchor position position relative to layer axes
		//ma.setMorphParameterValueById(id_, val_);
		this.maList.add(ma);
		System.out.println("MorphAnchor "+ma.getId()+" added to layer "+ this.id);
		
	}

	public void removeMorphAnchor()
	{
	}

	void moveMorphAnchor(int ix_, int iy_)
	{
		int ix = ix_;
		int iy = iy_;
	}
	List getMAList(){
		return maList;	

	}
	public int getNMAs(){

		return nMAs;
	}

	void displayInterp() {
		this.parentApplet.pushMatrix();
		this.parentApplet.translate(this.lx, this.ly);
		for (int j = 0; j < this.distances.size(); j++) {
			float f = ((Float)this.distances.get(j)).floatValue();
		}

		this.parentApplet.popMatrix();
	}

	boolean checkOnPNode(int x_, int y_) {
		for (int j = 0; j < this.maList.size(); j++) {
			MorphAnchor localMorphAnchor = (MorphAnchor)this.maList.get(j);
		}

		return false;
	}

	PShape getActiveArea() {
		PShape ps = new PShape();
		return ps;
	}

	float[] interpolate(PVector p_) {

		PVector P = p_;
		float[] iParams = new float[4];

		float[] w = getInvDistances(P);

		return iParams;
	}

	private float[] getInvDistances(PVector p_) {
		PVector pv = p_;
		float[] dists = new float[maList.size()];
		for (int i = 0; i < maList.size(); i++) {
			MorphAnchor ma = (MorphAnchor)this.maList.get(i);
			dists[i] = PVector.dist(pv, ma.p);
		}

		return dists;
	}

	float[] getWeightedAves(float[] wts_, float[][] prms_) {
		float[] wts = wts_;
		float[][] prms = prms_;
		float[] W = new float[prms[0].length];
		float wSum = 0.0F;

		for (int i = 0; i < wts.length; i++) {
			wSum += wts[i];
			for (int j = 0; j < prms[i].length; j++) {
				W[j] += wts[i] * prms[i][j];
			}
		}
		for (int i = 0; i < W.length; i++) {
			W[i] /= wSum;
		}
		return W;
	}

	@Override
	public void resizeContents()
	{
		for(int i =0;i<maList.size();i+=1){
			MorphAnchor ma = maList.get(i);

		}


	}

	@Override
	public void displayContents()
	{
		//show MorphParameters
		parent.fill(255,255,255,200);
		parent.noStroke();
		for(int i =0;i<mpList.size();i+=1){
			MorphParameter mp = mpList.get(i);
			parent.rect((i+1)*barH-halfWidth,-halfHeight + 0.5F * barH,  mpSwatchSize, mpSwatchSize);
			parent.textSize(20);
			parent.text(""+mp.getId(), (i+1)*barH-halfWidth,-halfHeight); //place MP swatches on top bar

		}
		parent.noFill();
		parent.textSize(anchorTextSize);
		parent.ellipseMode(CENTER);
		//show anchors
		for(int i =0;i<maList.size();i+=1){
			MorphAnchor ma = maList.get(i);
			parent.fill(255,255,255,200);
			parent.ellipse(ma.getPosition().x, ma.getPosition().y, 10, 10); //draw a circle at the anchor point
			//parent.text(""+ma.getPosition().x + ma.getPosition().y, ma.getPosition().x, ma.getPosition().y); 
			for(int j=0;j<ma.valueList.size();j+=1){ //TODO: change to method getValueList
				parent.stroke(255,255,255,200);
//				parent.text("*", ma.getPosition().x, ma.getPosition().y+(i*anchorTextSize)); 
				parent.text(ma.getMPValueByIndex(j), ma.getPosition().x, ma.getPosition().y+(j*anchorTextSize)); 
				//TODO: get rid of valueList and just use MPs, as there is an mpList for each anchor 
				//that can hold 'current' value
			}

		}
	}
}