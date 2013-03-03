package net.liamosullivan.morphosc;

import processing.core.PVector;
import processing.core.PApplet;

public class MorphParameter
{
	PApplet parent;
	int id;
	String name;
	String address;
	float value;
	float mx;
	float mn;
	float lastValue;
	int c;
	PVector p; //position
	PVector size; //size
	SelectZone slz;
	SafeZone sfz;
	private PVector szPosition;
	private int padding  = 10;

	MorphParameter(PApplet par_, int id_, String name_)
	{
		this.parent=par_;
		this.id = id_;
		this.name = name_;

	}

	void setId(int id_)
	{
		this.id = id_;
	}

	int getId() {
		return this.id;
	}
	
	void setName(String n_)
	{
		this.name = n_;
	}

	String getName() {
		return this.name;
	}

	PVector getPosition() {
		return this.p;
	}

	void setPosition(PVector p_) {
		this.p = p_;
	}

	void setSize(PVector p_) {
		this.size = p_;
	}

	PVector getSize() {
		return this.size;
	}

	float getValue() {
		return this.value;
	}

	void setValue(float v_) {
		this.value = v_;
	}

	int getColor() {
		return this.c;
	}

	void setColor(int c_) {
		this.c = c_;
	}

	float getMax() {
		return this.mx;
	}

	void setMax(float f) {
		this.mx = f;
	}

	float getMin() {
		return this.mn;
	}

	void setMin(float f) {
		this.mn = f;
	}

	void setControllerColor()
	{
	}

	void setSelectZone(){

		slz = new SelectZone(parent, (float)(this.p.x + this.size.x + padding), (float)(p.y + this.size.y*0.5),
				(float)padding*2, (float)padding*2);

	}
	SelectZone getSelectZone(){
		return slz;
		
	}
//	void addSafeZone(){
//
//		sfz = new SafeZone(parent, (float)(this.p.x), (float)(p.y),
//				(float)padding*2, (float)padding*2);
//
//	}

	void display(){
		//Display a colour swatch next to controller at SelectZone 
		parent.noStroke();
		parent.fill(this.c);
		slz.display();
//		parent.stroke(255,200);
//		parent.noFill();
//		sfz.display();
//		parent.noStroke();
		//parent.rect(sz.szx, sz.szy, sz.size.x, sz.size.x);  
	}

}
