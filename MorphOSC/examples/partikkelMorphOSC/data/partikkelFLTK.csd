<CsoundSynthesizer>
<CsOptions>
;-odac1 -iadc1 -b2000 -B4000 -M1 -m0 -+rtaudio=pa --expression-opt -d -+raw_controller_mode=1
;-odac13 -iadc13 -b4 -B8 -M4 -m0 -+rtaudio=pa --expression-opt -d -+raw_controller_mode=1
;-b128 -B256 -M1 -m0 -d -+rtaudio=jack -odac:alsa_pcm:playback_
;-oTestfile.wav
</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 100
nchnls = 2
0dbfs = 32768



chn_k "amp", 1       ; Amplitude
chn_k "freq", 1      ; Frequency

massign	1, 103
massign	2, 200
massign	3, 200
massign	4, 200
massign	5, 200
massign	6, 200
massign	7, 200
massign	8, 200
massign	9, 200
massign	10, 200
massign	11, 200
massign	12, 200
massign	13, 200
massign	14, 200
massign	15, 200
massign	16, 200


#include "ftables_classic.inc"
#include "ftables_envelopes.inc"
#include "ftables_samples.inc"
#include "ftables_masks.inc"
#include "globals_presets.inc"
#include "partikkelGUI.inc"
#include "partikkelMIDI.inc"


instr 103

#include "partikkel_instr.inc"

endin


; rewrite channel masks
	instr 105
#include "rewriteChannelMasks.inc"
	endin

; preset handling (instr 106 and 107)
#include "presetHandling.inc"

; live sampling instr (121)
#include "liveSampling.inc"

; bogus midi instr
	instr 200
	endin

; effects, instr 300 and up
#include "channelEffects.inc"


;***************************************************
; recording to file
;***************************************************
	instr 500

; audio input
	a1		chnget	"MasterAudioLeft"
	a2		chnget	"MasterAudioRight"

; write to file
	iFormat = 14 ; 16bit wav
	fout	"demofile.wav", iFormat, a1, a2

	endin
;***************************************************

;***************************************************
; clear chn channels
;***************************************************
	instr 501

; clear chn channels used for mixing 
	chnclear	"MasterAudioLeft"
	chnclear	"MasterAudioRight"

	endin
;***************************************************


</CsInstruments>

<CsScore>

; define the length of the performance (= length of the soundfile if writing to file)
#define SCORELEN # 1000 #	

i1  	0 $SCORELEN 	; GUI
i102  	1 $SCORELEN 	; MIDI

i105  	0 $SCORELEN 	; channel rewrites
i119  	0 0.1		; read presets from disk

i301  	0 $SCORELEN 	; chorus
i302  	0 $SCORELEN 	; reverb
;i500	0 $SCORELEN 	; write to file
i501	0 $SCORELEN 	; clear chn channels

; scripting
i2	1	1	1	; turn sound generator on
i2	2	1	0	; turn sound generator off
i2	3	1	1	; turn sound generator on
;i107	3	3	1	; recall preset no 1
;i107	8	1	5	; recall preset no 5
;i107	10	3	7	; etc...
;i107	15	3	2

e
</CsScore>

</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>72</x>
 <y>179</y>
 <width>400</width>
 <height>200</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>slider1</objectName>
  <x>5</x>
  <y>5</y>
  <width>20</width>
  <height>100</height>
  <uuid>{27fd9106-b39d-49e1-94c0-037cfbbd8c30}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 72 179 400 200
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
</MacGUI>
