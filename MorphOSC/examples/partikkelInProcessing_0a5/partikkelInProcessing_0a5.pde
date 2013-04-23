/*
 * An emulation of the FTLK GUI for the partikkel opcode in Csound.
 *
 * Rev 0a5: Implement control P5 controller setting from csound (somewhat of a hack here).
 * Rev 0a4: Implement preset store and recall via csound using score events. Modified global_presets
 * file to remove refs to FLTK (now called global_presets_modified). Add Xfade time functionality. 
 * 
 * Sprint backlog:
 * Exponential slider scaling ***Hacked***
 * Preset handling via Csound
 * Wave mix implementation
 * OSC control 
 *
 * Product backlog:  * 
 * Native preset handling (XML)
 * Gesture/ layer integration
 * 
 */

import controlP5.*;
import csoundo.*;

ControlP5 cp5;
Csoundo cs;
RadioButton rb;
Slider GrFreqLinear;
Slider2D s2d;
Numberbox samp1, samp2, samp3, samp4, xFade;
boolean presetInterp = false;
int interpStartTime;

float xFadeTime = 2.0; //preset interpolation fade time



void setup() {
  size(1080, 670);
  frameRate(30);
  smooth();

  cp5 = new ControlP5(this);
  //Android Mode (comment out either)
  //cs = new Csoundo(this, super.getApplicationContext());
  //Java Mode
  cs = new Csoundo(this, "partikkelInProcessing_0a4.csd");
  //cs = new Csoundo(this, "partikkelFLTK.csd");
  cs.run();
  // Partikkel parameters/////////////////////////////////////////////////////////////////////////////////////////////
  //GfFmIndx : Frequency modulation index, modulating the grain rate.
  //GfFmFqRat : Frequency modulation frequency, as percentage of the grain rate.
  //GrDist : Grain distribution.
  //GrTransp : Transposition (pitch) scaling of all grains.
  //FqCenter : The end frequency for pitch sweeps of grains.
  //SweepShap : Shape of the curve for transposition sweeps
  //FmIndex : FM Modulation index, modulating the pitch of source waveforms.
  //FmFreq : Frequency of the FM oscillator, modulating the pitch of source waveforms. 
  //If Frequency is set to zero, audio feedback is used instead of an oscillator for the FM modulator signal.
  //GrDur : Grain duration, in percent of 1/grainrate, so e.g. a value of 400 gives a grain overlap of 4.
  //GrAttack: Balance between attack time and decay time for grain enveloping, 0 = zero attack time and full 
  //decay time.
  //GrShape: GrShape: Amount of grain (attack and decay) enveloping. This can also be described as balance 
  //between enveloped time(attack+decay) and sustain level time, 0 = no time at sustain level.
  //  TimePos : Time position offset, reading of source grain waveforms start from this position in the waveform. Scaled as percentage of the waveform length. For example, setting this to 50 will let new grains start reading from halfway through the source waveform. For single cycle waveforms it would make sense to call this "phase", but for sampled sounds it makes more sens to name it "time position".
  //timLfoFq : LFO frequency, modulating the time pointer offset (see TimPosOff).
  //timLfoAm : LFO amount, modulating the time pointer offset (see TimPosOff).

  //  GrainAmp : The master amplitude.
  //GainMsk1 : Start (loop start) index for reading gain mask values. Gain masks specify gain per grain.
  //GainMsk1 : End (loop end) index for reading gain mask values.
  //RandMask : Amount of random masking (muting) of grains.
  //ChMask1 : Start (loop start) index for reading channel mask values. Channel masks specify which audio output grains are routed to, per grain.
  //ChMask2 : End (loop end) index for reading channel mask values.
  //width : Stereo spread of partikkel audio outputs 1 and 2.
  //displDly2 : Delay time for partikkel audio output 2, in percent of 1/grainrate.
  //chorusAmt : Chorus effect send amount for partikkel audio output 3.
  //reverbAmt : Reverb effect send amount for partikkel audio output 4.
  //chRewrit : Rewrite LFO speed. This controls a continuous rewriting of the channel masks ftable, similar to a panning LFO. Since some partikkel audio outs are used for stereo positioning and other outputs are used for effect sends, this control enables a sort of sonic animation. When setting the control to zero, the original contents of the channel mask table is restored.
  //TrnAmp : Amplitude for trainlets. This is implemented so that increasing trainlet amplitude automaticcally decreases amplitude for waveform grains. The decreasing of amp for waveform grains is written as values to the wave mix ftable at the index currently selected in the gui control WavMaskEdit.
  //TrnCps : The fundamental frequency of the trainlets.
  //TrnPart : Number of harmonics for the trainlets.
  //TrnChrom : Trainlet chroma. Harmonic balance of the trainlets.
  //nFmIndx : Frequency modulation index for a noise modulator signal added to the FM modulator (FmIndex,FmFreq controls) modulating the pitch of source waveforms.
  //nFmDist : Random distribution for the noise FM modulator signal. See csound opcode rnd31. Gui values are scaled * 0.01.
  //nFmFreq : Lowpass filter frequency for the noise FM modulator signal.
  // Set default values in Csound chn bus memory
  cs.setChn("On", 0.0);
  cs.setChn("GrFreq", 14);
  cs.setChn("GfFmIndx", 0);
  cs.setChn("GfFmFqRat", 0.0);
  cs.setChn("GrDist", 1.0);
  cs.setChn("GrTransp", 1.0);
  cs.setChn("FqCenter", 1.0);
  cs.setChn("SweepShap", 0.5);
  cs.setChn("FmIndex", 0.0);
  cs.setChn("FmFreq", 440);
  cs.setChn("GrDur", 1.0);
  cs.setChn("GrAttack", 0.5);
  cs.setChn("GrShape", 0.5);
  cs.setChn("TimePos", 0.0);
  cs.setChn("timLfoFq", 0.0);
  cs.setChn("timLfoAm", 0.0);
  cs.setChn("GrAmp", 0.5);
  cs.setChn("GainMsk1", 0.0);
  cs.setChn("GainMsk2", 0.0);
  cs.setChn("RandMask", 0.0);
  cs.setChn("ChMask1", 0.0);
  cs.setChn("ChMask2", 1.0);
  cs.setChn("width", 0.0);
  cs.setChn("displDly2", 0.0);
  cs.setChn("chorusAmt", 0.0);
  cs.setChn("reverbAmt", 0.0);
  cs.setChn("chRewrit", 0.0);
  cs.setChn("TrnAmp", 0.0);
  cs.setChn("TrnCps", 440);
  cs.setChn("TrnPart", 6);
  cs.setChn("TrnChrom", 1.5);
  cs.setChn("nFmIndx", 0.0);
  cs.setChn("nFmDist", -0.1);
  cs.setChn("nFmFreq", 10000);
  cs.setChn("JoyX", 0.5);
  cs.setChn("JoyY", 0.5);
  cs.setChn("PreXindx", 0.0);
  cs.setChn("PreX1Num", 0.0);
  cs.setChn("PreX2Num", 0.0);
  cs.setChn("presetNumber", 0.0);
  cs.setChn("PresetExclGrFreq", 0.0);
  cs.setChn("PresetExclGrTransp", 0.0);
  cs.setChn("PresetExclTime", 0.0);
  cs.setChn("PresetExclWave", 0.0);
  cs.setChn("PresetExclSweep", 0.0);
  cs.setChn("PresetExclTrainCps", 0.0);

  int hPad = 5, vPad = 20, borderPad = hPad*2;
  int sliderW = width/16-hPad, sliderH= height/4;
  int sliderX = width/16+hPad;

  // Top buttons...
  int buttonW = 60, buttonH = 20;
  int yPos = borderPad;
  cp5.addToggle("On", width/5, yPos, buttonW, buttonH);
  cp5.addToggle("Sample", 2*width/5, yPos, buttonW, buttonH);
  cp5.addToggle("SampleNum", 3*width/5, yPos, buttonW, buttonH);
  cp5.addToggle("RecToFile", 4*width/5, yPos, buttonW, buttonH);
  cp5.addToggle("DisableFaders", 5*width/5, yPos, buttonW, buttonH);

  //Top row...
  //addslider(low,hi,init,x,y,w,h)
  yPos += (vPad+buttonH);
  GrFreqLinear = cp5.addSlider("GrFreqLinear", 0.1, 1500, 750, borderPad+sliderX*0, yPos, sliderW, sliderH);     // 0.1 -> 1500 ***NL
  cp5.addSlider("GfFmIndx", 0.0, 1.0, 0.5, borderPad+sliderX*1, yPos, sliderW, sliderH);   // 0 -> 1.0
  cp5.addSlider("GfFmFqRat", 0.0, 1.0, 0.5, borderPad+sliderX*2, yPos, sliderW, sliderH);  // 0 -> 1.0
  cp5.addSlider("GrDist", -1.0, 10.0, 0.6, borderPad+sliderX*3, yPos, sliderW, sliderH);     // -1.0 -> 10.0
  cp5.addSlider("GrTransp", 0.0, 2.0, 0.5, borderPad+sliderX*4, yPos, sliderW, sliderH);   // 0 -> 2.0
  cp5.addSlider("FqCenter", 0.1, 2.0, 1.3, borderPad+sliderX*5, yPos, sliderW, sliderH);   // 0.1-> 2.0
  cp5.addSlider("SweepShap", 0.0, 1.0, 0.5, borderPad+sliderX*6, yPos, sliderW, sliderH);  // 0 -> 1.0
  cp5.addSlider("FmIndex", 0.0, 20.0, 7, borderPad+sliderX*7, yPos, sliderW, sliderH);    // 0 -> 20.0
  cp5.addSlider("FmFreqLinear", 0.1, 1500, 0, borderPad+sliderX*8, yPos, sliderW, sliderH);     // 0.1 -> 1500.0 ***NL
  cp5.addSlider("GrDur", 0.1, 5.0, 0.1, borderPad+sliderX*9, yPos, sliderW, sliderH);      // 0.1 -> 5.0
  cp5.addSlider("GrAttack", 0.0, 1.0, 0.0, borderPad+sliderX*10, yPos, sliderW, sliderH);  // 0 -> 1.0
  cp5.addSlider("GrShape", 0.0, 1.0, 0.0, borderPad+sliderX*11, yPos, sliderW, sliderH);   // 0 -> 1.0
  cp5.addSlider("TimePos", 0.0, 1.0, 0.5, borderPad+sliderX*12, yPos, sliderW, sliderH);   // 0 -> 1.0
  cp5.addSlider("timLfoFqLinear", 0.1, 1000.0, 100, borderPad+sliderX*13, yPos, sliderW, sliderH);  // 0.1 -> 1000.0 ***NL
  cp5.addSlider("timLfoAm", 0.0, 1.0, 0.5, borderPad+sliderX*14, yPos, sliderW, sliderH);  // 0 -> 1.0

  //Middle Row
  yPos += (vPad+sliderH);
  cp5.addSlider("GrAmp", 0.1, 1.0, 0.5, borderPad+sliderX*0, yPos, sliderW, sliderH);   // 0 -> 1.0
  cp5.addSlider("GainMsk1", 0.0, 7.0, 0.0, borderPad+sliderX*1, yPos, sliderW, sliderH);   // 0 -> 7.0
  cp5.addSlider("GainMsk2", 0.0, 7.0, 0.0, borderPad+sliderX*2, yPos, sliderW, sliderH);  // 0 -> 7.0
  cp5.addSlider("RandMask", 0.0, 1.0, 0.0, borderPad+sliderX*3, yPos, sliderW, sliderH);     // 0 -> 1.0
  cp5.addSlider("ChMask1", 0.0, 7.0, 0.0, borderPad+sliderX*4, yPos, sliderW, sliderH);   // 0 -> 2.0
  cp5.addSlider("ChMask2", 0.0, 7.0, 0.0, borderPad+sliderX*5, yPos, sliderW, sliderH);   // 0.1-> 2.0
  cp5.addSlider("width", 0.0, 1.0, 0.0, borderPad+sliderX*6, yPos, sliderW, sliderH);  // 0 -> 1.0
  cp5.addSlider("displDly2", 0.0, 1.0, 0.0, borderPad+sliderX*7, yPos, sliderW, sliderH);    // 0 -> 1.0
  cp5.addSlider("chorusAmt", 0.0, 1.0, 0.0, borderPad+sliderX*8, yPos, sliderW, sliderH);     // 0 -> 1.0
  cp5.addSlider("reverbAmt", 0.0, 1.0, 0.0, borderPad+sliderX*9, yPos, sliderW, sliderH);      // 0 -> 1.0
  cp5.addSlider("chRewrite", 0.0, 1.0, 0.0, borderPad+sliderX*10, yPos, sliderW, sliderH);  // 0 -> 1.0
  cp5.addSlider("TrnAmp", 0.0, 1.0, 0.0, borderPad+sliderX*11, yPos, sliderW, sliderH);   // 0 -> 1.0
  cp5.addSlider("TrnCps", 0.0, 1000.0, 0.0, borderPad+sliderX*12, yPos, sliderW, sliderH);   // 0 -> 1000.0 (IS linear)
  cp5.addSlider("TrnPartLinear", 1.0, 100.0, 100, borderPad+sliderX*13, yPos, sliderW, sliderH);  // 1 -> 100.0 ***NL
  cp5.addSlider("TrnChrom", 0.0, 2.0, 0.0, borderPad+sliderX*14, yPos, sliderW, sliderH);  // 0 -> 2.0

  //Bottom Row
  yPos += (vPad+sliderH);
  samp1=cp5.addNumberbox("Samp1");
  samp1.setPosition(borderPad, yPos+vPad)
    .setSize(sliderW, buttonH)
      .setRange(1, 7)
        .setMultiplier(1) // set the sensitifity of the numberbox
          .setDirection(Controller.VERTICAL) // change the control direction to left/right
            .setValue(4)
              ;
  samp3=cp5.addNumberbox("Samp3");
  samp3.setPosition(borderPad, yPos+sliderH-vPad)
    .setSize(sliderW, buttonH)
      .setRange(1, 7)
        .setMultiplier(1) // set the sensitifity of the numberbox
          .setDirection(Controller.VERTICAL) // change the control direction to left/right
            .setValue(6)
              ;
  samp2=cp5.addNumberbox("Samp2");
  samp2.setPosition(sliderX*3, yPos+vPad)
    .setSize(sliderW, buttonH)
      .setRange(1, 7)
        .setMultiplier(1) // set the sensitifity of the numberbox
          .setDirection(Controller.VERTICAL) // change the control direction to left/right
            .setValue(5)
              ;

  samp4=cp5.addNumberbox("Samp4");
  samp4.setPosition(sliderX*3, yPos+sliderH-vPad)
    .setSize(sliderW, buttonH)
      .setRange(1, 7)
        .setMultiplier(1) // set the sensitifity of the numberbox
          .setDirection(Controller.VERTICAL) // change the control direction to left/right
            .setValue(7)
              ;

  s2d = cp5.addSlider2D("wave mix")
    .setPosition( borderPad+sliderX+hPad, yPos)
      .setSize(sliderW*2, sliderH)
        .setMaxX(1.0) 
          .setMaxY(1.0) 
            .setMinX(0.0) 
              .setMinY(0.0)
              .setArrayValue(new float[] {
                0.5, 0.5
              }
  )
    //.disableCrosshair()
    ;

  cp5.addSlider("nFmIndx", 0.0, 100.0, 0.0, borderPad+sliderX*5, yPos, sliderW, sliderH);  // 0 -> 100.0
  cp5.addSlider("nFmDist", -1.0, 1.0, -0.1, borderPad+sliderX*6, yPos, sliderW, sliderH);  // -1.0 -> 1.0
  cp5.addSlider("nFmFreqLinear", 0.1, 20000.0, 10000, borderPad+sliderX*7, yPos, sliderW, sliderH);  // 0.1 -> 20000.0 ***NL
  cp5.addSlider("PreXindxLinear", 0.0, 1.0, 0.0, borderPad+sliderX*10, yPos, sliderW, sliderH);  // 0 -> 1.0

  //Radio Buttons
  rb = cp5.addRadioButton("presetNumber")
    .setPosition(borderPad+sliderX*11, yPos)
      .setSize(sliderW/3, sliderH/8)
        .setItemsPerRow(2)
          .setSpacingColumn(8)
            .addItem("0", 0)
              .addItem("8", 8)
                .addItem("1", 1)
                  .addItem("9", 9)
                    .addItem("2", 2)
                      .addItem("10", 10)
                        .addItem("3", 3)
                          .addItem("11", 11)
                            .addItem("4", 4)
                              .addItem("12", 12)
                                .addItem("5", 5)
                                  .addItem("13", 13)
                                    .addItem("6", 6)
                                      .addItem("14", 14)
                                        .addItem("7", 7)
                                          .addItem("15", 15);

  rb.setNoneSelectedAllowed(false);
  rb.activate("0"); //set preset number
  //
  //    //Buttons
  buttonH = int(sliderH*0.2-vPad);
  cp5.addButton("Store", 1.0, borderPad+sliderX*12, yPos, sliderW, buttonH); 
  cp5.addButton("Recall", 1.0, borderPad+sliderX*12, int(yPos+sliderH*0.2), sliderW, buttonH);

  xFade =cp5.addNumberbox("Xfade")
    .setPosition(borderPad+sliderX*12, int(yPos+sliderH*0.4))
      .setSize(sliderW, buttonH)
        .setRange(0.1, 60)
          .setMultiplier(0.1) // set the sensitifity of the numberbox
            .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
              .setValue(xFadeTime)
                ;

  cp5.addButton("f-Write", 1.0, borderPad+sliderX*12, int(yPos+sliderH*0.6), sliderW, buttonH);
  cp5.addButton("f-Read", 1.0, borderPad+sliderX*12, int(yPos+sliderH*0.8), sliderW, buttonH);

  //cs.setChn("PreX1Num", 0.0);
  cs.setChn("PreX1Num", 0.0);
  cs.setChn("PreX2Num", 0.0);
  cs.setChn("PresetExclGrFreq", 0.0);
  cs.setChn("PresetExclGrTransp", 0.0);
  cs.setChn("PresetExclTime", 0.0);
  cs.setChn("PresetExclWave", 0.0);
  cs.setChn("PresetExclSweep", 0.0);
  cs.setChn("PresetExclTrainCps", 0.0);
}

void draw() {
  background(0);
  if (millis()-interpStartTime<xFadeTime*1000) {
    interpSliders();
  }
}

void keyPressed() {
}

void interpSliders() {
  cp5.getController("GrFreqLinear").changeValue(cs.getChn("GrFreq"));
  cp5.getController("GfFmIndx").changeValue(cs.getChn("GfFmIndx"));
  cp5.getController("GfFmFqRat").changeValue(cs.getChn("GfFmFqRat"));
  cp5.getController("GrTransp").changeValue(cs.getChn("GrTransp"));
  cp5.getController("FqCenter").changeValue(cs.getChn("FqCenter"));
  cp5.getController("SweepShap").changeValue(cs.getChn("SweepShap"));
  cp5.getController("FmIndex").changeValue(cs.getChn("FmIndex"));
  cp5.getController("nFmFreqLinear").changeValue(cs.getChn("FmFreq"));
  cp5.getController("GrDur").changeValue(cs.getChn("GrDur"));
  cp5.getController("GrAttack").changeValue(cs.getChn("GrAttack"));
  cp5.getController("GrShape").changeValue(cs.getChn("GrShape"));
  cp5.getController("TimePos").changeValue(cs.getChn("TimePos"));
  cp5.getController("timLfoFqLinear").changeValue(cs.getChn("timLfoFq"));
  cp5.getController("timLfoAm").changeValue(cs.getChn("timLfoAm"));
  cp5.getController("GrAmp").changeValue(cs.getChn("Grain Amp"));
  cp5.getController("GainMsk1").changeValue(cs.getChn("GainMsk1"));
  cp5.getController("GainMsk2").changeValue(cs.getChn("GainMsk2"));
  cp5.getController("RandMask").changeValue(cs.getChn("RandMask"));
  cp5.getController("ChMask1").changeValue(cs.getChn("ChMask1"));
  cp5.getController("ChMask2").changeValue(cs.getChn("ChMask2"));
  cp5.getController("width").changeValue(cs.getChn("width"));
  cp5.getController("displDly2").changeValue(cs.getChn("displDly2"));
  cp5.getController("chorusAmt").changeValue(cs.getChn("chorusAmt"));
  cp5.getController("reverbAmt").changeValue(cs.getChn("reverbAmt"));
  cp5.getController("chRewrite").changeValue(cs.getChn("chRewrit"));
  cp5.getController("TrnAmp").changeValue(cs.getChn("TrnAmp"));
  cp5.getController("TrnCps").changeValue(cs.getChn("TrnCps"));
  cp5.getController("TrnPartLinear").changeValue(cs.getChn("TrnPart"));
  cp5.getController("TrnChrom").changeValue(cs.getChn("TrnChrom"));
  cp5.getController("nFmIndx").changeValue(cs.getChn("nFmIndx"));
  cp5.getController("nFmDist").changeValue(cs.getChn("nFmDist"));
  cp5.getController("GrTransp").changeValue(cs.getChn("GrTransp"));
  cp5.getController("nFmFreqLinear").changeValue(cs.getChn("nFmFreq"));
  float [] wm = new float [2];
  wm[0] = cs.getChn("JoyX");
  wm[1] = cs.getChn("JoyY");
  s2d.setBroadcast(false).setArrayValue(wm);
  s2d.setBroadcast(true);
}

void controlEvent(ControlEvent e) {
  // Update chn bus related to ControlEvent
  if (e.isFrom(rb)) {
    println("Radio button named "+e.getName()+"\t Value "+e.getValue());
    cs.setChn("presetNumber", int(e.getValue()));
  }
  else if (e.isFrom(samp1)) {
    println("Sample number 1 set to "+int(e.getValue()));
    //cs.setChn("Samp1Num", int(e.getValue()));
  }
  else if (e.isFrom(samp2)) {
    println("Sample number 2 set to "+int(e.getValue()));
    //cs.setChn("Samp2Num", int(e.getValue()));
  }
  else if (e.isFrom(samp3)) {
    println("Sample number 3 set to "+int(e.getValue()));
    //cs.setChn("Samp3Num", int(e.getValue()));
  }
  else if (e.isFrom(samp4)) {
    println("Sample number 4 set to "+int(e.getValue()));
    //cs.setChn("Samp4Num", int(e.getValue()));
  }
  else if (e.isFrom(s2d)) {
    float [] xy = e.getArrayValue();
    println("Got an event from 2-D slider "+e.getName()+"\t values: "+xy[0]+", "+xy[1]);
    cs.setChn("JoyX", xy[0]);
    cs.setChn("JoyY", xy[1]);
  }
  else if (e.getName().equals("GrFreqLinear")) {
    println("Got an event from exp slider "+e.getName()+", slider value: "+e.getValue()
      +" Scaled value: "+expScale(e.getValue(), e.getController().getMin(), e.getController().getMax()));
    cs.setChn("GrFreq", expScale(e.getValue(), e.getController().getMin(), e.getController().getMax()));
  }
  else if (e.getName().equals("FmFreqLinear")) {
    println("Got an event from exp slider "+e.getName()+"\t slider value: "+e.getValue()
      +" Scaled value: "+expScale(e.getValue(), e.getController().getMin(), e.getController().getMax()));
    cs.setChn("FmFreq", expScale(e.getValue(), e.getController().getMin(), e.getController().getMax()));
  }
  else if (e.getName().equals("timLfoFqLinear")) {
    println("Got an event from exp slider "+e.getName()+"\t slider value: "+e.getValue()
      +" Scaled value: "+expScale(e.getValue(), e.getController().getMin(), e.getController().getMax()));
    cs.setChn("timLfoFq", expScale(e.getValue(), e.getController().getMin(), e.getController().getMax()));
  }
  else if (e.getName().equals("nFmFreqLinear")) {
    println("Got an event from exp slider "+e.getName()+"\t slider value: "+e.getValue()
      +" Scaled value: "+expScale(e.getValue(), e.getController().getMin(), e.getController().getMax()));
    cs.setChn("nFmFreq", expScale(e.getValue(), e.getController().getMin(), e.getController().getMax()));
  }
  else if (e.getName().equals("Store")) {
    //cs.event("i 4 0 -1 0.3 440");  // Turn on instr 4 indefintely
    println("Store preset");
    cs.event("i 106 0 0.1"); //p1: instr p2: time p3: dur
  }
  else if (e.getName().equals("Recall")) {
    println("Recall preset #"+int(rb.value()));
    cs.event("i 107 0 "+xFadeTime +" "+int(rb.value())); 
    interpStartTime = millis();
    //cs.event("i 107 0 2 0"); //p3: xfade, p4: preset
  }
  else if (e.isFrom(xFade)) {
    println("XFade time: "+ e.getValue());
    xFadeTime = e.getValue();
    //cs.setChn("presetNumber", int(e.getValue()));
  }
  else {
    // println("Control event of type "+e.controller().name());
    println("Default: Setting param "+e.controller().name()+" to "+e.controller().value());
    cs.setChn(e.controller().name(), e.controller().value());
  }
}

float expScale(float in_, float min_, float max_) {
  float in = in_/max_; //normalise slider value
  float ans = 0.0;

  if (max_==1000.0) {
    ans = 0.22*exp(8.40*in);
  }
  else if (max_ == 1500.0) {
    ans = 0.15*exp(9.21*in);
  } 
  else if (max_ == 100.0) {
    ans = 0.1*exp(4.64*in);
  }
  else if (max_ == 20000.0) {
    ans = 0.125*exp(11.98*in);
  }
  return ans;
}

