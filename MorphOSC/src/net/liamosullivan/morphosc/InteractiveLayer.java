package net.liamosullivan.morphosc;


import processing.core.PApplet;
import processing.core.PConstants;
import processing.core.PFont;
import processing.core.PVector;

public class InteractiveLayer
implements PConstants
{
	PApplet parent;
	int id;
	float lWidth;
	float lHeight;
	float halfWidth;
	float halfHeight;
	float lx;
	float ly;
	//PVector position;
	PVector offset;
	float xOffset;
	float yOffset;
	float xRelative;
	float yRelative;
	int fColour;
	int sColour;
	byte fOpacity;
	byte sOpacity;
	int dispWidth;
	int dispHeight;
	int noOfHandles = 4;
	int handleId = 0;
	float handleSize = 20.0F;
	float[] handleX;
	float[] handleY;
	int barH = 20;
	int barX;
	int barY;
	PFont font;
	int dialogTextSize = 12; int layerTextSize = 28;
	boolean verboseDisplay = false; boolean displayContents = true;
	boolean isOverHandle = false; boolean isOverLayer = false; boolean isOverLayerBar = false; boolean isDraggingOnLayer = false;

	InteractiveLayer(PApplet p_, int id_, int x_, int y_, int width_, int height_, int fC_, int sC_, int dispW_, int dispH_)
	{
		parent = p_;
		id = id_;
		lx = x_;
		ly = y_;

		lWidth = width_;
		lHeight = height_;
		halfWidth = (lWidth / 2);
		halfHeight = (lHeight / 2);

		fColour = fC_;
		sColour = sC_;
		dispWidth = dispW_;
		dispHeight = dispH_;
		createHandles();
		font = parent.createFont("Consolas-48.vlw", 32.0F);
	}
	
	int getId(){
		return this.id;
	}

	void createHandles() {
		handleX = new float[noOfHandles];
		handleY = new float[noOfHandles];
		halfWidth = (lWidth / 2);
		halfHeight = (lHeight / 2);
		handleX[0] = (- halfWidth);
		handleY[0] = (- halfHeight);
		handleX[1] = (halfWidth);
		handleY[1] = (- halfHeight);
		handleX[2] = (- halfWidth);
		handleY[2] = (halfHeight);
		handleX[3] = (halfWidth);
		handleY[3] = (halfHeight);
	}

	boolean select(PVector pv_) {
		PVector pv=pv_;
		if ((pv.x > lx - halfWidth) && (pv.x < lx + halfWidth) && 
				(pv.y > ly - halfHeight) && (pv.y < ly + halfHeight))
		{
			return true;
		}

		return false;
	}

	boolean selectHandle(PVector v_)
	{
		PVector v=v_;
		boolean selected = false;
		for (int i = 0; (i < noOfHandles) && (!selected); i++) {
			float disX = lx + handleX[i] - v.x;
			float disY = ly + handleY[i] - v.y;
			if (PApplet.sqrt(PApplet.sq(disX) + PApplet.sq(disY)) < handleSize / 2.0F) {
				handleId = i;
				//PApplet.println("HandleId " + handleId);
				selected = true;
			}
			else
			{
				selected = false;
			}
		}
		return selected;
	}

	boolean selectBar(PVector v_)
	{
		PVector v=v_;
		if ((v.x > lx - halfWidth) && (v.x < lx + halfWidth) && 
				(v.y > ly - halfHeight) && (v.y < ly - halfHeight + barH))
		{
			return true;
		}

		return false;
	}

	public void setStartPosition(PVector v_)
	{
		PVector v = v_;
		// offset = dist(v, position);
		xOffset = (v.x - lx);
		yOffset = (v.y - ly);

	}
	public void setContentsStartPos(PVector mv_)
	{
		//placeholder- implemented in subclass
	}

	public PVector getPosition(){

		return new PVector(lx,ly);

	}

	public void move(PVector v_)
	{ PVector v=v_;
	lx = (v.x - xOffset);
	ly = (v.y - yOffset);
	moveContents(new PVector(lx,ly));
	createHandles();
	}


	public void moveContents(PVector mv_)
	{
		//placeholder- implemented in subclass
	}

	void resize(PVector v_)
	{
		PVector v=v_;

		lWidth = PApplet.abs(2 * (lx - v.x));
		lHeight = PApplet.abs(2 * (ly - v.y));
		halfWidth = ((float)(lWidth / 2.0D));
		halfHeight = ((float)(lHeight / 2.0D));
		createHandles();
		resizeContents();
	}

	void rotate()
	{
	}

	void fixFlip()
	{
	}

	void getMorphPointRelative() {
		xRelative = (parent.mouseX - lx);
		yRelative = (parent.mouseY - ly);
	}

	public void display()
	{
		//System.out.println("Display Layer called");
		parent.colorMode(HSB, 255.0F);
		parent.strokeWeight(3.0F);
		parent.textAlign(LEFT);
		parent.textFont(font, layerTextSize);
		parent.fill(fColour);
		parent.text(id, halfWidth-layerTextSize, halfHeight-layerTextSize/2);
		parent.fill(fColour);

		if (isOverLayerBar) {
			parent.stroke(sColour);
		}
		else {
			parent.noStroke();
		}

		if (isOverHandle) {
			//System.out.println("Showing Handle");
			parent.stroke(sColour);
			parent.textFont(font, dialogTextSize);
			parent.fill(fColour);
			parent.ellipseMode(parent.CENTER);
			parent.ellipse(handleX[handleId], handleY[handleId], handleSize, handleSize);
			if (verboseDisplay) {
				parent.fill(255);
				parent.textAlign(3);
				parent.text("w: " + lWidth, lx, handleY[0]);
				parent.text("h: " + lHeight, handleX[0], ly);
				parent.text("(" + lx + ", " + ly + ")", lx, ly);
			}
		}
		if ((isDraggingOnLayer) && 
				(verboseDisplay)) {
			parent.fill(255);
			parent.textSize(dialogTextSize);
			parent.textAlign(3);
			parent.text(id + ": (" + xRelative + ", " + yRelative + ")", parent.mouseX, parent.mouseY + 12 * id);
			parent.fill(fColour);
		}
		parent.rect(0, 0, lWidth, lHeight);    //draw main layer

		parent.fill(fColour);
		parent.rect(0, (float)(-halfHeight + 0.5D * barH), lWidth, barH); //draw top window bar
		if (displayContents)
			displayContents();
	}

	void displayContents(){
		//placeholder- implemented in subclass
	}

	void resizeContents(){
		//placeholder- implemented in subclass
	}

}