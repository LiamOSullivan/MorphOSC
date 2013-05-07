import net.liamosullivan.morphosc.*;
import controlP5.*;
MorphOSC m;
ControlP5 cp5;
Slider s1, s2;

void setup() {
  size(400, 400);
  background(0);
  cp5 = new ControlP5(this);
  m = new MorphOSC(this);
  s1 = cp5.addSlider("Slider1").setWidth(100).setHeight(40);
  s1.setPosition(50,40);
  s2 = cp5.addSlider("Slider2").setWidth(100).setHeight(40);
  s2.setPosition(50,100);
  m.addController(s1); 
  m.getControllerInfo(); 
  m.addMorphLayer(width*0.75, height*0.75); 
}

void draw() {
}


