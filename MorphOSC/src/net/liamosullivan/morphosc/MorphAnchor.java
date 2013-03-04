package net.liamosullivan.morphosc;

import java.util.ArrayList;
import java.util.List;
import processing.core.PVector;

public class MorphAnchor
{
	List<MorphParameter> mpList = new ArrayList<MorphParameter>();
	List<Float> valueList = new ArrayList<Float>();
	int id;
	PVector p;

	float s = 20.0F;

	MorphAnchor(int id_, PVector p_)
	{
		this.id = id_;
		this.p = p_;
	}

	void setSize(float s_)
	{
		this.s = s_;
	}

	float getSize() {
		return this.s;
	}

	public void addMorphParameter(MorphParameter mp_)
	{
	}

	public void removeMorphParameter()
	{
	}

	public float getMorphParameterValue(int index_){

		return valueList.get(index_);

	}
	public float getMorphParameterValue(String name_){
		//TO DO: implement parameter value getting via parameter name 
		return -1;

	}
	public void setMorphParameterValue(int index_, float val_){
		int i = index_;
		float val = val_;
		valueList.set(i, val);

	}

	public void setMorphParameterValue(String name_){
		//TO DO: implement parameter value setting via parameter name

	}

	public void over()
	{
	}

	public void move(PVector p_)
	{
	}
}