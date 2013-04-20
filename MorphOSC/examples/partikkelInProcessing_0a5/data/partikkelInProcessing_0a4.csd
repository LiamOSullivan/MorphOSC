;Modified version of partikkel_noGUI.csd for use with Processing
;GUI and Partikkel instrument added to csd from include files for modification.

<CsoundSynthesizer>
<CsOptions>
;-o dac -+rtaudio=null -d -+msg_color=0 -m0 -b512
-m0
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 2
0dbfs = 32768
;chn_k "elapsed", 1
;chn_k "GrFreq", 1       ; Grain Frequency
;chnset 0, "elapsed"

#include "ftables_classic.inc"
#include "ftables_envelopes.inc"
#include "ftables_samples.inc"
#include "ftables_masks.inc"
#include "globals_presets_modified.inc"
;#include "partikkel_noGUI.inc"
;*********************************************************************
; replacement for Gui widgets
;*********************************************************************
	instr	1

	;chn_k "On", 0.0
;	chn_k "Samp1Num", 1 ;need to specify as integer mode to allow table lookup
;	chn_k "Samp2Num", 1 
;	chn_k "Samp3Num", 1 
;	chn_k "Samp4Num", 1 
	
	
	chnset		0.0, "On"
	chnset		14, "GrFreq"
	chnset		0, "GfFmIndx"
	chnset		0.5, "GfFmFqRat"
	chnset		0, "GrDist"
	chnset		1, "GrTransp"
	chnset		1, "FqCenter"
	chnset		0.5, "SweepShap"
	chnset		0, "FmIndex"
	chnset		440, "FmFreq"
	chnset		1, "GrDur"
	chnset		0.5, "GrAttack"
	chnset		0.5, "GrShape"
	chnset		0, "TimePos"
	chnset		0, "timLfoFq"
	chnset		0, "timLfoAm"
	chnset		0.5, "GrAmp"
	chnset		0, "GainMsk1"
	chnset		0, "GainMsk2"
	chnset		0, "RandMask"
	chnset		0, "ChMask1"
	chnset		1, "ChMask2"
	chnset		0, "width"
	chnset		0, "displDly2"
	chnset		0, "chorusAmt"
	chnset		0, "reverbAmt"
	chnset		0, "chRewrit"
	chnset		0, "TrnAmp"
	chnset		440, "TrnCps"
	chnset		6, "TrnPart"
	chnset		1.5, "TrnChrom"
	chnset		0, "nFmIndx"
	chnset		-0.1, "nFmDist"
	chnset		10000, "nFmFreq"
	chnset		0.5, "JoyX"
	chnset		0.5, "JoyY"
	iwave1		table	4, giAudioTableMap
	iwave2		table	5, giAudioTableMap
	iwave3		table	6, giAudioTableMap
	iwave4		table	7, giAudioTableMap
	chnset		iwave1, "Samp1Num"
	chnset		iwave2, "Samp2Num"
	chnset		iwave3, "Samp3Num"
	chnset		iwave4, "Samp4Num"

	chnset		0, "PreXindx"
	chnset		0, "PreX1Num"
	chnset		2, "PreX2Num"

	chnset		0, "presetNumber"
	chnset		0, "PresetExclGrFreq"
	chnset		0, "PresetExclGrTransp"
	chnset		0, "PresetExclTime"
	chnset		0, "PresetExclWave"
	chnset		0, "PresetExclSweep"
	chnset		0, "PresetExclTrainCps"
	
	chnset		0, "DisableFaders"
	chnset		0, "Store"
	chnset		0, "Recall"
	
	;These all need to be defined for preset handling in i106-108, just patching the existing channels into them
;TODO: remove the need for these
gihGrFreq 	chnget 	"GrFreq"
gihGfFmFqRat chnget "GfFmFqRat"
gihGfFmIndx chnget "GfFmIndx"
gihGrDist chnget "GrDist"
gihTrnCps chnget "TrnCps"
gihGrTransp chnget "GrTransp"
gihFqCenter chnget "FqCenter"
gihSweepShap chnget "SweepShap"
gihGrShape chnget "GrShape"
gihGrAttack chnget "GrAttack"
gihGrDur chnget "GrDur"
gihFmFreq chnget "FmFreq"
gihFmIndex chnget "FmIndex"
gihTrnAmp chnget "TrnAmp"
gihTrnPart chnget "TrnPart"
gihTrnChrom chnget "TrnChrom"
gihGainMsk1 chnget "GainMsk1"
gihGainMsk2 chnget "GainMsk2"
gihChMask1 chnget "ChMask1"
gihChMask2 chnget "ChMask2"
gihRandMask chnget "RandMask"
gihJoyX chnget "JoyX"
gihJoyY chnget "JoyX"
gihTimePos chnget "TimePos"
gihtimLfoFq chnget "timLfoFq"
gihtimLfoAm chnget "timLfoAm"
gihdisplDly2 chnget "displDly2"
gihchRewrit chnget "chRewrit"
gihwidth chnget "width"
gihchorusAmt chnget "chorusAmt"
gihreverbAmt chnget "reverbAmt"
gihGrAmp chnget "GrainAmp"
gihSync chnget "Sync"
	
	
	kOn	chnget "On"
ktrigOn			trigger		kOn, 0.5, 0
schedkwhen		ktrigOn, 0, 0, 103, 0, -1	; activate instr 3
ktrigOff		trigger		kOn, 0.5, 1
schedkwhen		ktrigOff, 0, 0, -103, 0, 1	; turnoff instr 3

;Substituting in replacements for GUI elements from partikelGUi.inc...
gkGuiDisable chnget "DisableFaders"
kPStor	chnget	"Store"
kPRecall chnget	"Recall"



	endin
;*********************************************************************
;*********************************************************************
; instrument to turn the sound on or off (manipulating the gui "on" button)
;*********************************************************************
;	instr 2


	;iState = p4			; the state can be 1 (on) or 0 (off)
	;FLsetVal_i	iState, gihOn
	;endin
;*********************************************************************


instr 99
; instrument for setting chn values
Sname	strget	p4
	chnset	p5, Sname
endin

;*****************************************************PARTIKKEL INSTR*******
instr 103

;#include "partikkel_instr.inc"
;***********
kenv	linsegr	0, 0.001, 1, 1, 1, 0.2, 0

;***********
; basic parameters
	
	
	iamp		= 15000
	kamp		chnget	"GrAmp"				; grain amplitude

	ksync		chnget	"Sync"
	async 		= ksync


; grain freq and transpose
	kgrainfreq	chnget	"GrFreq"
	kMidiVelocity	init 0
	midinoteoncps 	kgrainfreq, kMidiVelocity		; optional midi note control grain rate

	; grain freq FM
	kgffmfq		chnget 	"GfFmFqRat"
	kgffmfq		= kgffmfq * kgrainfreq
	kgffmfq		portk	kgffmfq, 0.1
	kgffmindx	chnget	"GfFmIndx"
	igffmwave	= giSine
	agfwavfm	oscil	kgffmindx, kgffmfq, igffmwave	; audio input for frequency modulation of grain rate

	agrainfreq	= kgrainfreq + (agfwavfm*kgrainfreq)
	kgrainfreqP	downsamp	agrainfreq
	
	idisttab	= giProbDist			; random distribution for grain masking
	kdistribution	chnget	"GrDist"		; periodic or stochastic distribution of grains, 0 = periodic
	

	kwavTransp	chnget "GrTransp"
	kwavfreq	= kwavTransp			; grain wave frequency
	kwavFqCenter	chnget	"FqCenter"		; grain wave frequency gravity center (for sweeps)
	tablew		kwavFqCenter, 2, giWavfreqEnd	; modify table containing end freq for sweeps
	ksweepshape	chnget	"SweepShap"		; frequency sweep duration (as fraction of grain duration)
	iwavfreqstarttab = giWavfreqStart
	iwavfreqendtab	= giWavfreqEnd
	
; grain shape
	ienv_attack	= giSigmoRise			; grain attack envelope table (must have extended guard point)
	ienv_decay	= giSigmoFall			; grain decay envelope table (must have extended guard point)
	ksustain_amount	chnget "GrShape"		; balance between enveloped time(attack+decay) and sustain level time, 0 = no time at sustain level
	ka_d_ratio	chnget "GrAttack"		; balance between attack time and decay time, 0 = zero attack time and full decay time
	kenv2amt	= 0.5				; additional enveloping per grain (e.g. for fof synthesis)
	ienv2tab	= giSigmoFall
	kGrainDur	chnget "GrDur"		; grain duration, as multiple of grain frequency
	kduration	= (kGrainDur*1000)/kgrainfreq	; grain dur in milliseconds

; frequency modulation parameters and oscil
	kfmfq		chnget 	"FmFreq"
;	kfmfq		portk	kfmfq, 0.1
	kfmindx		chnget	"FmIndex"
	kfmindx		= kfmindx * (kfmfq*0.0001)
	tablew		kfmindx, 2, giFmAmps
	ifmwave		= giSine
	awavfm		oscil	kfmindx, kfmfq, ifmwave	; audio input for frequency modulation inside grain
	awavFeed	chnget	"audioFeedback1"
	awavFeed	= awavFeed * 10
	kFMselect	= (kfmfq < 1.0 ? 0 : 1)	; select oscillator or feedback modulation source, if frequency very low use feedback
	awavfm		= (awavfm * kFMselect) + (awavFeed * (1-kFMselect))
; noise FM
	knFmIndx	chnget	"nFmIndx"
	knFmDist	chnget	"nFmDist"
        knFmFreq        chnget	"nFmFreq"
	anoiseFM	rnd31	knFmIndx, knFmDist
	anoiseFM	butterlp anoiseFM, knFmFreq 
	awavfm		= awavfm + anoiseFM
	ifmamptab	= giFmAmps		; fm index per grain
	kfmenv		init giSigmoFall	; fm index envelope

; trainlet parameters
	icosine		= giCosine		; for trainlets
	kTrainCps	chnget	"TrnCps"	; set cps equal to grain freq, for trainlets or single cycle waves
	ktrainamp	chnget	"TrnAmp"	; trainlet amp
	knumpartials	chnget	"TrnPart"	; number of partials in trainlet
	kchroma		chnget	"TrnChrom"	; chroma, falloff of partial amplitude towards sr/2

; masking
	igainmasks	= giGainMask		; gain masking table, amplitude for individual grains
	kgainmaskfrom	chnget	"GainMsk1"	; gain masking index start
	kgainmaskto	chnget	"GainMsk2"	; gain masking index end (loop point)
	tablew		kgainmaskfrom, 0, giGainMask
	tablew		kgainmaskto, 1, giGainMask
	ichannelmasks	= giChnMask		; channel masking table, pan for individual grains
	kchannelmaskfrom chnget	"ChMask1"	; channel masking index start
	kchannelmaskto	chnget	"ChMask2"	; channel masking index end (loop point)
	tablew		kchannelmaskfrom, 0, giChnMask
	tablew		kchannelmaskto, 1, giChnMask
	krandommask	chnget	"RandMask"	; random masking (muting) of individual grains

; waveforms
	iwaveamptab	= giWavAmps			; amp per wave per grain
	kJoyX		chnget	"JoyX"
	kJoyY		chnget	"JoyY"
	kwgain1		limit sqrt((1-kJoyX)*kJoyY), 0, 1
	kwgain2		limit sqrt(kJoyX*kJoyY), 0, 1
	kwgain3		limit sqrt((1-kJoyY)*(1-kJoyX)), 0, 1
	kwgain4		limit sqrt((1-kJoyY)*kJoyX), 0, 1
;	printks		"joy values %f %f %f %f %n", 1, kwgain1, kwgain2, kwgain3, kwgain4
	kwaveform1	chnget "Samp1Num"		; audio waveform inside each grain
	kwavegain1	= kwgain1 * (1-ktrainamp)	; gain (mix) for waveform 1, crossfade with trainlet
	tablew		kwavegain1, 2, giWavAmps
	kwaveform2	chnget "Samp2Num"		; waveform 2
	kwavegain2	= kwgain2 * (1-ktrainamp)	; gain (mix) for waveform 2
	tablew		kwavegain2, 3, giWavAmps
	kwaveform3	chnget "Samp3Num"		; waveform 3
	kwavegain3	= kwgain3 * (1-ktrainamp)	; gain (mix) for waveform 3
	tablew		kwavegain3, 4, giWavAmps
	kwaveform4	chnget "Samp4Num"		; waveform 4
	kwavegain4	= kwgain4 * (1-ktrainamp)	; gain (mix) for waveform 4
	tablew		kwavegain4, 5, giWavAmps
	tablew		ktrainamp, 6, giWavAmps		; gain for trainlets
	kwavekey1	= 1/6				; original key for waveform 1
	kwavekey2	= 1/6				; ...
	kwavekey3	= 1/6
	kwavekey4	= 1/6

; time
	ksamplepos	chnget	"TimePos"	; start position for reading grain waveform
	kTimeLfoFreq	chnget	"timLfoFq"
	kTimeLfoAmt	chnget	"timLfoAm"
	kTimeLfo	oscil	kTimeLfoAmt, kTimeLfoFreq, giTri
	;ksamplepos1	= ksamplepos + kTimeLfo
	;ksamplepos1	tonek	ksamplepos1, 3
	;asamplepos1	interp	ksamplepos1
	;ksamplepos2	= ksamplepos - kTimeLfo
	;ksamplepos2	tonek	ksamplepos2, 3
	;asamplepos2	interp	ksamplepos2
	asamplepos1	= ksamplepos + kTimeLfo
	asamplepos2	= asamplepos1
	asamplepos3	= asamplepos1
	asamplepos4	= asamplepos1
	knoloop		= 1			; if knoloop = 1, the waveform within a grain does not loop
	imax_grains	= 100			; max number of grains per k-period

;***********

;********************************THE PARTIKKEL OPCODE!!!********************

a1, a2, a3, a4 partikkel agrainfreq, kdistribution, idisttab, async, kenv2amt, ienv2tab, ienv_attack, ienv_decay, ksustain_amount, ka_d_ratio, kduration, kamp, igainmasks, kwavfreq, ksweepshape, iwavfreqstarttab, iwavfreqendtab, awavfm, ifmamptab, kfmenv, icosine, kTrainCps, knumpartials,                kchroma, ichannelmasks, krandommask, kwaveform1, kwaveform2, kwaveform3, kwaveform4, iwaveamptab, asamplepos1, asamplepos2, asamplepos3, asamplepos4,                kwavekey1, kwavekey2, kwavekey3, kwavekey4, imax_grains


; time displacement single grain
imaxdel		= 1000
kdelTime2	chnget	"displDly2"			; displace delay for single grain, in fraction of 1/grainrate
kdelTime2	tonek	(kdelTime2/kgrainfreq)*1000, 10
adelTime2	interp 	kdelTime2
a2		vdelay3	a2, adelTime2, imaxdel

; stereo displacement (width) of grain ch1 and 2, ch3 and 4, in pairs
kWidth		chnget	"width"				; stereo width 
aw1		= a1
aw2		= a2
aw3		= a3
aw4		= a4
a1		= (aw1 + (aw2 * (1-kWidth))) * ((kWidth*0.35)+0.65)
a2		= (aw2 + (aw1 * (1-kWidth))) * ((kWidth*0.35)+0.65)
a3		= (aw3 + (aw4 * (1-kWidth))) * ((kWidth*0.35)+0.65)
a4		= (aw4 + (aw3 * (1-kWidth))) * ((kWidth*0.35)+0.65)


a1	= a1 * iamp * kenv
a2	= a2 * iamp * kenv
a3	= a3 * iamp * kenv
a4	= a4 * iamp * kenv

; chorus send
kchorusAmt 	chnget	"chorusAmt"
achorus		= a3 * kchorusAmt
a3		= a3 * (1-kchorusAmt)
		chnmix	achorus, "chorusSend"

; reverb send
kreverbAmt 	chnget	"reverbAmt"
areverb		= a4 * kreverbAmt
a4		= a4 * (1-kreverbAmt)
		chnmix	areverb, "reverbSend"

amono	= a1+a2+a3+a4
chnset	amono, "audioFeedback1"		; audio feedback for fm

;outs a1 + a3, a2 + a4
aLeft	= a1+a3
aRight	= a2+a4
outch	1, aLeft, 2, aRight

; send to master for recording to file
	chnmix	aLeft,	"MasterAudioLeft"
	chnmix	aRight,	"MasterAudioRight"


endin


; rewrite channel masks
	instr 105
#include "rewriteChannelMasks.inc"
	endin
	

;from partikellGUI.inc ***TODO: implement store and recal from controlP5. WIth FLTK it's done as per below with inst 105 (?), 106, 107 referred to in params, but how?

;kPStor, ihPStore	 FLbutton	"Store", 1, 0, 1, 70, 20, iFad12PosX+20, iFad3PosY, 105, 106, 0, 0.1
;kPRecall, ihPRecall	FLbutton	"Recall", 1, 0, 1, 70, 20, iFad12PosX+20, iFad3PosY+26, 105, 107, 0, kXfdTime, kpreset


;preset handling (instr 106 and 107)
;#include "presetHandling.inc"

;*************** Preset Handling instruments *******************

;***************************************************************
; store presets
;***************************************************************
	instr 106

	iPreset		chnget	"presetNumber"
;iPreset = 
	$WritePresetToTable(GrAmp'	0)
;	$WritePresetToTable(Sync'	1)
	$WritePresetToTable(GrFreq'	2)
	$WritePresetToTable(GfFmFqRat'	3)
	$WritePresetToTable(GfFmIndx'	4)
	$WritePresetToTable(GrDist'	5)
	$WritePresetToTable(TrnCps'	6)
	$WritePresetToTable(GrTransp'	7)
	$WritePresetToTable(FqCenter'	8)
	$WritePresetToTable(SweepShap'	9)
	$WritePresetToTable(GrShape'	10)
	$WritePresetToTable(GrAttack'	11)
	$WritePresetToTable(GrDur'	12)
	$WritePresetToTable(FmFreq'	13)
	$WritePresetToTable(FmIndex'	14)
	$WritePresetToTable(TrnAmp'	15)
	$WritePresetToTable(TrnPart'	16)
	$WritePresetToTable(TrnChrom'	17)
	$WritePresetToTable(GainMsk1'	18)
	$WritePresetToTable(GainMsk2'	19)
	$WritePresetToTable(ChMask1'	20)
	$WritePresetToTable(ChMask2'	21)
	$WritePresetToTable(RandMask'	22)
	$WritePresetToTable(JoyX'	23)
	$WritePresetToTable(JoyY'	24)
	$WritePresetToTable(TimePos'	25)
	$WritePresetToTable(timLfoFq'	26)
	$WritePresetToTable(timLfoAm'	27)
	$WritePresetToTable(displDly2'	28)
	$WritePresetToTable(chRewrit'	29)
	$WritePresetToTable(width'	30)
	$WritePresetToTable(chorusAmt'	31)
	$WritePresetToTable(reverbAmt'	32)

	endin

;***************************************************************
; recall presets and interpolate from current to preset parameter values
;***************************************************************
	instr 107

	iXfadeTime	= p3-(1/kr)
	iPreset		= p4

	kXfadeIndex	line	0, iXfadeTime, 1

;#include "recallPresets.inc"

; these parameters may be excluded from preset recall
kExclGrFreq	chnget	"PresetExclGrFreq"
kExclGrTransp	chnget	"PresetExclGrTransp"
kExclTime	chnget	"PresetExclTime"
kExclWave   	chnget	"PresetExclWave"
kExclSweep   	chnget	"PresetExclSweep"
kExclTrnCps   	chnget	"PresetExclTrainCps"

;	$ReadPresetFromTable(GrAmp'      0) ;commented out in original
;	$ReadPresetFromTable(Sync'       1) ;commented out in original

if kExclGrFreq == 1 goto skipGrFreq
	$ReadPresetFromTable(GrFreq'     2)	
skipGrFreq:

	$ReadPresetFromTable(GfFmFqRat'  3)
	$ReadPresetFromTable(GfFmIndx'   4)
	$ReadPresetFromTable(GrDist'     5)

if kExclTrnCps == 1 goto skipTrnCps
	$ReadPresetFromTable(TrnCps'       6)
skipTrnCps:

if kExclGrTransp == 1 goto skipGrTransp
	$ReadPresetFromTable(GrTransp'   7)
skipGrTransp:

if kExclSweep == 1 goto skipGrSweep
	$ReadPresetFromTable(FqCenter'   8)
	$ReadPresetFromTable(SweepShap'   9)
skipGrSweep:

	$ReadPresetFromTable(GrShape'    10)
	$ReadPresetFromTable(GrAttack'   11)
	$ReadPresetFromTable(GrDur'      12)
	$ReadPresetFromTable(FmFreq'     13)
	$ReadPresetFromTable(FmIndex'    14)
	$ReadPresetFromTable(TrnAmp'     15)
	$ReadPresetFromTable(TrnPart'    16)
	$ReadPresetFromTable(TrnChrom'   17)
	$ReadPresetFromTable(GainMsk1'   18)
	$ReadPresetFromTable(GainMsk2'   19)
	$ReadPresetFromTable(ChMask1'    20)
	$ReadPresetFromTable(ChMask2'    21)
	$ReadPresetFromTable(RandMask'   22)

if kExclWave == 1 goto skipWave
	$ReadPresetFromTable(JoyX'       23)
	$ReadPresetFromTable(JoyY'       24)
skipWave:

if kExclTime == 1 goto skipTime
	$ReadPresetFromTable(TimePos'    25)
	$ReadPresetFromTable(timLfoFq'   26)
	$ReadPresetFromTable(timLfoAm'   27)
skipTime:

	$ReadPresetFromTable(displDly2'	 28)
	$ReadPresetFromTable(chRewrit'	 29)
	$ReadPresetFromTable(width'      30);
	$ReadPresetFromTable(chorusAmt'  31)
	$ReadPresetFromTable(reverbAmt'  32)


	endin

;***************************************************************
; recall presets and interpolate between two presets
;***************************************************************
	instr 108

	iPreset1	chnget	"PreX1Num"
	iPreset2	chnget	"PreX2Num"

	kXfadeIndex	chnget	"PreXindx"
	
#include "interpolatePresets.inc"

	endin

;***************************************************************
; Write preset table to file
;***************************************************************
	instr 118

ftsave gSPresetFileName, 1, giPresetTable

	endin

;***************************************************************
; Read preset table from file
;***************************************************************
	instr 119

ftload gSPresetFileName, 1, giPresetTable

	endin


; bogus midi instr
	instr 200
	endin

; effects, instr 300 and up
#include "channelEffects.inc"

</CsInstruments>

<CsScore>

#define SCORELEN # 1000 #

i1  	0 $SCORELEN 	; chn init
;i 119  	0 0.1		; read presets from disk
i301  	0 $SCORELEN 	; chorus
i302  	0 $SCORELEN 	; reverb

;The lines below drive sound for testing purposes,
;comment out when using controlP5 GUI

;i103  	1 $SCORELEN 	; partikkel
;i99	3 	1 	"FqCenter" 	1.3
;i99	3.5	1	"GrFreq"	6
;i99	4 	1 	"FqCenter" 	1
;i99	5	1	"GrDist" 	0.6
;i99	7	1	"FmIndex"	7
;i99	8	1	"width"		1
;i99	8	1	"ChMask2"	2 

;experimenting with preset handling
;i103  	1 $SCORELEN 	; partikkel
;i99	3 	1 	"FqCenter" 	1.3 	;change the sound
;i106 	5 	0.1						;store the sound to preset
;i99	7	1	"GrFreq"	6 			;change the sound
;i107 	9 	0.1 0 					;recall the sound from preset 
;i107 	5 	0.1 0 	
;i107 	6 	0.1 0 	
;i107 	7 	0.1 0 	
;i99	6	1	"GrFreq"	6
;i99	4 	1 	"FqCenter" 	1
;i99	5	1	"GrDist" 	0.6
;i99	7	1	"FmIndex"	7
;i99	8	1	"width"		1
;i99	8	1	"ChMask2"	2 


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
  <uuid>{354d9634-0c87-4876-8854-988175fc707a}</uuid>
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
