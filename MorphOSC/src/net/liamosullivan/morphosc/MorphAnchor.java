package net.liamosullivan.morphosc;

import java.util.ArrayList;
import java.util.List;
import java.lang.Math;
import processing.core.PVector;

public class MorphAnchor
{
	List<MorphParameter> mpList = new ArrayList<MorphParameter>();
	List<Float> valueList = new ArrayList<Float>();
	private int id;
	PVector p; //position
	PVector offset; //for moving
	float xOffset;
	float yOffset;
	float s = 20.0F; //arbitrary size (for boundary checking)

	MorphAnchor(int id_, PVector p_)
	{
		this.id = id_;
		this.p = p_;
	}

	void setId(int id_)
	{
		this.id = id_;
	}

	int getId() {
		return this.id;
	}

	
	void setSize(float s_)
	{
		this.s = s_;
	}

	float getSize() {
		return this.s;
	}
	
	void setPosition(PVector av_){
		this.p = av_;
	}
	
	PVector getPosition(){
	return this.p;	
	
	}
	
	protected List getMPList(){
		
		return mpList;
	}

	public void addMorphParameter(MorphParameter mp_)
	{
		MorphParameter mp=mp_;
		mpList.add(mp);
		valueList.add(mp.getValue());
		//System.out.print("Added MP " +mp.getName()+" to MorphAnchor's mpList, now has size "+mpList.size());
		//System.out.println("| Value added was "+valueList.get(valueList.size()-1));
	}

	public void removeMorphParameter()
	{
	}

	public float getMPValueByIndex(int index_){

		return valueList.get(index_);

	}
	public float getMPValueById(int id_){
		int idP = id_; //the id of the parameter in question
		int index=-1;
		for(int i=0;i<mpList.size();i+=1){
			if(mpList.get(i).getId()==idP){
				index=i;
			}
		}
		if(index!=-1){
		valueList.get(index);
		return valueList.get(index);
		}
		else{
			return -1;
		}

	}
	
	public float getMPValueByName(String name_){
		//TO DO: implement parameter value getting via parameter name 
		return -1;

	}
	public void setMorphParameterValueById(int id_, float val_){
		int idP = id_; //the id of the parameter in question
		float val = val_;
		int index=-1;
		for(int i=0;i<mpList.size();i+=1){
			if(mpList.get(i).getId()==idP){
				index=i;
			}
		}
		valueList.set(index, val);
		System.out.println("Set MA #"+this.id+" MP #"+mpList.get(index).getId()+" with value "+val);
	}

	public void setMorphParameterValue(String name_){
		//TO DO: implement parameter value setting via parameter name

	}

	boolean select(PVector pv_) {

		PVector pv=pv_;
		float disX = p.x- pv.x;
		float disY = p.y- pv.y;
		if (Math.sqrt(disX*disX + disY*disY) < s) { //check circular area
			System.out.println("***MA selected");
			return true;
		}

		return false;
	}

	public void setStartPosition(PVector v_)
	{
		PVector v = v_;
		// offset = dist(v, position);
		offset.x = (v.x - p.x);
		offset.y = (v.y - p.y);
		
	}

	public void move(PVector v_)
	{ PVector v=v_;
	p.x = (v.x - xOffset);
	p.y = (v.y - yOffset);
	
	
	}

	
}
