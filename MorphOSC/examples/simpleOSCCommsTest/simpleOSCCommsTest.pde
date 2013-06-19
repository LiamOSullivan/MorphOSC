/****************************************************
 * MMT: DSP for Installation and Performance 
 ****************************************************
 * 
 * Simple OSC Comms Test
 * 
 *
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5; 
NetAddress myRemoteLocation; 

void setup() {
  size(400, 400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 7401 */
  oscP5 = new OscP5(this, 8001);

  myRemoteLocation = new NetAddress("192.168.1.18", 8000);
}

void draw() {
  background(0);
}
//We'll send the Y co-ordinate data over OSC when the mouse is clicked...
void mousePressed() {
  OscMessage myMessage1 = new OscMessage("/mouseY");  //An OSC Address Pattern is an OSC-string beginning with the character '/' (forward slash).
  myMessage1.add(mouseY);                           
  oscP5.send(myMessage1, myRemoteLocation);         
  OscMessage myMessage2 = new OscMessage("/mouseX");  
  myMessage2.add(mouseX);                           
  oscP5.send(myMessage2, myRemoteLocation);
}

void oscEvent(OscMessage mosc) {
  print("Received an OSC message: "+mosc);
  print( " Address pattern: "+mosc.addrPattern());
  println(" | TypeTag: "+mosc.typetag());
  print("Layer = "+mosc.get(0).intValue()); //Layer ID
  int nMPs = mosc.get(1).intValue();
  println("#MPs = "+nMPs); //#params in layer
  //print("Param #0: "+mosc.get(0+nMPs).intValue());
  for (int i=0;i<nMPs;i+=1) {
    print("Param #"+mosc.get(2*i+2).intValue());
    println("\t Value = "+mosc.get(2*i+3).floatValue());
  }
}

