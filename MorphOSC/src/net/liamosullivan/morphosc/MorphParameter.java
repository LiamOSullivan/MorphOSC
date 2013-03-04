package net.liamosullivan.morphosc;

import processing.core.PVector;
import processing.core.PConstants;
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
	PVector p; //position of original controller
	PVector size; //size of original controller
	SelectZone slz;
	ValueZone vlz;
	SafeZone sfz;
	private PVector szPosition;
	private int padding  = 20;

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

		slz = new SelectZone(parent, (float)(this.p.x + this.size.x + padding), (float)(p.y - this.size.y*0.5),
				(float)padding, (float)padding);

	}
	
	SelectZone getSelectZone(){
		return slz;
		
	}
	
	void setValueZone(){

		vlz = new ValueZone(parent, (float)(this.p.x - 2*padding), (float)(p.y - this.size.y*0.5),
				(float)padding, (float)padding);

	}
	
	ValueZone getValueZone(){
		return vlz;
		
	}
//	void addSafeZone(){
//
//		sfz = new SafeZone(parent, (float)(this.p.x), (float)(p.y),
//				(float)padding*2, (float)padding*2);
//
//	}

	void display(){
		//Display a colour swatch next to controller at SelectZone 
		parent.rectMode(0); //0 for CORNER, 3 for CENTER
		parent.noStroke();
		parent.fill(this.c);
		slz.display();
		parent.stroke(this.c);
		parent.noFill();
		vlz.display();
		parent.rectMode(3); //0 for CORNER, 3 for CENTER
//		parent.stroke(255,200);
////		parent.noFill();
//sfz.display();
//		parent.noStroke();
		//parent.rect(sz.szx, sz.szy, sz.size.x, sz.size.x);  
	}

}
