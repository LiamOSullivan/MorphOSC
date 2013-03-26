package net.liamosullivan.morphosc;

import java.util.ArrayList;
import java.util.List;
import processing.core.*;

public class MorphLayer extends InteractiveLayer
{
	PApplet parentApplet;
	private ArrayList<MorphParameter> mpList = new ArrayList();
	private int nMPs = 0; //number of MPs currently in layer
	private ArrayList<MorphAnchor> maList = new ArrayList();
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
	boolean removeMPWithLastMA = true; //does what it says

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

	protected ArrayList getMPList(){

		return mpList;
	}

	protected int getNMPs(){

		return nMAs;
	}

	protected void addMorphAnchor(MorphAnchor ma_)
	{
		MorphAnchor ma = ma_;
		PVector av = ma.getPosition();
		ma.setPosition(new PVector (av.x-lx, av.y-ly)); //correct anchor position position relative to layer axes
		//ma.setMorphParameterValueById(id_, val_);
		this.maList.add(ma);
		System.out.println("MorphAnchor "+ma.getId()+" added to layer "+ this.id);

	}

	protected void removeMorphAnchor(int idRemove_) {
		//System.out.println("Remove MA call");
		int idRemove = idRemove_;
		for(int i=0; i<maList.size();i+=1){
			if(maList.get(i).getId()==idRemove){
				maList.remove(i);
				System.out.println("Removing MA#"+idRemove+"from position #"+i+" in maList");
				//if this is the last MA, remove the MP too
				if(maList.size()==0&&removeMPWithLastMA){
					//removeMorphParameter(); //TODO: handle MPs when last MA removed
				}
				break;
			}

		}


	}

	void moveMorphAnchor(int ix_, int iy_)
	{
		int ix = ix_;
		int iy = iy_;
	}
	protected ArrayList getMAList(){
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

	protected float[] interpolate(PVector p_) {
		PVector P = p_;
		//float[] iParams = new float[mpList.size()];
		float [] d = getInvDistances(P);
		float[] was = getWeightedAves(d);
		return was;


	}

	private float[] getInvDistances(PVector p_) {
		PVector pv = p_;
		pv.x=pv.x-lx; //correct for position of layer
		pv.y=pv.y-ly;
		float[] dists = new float[maList.size()];
		System.out.print("Distance Values :");
		for (int i = 0; i < maList.size(); i++) {
			MorphAnchor ma = (MorphAnchor)this.maList.get(i);
			dists[i] = PVector.dist(pv, ma.p);
			System.out.print("\t " +parent.nf(dists[i], 2, 2));
		}
		System.out.println();
		float mx = parent.max(dists);
		System.out.println("max: "+mx);
		System.out.print("Inverse Distance Values :");
		for (int i=0; i<maList.size(); i+=1) {
			dists[i] = dists[i]/mx;      //normalise
			dists[i] = 1.0F/dists[i];     //invert
			System.out.print("\t " +parent.nf(dists[i], 2, 2));
		}
		System.out.println();
		return dists;
	}

	float[] getWeightedAves(float[] d_) {
		float[] d = d_; //the normalised distances from the interpolation point to each anchor
		float[] wOut = new float[maList.get(0).getMPList().size()]; //weighted output for each parameter added to anchors
		float wSum = 0.0F;
		//Multiply MP value by weights
		System.out.print("Weighting: ");
		for (int i = 0; i < d.length; i++) {
			wSum += d[i];
			for (int j = 0; j < maList.get(0).getMPList().size(); j++) {
				MorphParameter mp = (MorphParameter) maList.get(i).getMPList().get(j);
				System.out.println("Anchor #"+i+" MP #"+mp.getId()+" has value "+mp.getValue());
				wOut[j] += d[i] * mp.getValue();
			}
		}
		for (int i = 0; i < wOut.length; i++) {
			wOut[i] /= wSum;
		}
		System.out.println();
		return wOut;
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
				//parent.text("*", ma.getPosition().x, ma.getPosition().y+(i*anchorTextSize)); 
				parent.text(ma.getMPValueByIndex(j), ma.getPosition().x, ma.getPosition().y+(j*anchorTextSize)); 
				//TODO: get rid of valueList and just use MPs, as there is an mpList for each anchor 
				//that can hold 'current' value
			}

		}
	}
}