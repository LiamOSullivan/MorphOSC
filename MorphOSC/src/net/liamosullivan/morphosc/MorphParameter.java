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
	boolean isVertical;

	SelectZone slz;
	ValueZone vlz;
	SafeZone sfz;
	private PVector szPosition;
	private int vPad  = 20, hPad =40; // Amount of Select/Value Zone spacing from controllerPa
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
		checkIsVertical();
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

	void addSelectZone(){
		if(!isVertical){
		slz = new SelectZone(parent, (float)(this.p.x - hPad), (float)(p.y),
				(float)hPad, (float)this.size.y);
		}
		else{
		slz = new SelectZone(parent, (float)(this.p.x), (float)(p.y - vPad),
					(float)this.size.x, (float)vPad);
		}

	}

	SelectZone getSelectZone(){
		return slz;

	}

	protected void addValueZone(){

		if(!isVertical){
		vlz = new ValueZone(parent, (float)(this.p.x + this.size.x+hPad), p.y,
				hPad*1.5F, (float)this.size.y, value);
		}
		else{
		vlz = new ValueZone(parent, (float)(this.p.x ), p.y+ this.size.y + vPad,
				(float)this.size.x, vPad, value);
		}

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

	private void checkIsVertical(){
		if (size.x<size.y){
			isVertical = true;	
		}
		else{
			isVertical = false;
		}

	}


}
