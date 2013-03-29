package net.liamosullivan.morphosc;

import controlP5.Controller;
import java.util.ArrayList;

import processing.core.PApplet;
import processing.core.PVector;

public class Parser
{
  PApplet parent;
  ArrayList cal = new ArrayList();
  ArrayList mpList = new ArrayList();
  int nMPs = 0;
  int maxNPs = 32;
  int nColors = this.maxNPs;

  Parser(PApplet parent_)
  {
    this.parent = parent_;
  }

  protected MorphParameter parseController(Controller cin_, int color_) {
    Controller c = cin_;
    int color = color_;
    MorphParameter mp = 
      new MorphParameter(this.parent, c.getId(), c.getName()); 
    mp.setSize(new PVector(c.getWidth(), c.getHeight()));
    mp.setPosition(c.getPosition());
    mp.setColor(color);
    mp.addValueZone();
    mp.addSelectZone();
    mp.setMax(c.getMax());
    mp.setMin(c.getMin());
    mp.setValue(c.getValue());
    //mp.setName(c.getName());
//    System.out.println("Parser: controller name: "+c.getName()
//    		+" MP name: "+mp.getName());
       
    return mp;
  }
}