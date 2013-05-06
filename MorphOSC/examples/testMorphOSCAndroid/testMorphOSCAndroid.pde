/*
Test sketch for MorphOSC
 
 */
import net.liamosullivan.morphosc.*;
import controlP5.*;

MorphOSC m;
ControlP5 cp5;
Slider s1, s2, s3, s4;
int sliderX = 50, sliderY = 20, sliderH = 40, sliderW= 160;
Button b;

PFont font;
int fps = 50; //target framerate
int fr=0; //actual framerate
void setup() {
  size(displayWidth, displayHeight);
  background(0);
  frameRate(fps);
  font=createFont("ArialMT-48.vlw", 48);
  textFont(font, 24);

  cp5 = new ControlP5(this);
  m = new MorphOSC(this);
  //Create some ControlP5 GUI elements...
  s1 = cp5.addSlider("S1")
    .setId(0)
      .setPosition(sliderX, sliderY)
        .setRange(0, 100)
          .setHeight(sliderH)
            .setWidth(sliderW);


  sliderY += 2*s1.getHeight();

  s2 = cp5.addSlider("S2")
    .setId(1)
      .setPosition(sliderX, sliderY)
        .setRange(0, 100)
          .setHeight(sliderH)
            .setWidth(sliderW)
              ;
  sliderY += 2*s1.getHeight();

  s3 = cp5.addSlider("S3")
    .setId(2)
      .setPosition(sliderX, sliderY)
        .setRange(0, 100)
          .setHeight(sliderH)
            .setWidth(sliderW);


  sliderY += 2*s1.getHeight();

  s4 = cp5.addSlider("S4")
    .setId(3)
      .setPosition(sliderX, sliderY)
        .setRange(0, 100)
          .setHeight(sliderH)
            .setWidth(sliderW) ;

  //Add elements to MorphOSC...  
  //  m.addController(s1); //add s1 to MorphOSC
  //  m.addController(s2);
  //  m.addController(s3);
  //  m.addController(s4);
  m.addAllControllers(cp5); //add all silders to MorphOSC
  m.getControllerInfo(); //print the controllers added to MorphOSC only
  m.addMorphLayer(width/2, height/2); //MorphLayer can be added in the sketch or via interaction at runtime
  m.setVerboseMode(false);
}

void draw() {
  //background(0);
  showFramerate();
}

void mousePressed() {
}

void controlEvent(ControlEvent e) {
  if (e.isGroup()) {
    //do nothing here
  }
  else if (e.isController()) {
    //println("Event from controller "+e.getController().getName());
    //println("Controller ID "+e.getController().getId());
  }
  m.controlEvent(e);
}

//Callback method for in-sketch control
void morphOSCEvent() {
}

void showFramerate() {
  fill(255);
  textAlign(CENTER);
  textSize(12);
  if (frameCount%5==0) {
    fr= int(frameRate);
  }
  text("fps: " + fr+"/"+fps, width/2, height - 20);
}

