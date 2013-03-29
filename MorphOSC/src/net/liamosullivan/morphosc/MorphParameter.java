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
	float value; //the 'current' value
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
		//setVZValue(value);
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

	void addSelectZone(){

		slz = new SelectZone(parent, (float)(this.p.x - padding), (float)(p.y),
				(float)padding, (float)this.size.y);

	}

	SelectZone getSelectZone(){
		return slz;

	}

	protected void addValueZone(){
		vlz = new ValueZone(parent, (float)(this.p.x + this.size.x+padding), p.y,
				padding*1.5F, (float)this.size.y, value);

	}
	
	protected ValueZone getValueZone(){
		return vlz;
		
	}

	protected float getVZValue(){
		return value;

	}

	protected void setVZValue(float v_){
		vlz.setValue(v_);

	}


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
	}

}
