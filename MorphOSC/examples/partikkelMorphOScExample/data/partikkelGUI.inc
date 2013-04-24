
;*********************************************************************
; Gui widgets
;*********************************************************************
	instr	1

		FLpanel         "Partikkel",1080,670,100,100

iButn1PosX		= 20
iButn1PosY		= 10
iButnPosXoff		= 100
iButn2PosX		= iButn1PosX + iButnPosXoff
iButn3PosX		= iButn2PosX + iButnPosXoff
iButn4PosX		= iButn3PosX + iButnPosXoff
iButn5PosX		= iButn4PosX + iButnPosXoff
iButn6PosX		= iButn5PosX + iButnPosXoff
iButn7PosX		= iButn6PosX + iButnPosXoff

; Fader position grid
iFad1PosX		= 20
iFad1PosY		= 60
iFadPosXoff		= 73
iFadPosYoff		= 220
iFad2PosX		= iFad1PosX + iFadPosXoff
iFad3PosX		= iFad2PosX + iFadPosXoff
iFad4PosX		= iFad3PosX + iFadPosXoff
iFad5PosX		= iFad4PosX + iFadPosXoff
iFad6PosX		= iFad5PosX + iFadPosXoff
iFad7PosX		= iFad6PosX + iFadPosXoff
iFad8PosX		= iFad7PosX + iFadPosXoff
iFad9PosX		= iFad8PosX + iFadPosXoff
iFad10PosX		= iFad9PosX + iFadPosXoff
iFad11PosX		= iFad10PosX + iFadPosXoff
iFad12PosX		= iFad11PosX + iFadPosXoff
iFad13PosX		= iFad12PosX + iFadPosXoff
iFad14PosX		= iFad13PosX + iFadPosXoff
iFad15PosX		= iFad14PosX + iFadPosXoff
iFad16PosX		= iFad15PosX + iFadPosXoff
iFad2PosY		= iFad1PosY + iFadPosYoff
iFad3PosY		= iFad2PosY + iFadPosYoff

iJoyPosY		= iFad2PosY + iFadPosYoff

kOn, gihOn		FLbutton	"On", 1, 0, 2, 90, 20, iButn1PosX, iButn1PosY, -105, 0 
ktrigOn			trigger		kOn, 0.5, 0
schedkwhen		ktrigOn, 0, 0, 103, 0, -1	; activate instr 3
ktrigOff		trigger		kOn, 0.5, 1
schedkwhen		ktrigOff, 0, 0, -103, 0, 1	; turnoff instr 3

;kSync, gihSync		FLbutton	"Sync", 1, 0, 2, 90, 20, iButn2PosX, iButn1PosY, -105, 0 
;			chnset		kSync, "Sync"

kSample, gihSample	FLbutton	"Sample", 1, 0, 2, 90, 20, iButn4PosX, iButn1PosY, -105, 0 
kSampleOn		trigger		kSample, 0.5, 0
schedkwhen		kSampleOn, 0, 0, 121, 0, -1	; activate instr 21
kSampleOff		trigger		kSample, 0.5, 1
schedkwhen		kSampleOff, 0, 0, -121, 0, 1	; turnoff instr 21

kSampNum, gihSampNum	FLcount	"SampNum", 0, 3, 1, 2, 1, 90, 20, iButn5PosX, iButn1PosY, -105, 0 
			chnset		kSampNum, "SampNum"

gkRecFile, ihRecFile	FLbutton	"RecToFile",    1, 0, 2, 90, 20,iFad11PosX, iButn1PosY, -105, 0
kRecOn			trigger		gkRecFile, 0.5, 0
schedkwhen		kRecOn, 0, 0, 500, 0, -1	; activate instr 500, record to file
kRecOff			trigger		gkRecFile, 0.5, 1
schedkwhen		kRecOff, 0, 0, -500, 0, 1	; turnoff instr 500


gkGuiDisable, ihGuiDis	FLbutton	"Disable Faders",    1, 0, 3, 20, 15,iFad13PosX, iButn1PosY, -1
			FLsetAlign	5, ihGuiDis


#define Fader(param'faderposX'faderposY'min'max'exp'initval)#
i$paramV		FLvalue		" ", 		40,  20, $faderposX - 10, $faderposY + 140
k$param,gih$param	FLslider	"$param", $min, $max, $exp, 6, i$paramV, 	20, 120, $faderposX, $faderposY
			FLsetVal_i	$initval, gih$param
			if gkGuiDisable > 0 kgoto skip$param
			chnset		k$param, "$param"
			skip$param:
#


$Fader(GrFreq'	 iFad1PosX' iFad1PosY' 0.1'1500'-1' 14)
$Fader(GfFmIndx' iFad2PosX' iFad1PosY' 0'1'0'	   0)
$Fader(GfFmFqRat'iFad3PosX' iFad1PosY' 0'1'0'    0.5)
$Fader(GrDist'	 iFad4PosX' iFad1PosY' -1'10'0' 	   0)

$Fader(GrTransp' iFad5PosX' iFad1PosY' 0'2'0'	   1)
$Fader(FqCenter' iFad6PosX' iFad1PosY' 0.1'2'0'	   1)
$Fader(SweepShap'iFad7PosX' iFad1PosY' 0.0'1.0'0'0.5)
$Fader(FmIndex'	 iFad8PosX' iFad1PosY' 0'20'0'	   0)
$Fader(FmFreq'	 iFad9PosX' iFad1PosY' 0.1'1500'-1' 440)

$Fader(GrDur'	 iFad10PosX' iFad1PosY' 0.1'5'0'	   1)
$Fader(GrAttack' iFad11PosX' iFad1PosY' 0'1'0'	   0.5)
$Fader(GrShape'	 iFad12PosX' iFad1PosY' 0'1'0'	   0.5)

$Fader(TimePos'	 iFad13PosX' iFad1PosY' 0'1'0'	   0)
$Fader(timLfoFq' iFad14PosX' iFad1PosY' 0.1'1000'-1'	   0)
$Fader(timLfoAm' iFad15PosX' iFad1PosY' 0'1'0'	   0)

$Fader(GrAmp'	 iFad1PosX' iFad2PosY' 0'1'0'	   0.5)
$Fader(GainMsk1' iFad2PosX' iFad2PosY' 0'7'0'	   0)
$Fader(GainMsk2' iFad3PosX' iFad2PosY' 0'7'0'	   0)
$Fader(RandMask' iFad4PosX' iFad2PosY' 0'1'0'	   0)

$Fader(ChMask1'	 iFad5PosX' iFad2PosY' 0'7'0'	   0)
$Fader(ChMask2'	 iFad6PosX' iFad2PosY' 0'7'0'	   1)
$Fader(width'	 iFad7PosX' iFad2PosY' 0'1'0'	   0)
$Fader(displDly2'iFad8PosX' iFad2PosY' 0'1'0'	   0)
$Fader(chorusAmt'iFad9PosX' iFad2PosY' 0'1'0'	   0)
$Fader(reverbAmt'iFad10PosX'iFad2PosY' 0'1'0'	   0)
$Fader(chRewrit' iFad11PosX'iFad2PosY' 0'1'0'	   0)

$Fader(TrnAmp'	 iFad12PosX' iFad2PosY' 0'1'0'	   0)
$Fader(TrnCps'	 iFad13PosX' iFad2PosY' 0'1000'0' 440)
$Fader(TrnPart'	 iFad14PosX' iFad2PosY' 1'100'-1'   6)
$Fader(TrnChrom' iFad15PosX' iFad2PosY' 0'2'0'	   1.5)

; faders, row 3

$Fader(nFmIndx'	 iFad5PosX' iFad3PosY' 0'100'		0'	0)
$Fader(nFmDist'	 iFad6PosX' iFad3PosY' -1'1'		0'  	-0.1)
$Fader(nFmFreq'	 iFad7PosX' iFad3PosY' 0.1'20000'	-1'  	10000)


$Fader(PreXindx' iFad10PosX' iFad3PosY' 0'1'0'	   0)
kPreX1Num, ihPreX1Num	FLtext		" ", 0, 7, 1, 1, 40, 20, iFad10PosX-50, iJoyPosY	
			FLsetVal_i	0, ihPreX1Num
			kPreX1Num	limit	kPreX1Num, 0, 7
			chnset	kPreX1Num, "PreX1Num"
kPreX2Num, ihPreX2Num	FLtext		" ", 0, 7, 1, 1, 45, 20, iFad10PosX-50, iJoyPosY+100 
			FLsetVal_i	2, ihPreX2Num
			kPreX2Num	limit	kPreX2Num, 0, 7
			chnset	kPreX2Num, "PreX2Num"
kPreXBut, gihPreXOn	FLbutton	"PreX", 1, 0, 2, 40, 20, iFad10PosX-50, iJoyPosY+50, -105, 0 
kPreXOn			trigger		kPreXBut, 0.5, 0
schedkwhen		kPreXOn, 0, 0, 108, 0, -1	; activate instr 8
kPreXOff		trigger		kPreXBut, 0.5, 1
schedkwhen		kPreXOff, 0, 0, -108, 0, 1	; turnoff instr 8



kJoyX, kJoyY, gihJoyX, gihJoyY \
		FLjoy "wave mix", 0, 1, 0, 1, 0, 0, -1, -1, 120, 120, iFad2PosX-25, iJoyPosY
		FLsetVal_i	0.5, gihJoyX
		FLsetVal_i	0.5, gihJoyY
		if gkGuiDisable > 0 kgoto skipJoy
		chnset	kJoyX, "JoyX"
		chnset	kJoyY, "JoyY"
		skipJoy:

kSamp1Num, ihSamp1Num	FLtext		" ", 0, 7, 1, 1, 40, 20, iFad1PosX-10, iJoyPosY 
FLsetVal_i	4, ihSamp1Num
			kSamp1Num	limit	kSamp1Num, 0, 7
			kSamp1Num_	table	kSamp1Num, giAudioTableMap
			chnset	kSamp1Num_, "Samp1Num"
kSamp2Num, ihSamp2Num	FLtext		" ", 0, 7, 1, 1, 40, 20, iFad4PosX-35, iJoyPosY
			FLsetVal_i	5, ihSamp2Num
			kSamp2Num	limit	kSamp2Num, 0, 7
			kSamp2Num_	table	kSamp2Num, giAudioTableMap
			chnset	kSamp2Num_, "Samp2Num"
kSamp3Num, ihSamp3Num	FLtext		" ", 0, 7, 1, 1, 40, 20, iFad1PosX-10, iJoyPosY+100
			FLsetVal_i	6, ihSamp3Num
			kSamp3Num	limit	kSamp3Num, 0, 7
			kSamp3Num_	table	kSamp3Num, giAudioTableMap
			chnset	kSamp3Num_, "Samp3Num"
kSamp4Num, ihSamp4Num	FLtext		" ", 0, 7, 1, 1, 40, 20, iFad4PosX-35, iJoyPosY+100
			FLsetVal_i	7, ihSamp4Num
			kSamp4Num	limit	kSamp4Num, 0, 7
			kSamp4Num_	table	kSamp4Num, giAudioTableMap
			chnset	kSamp4Num_, "Samp4Num"



kpreset, ihpreset 	FLbutBank 12, 2, 8, 70, 140, iFad11PosX, iFad3PosY, -1
			chnset	kpreset, "presetNumber"
kXfdTime, ihXfdTime	FLtext		"Xfade time", 0, 60, 1, 1, 70, 20, iFad12PosX+20, iFad3PosY+52
			FLsetVal_i	3, ihXfdTime
kPStor, ihPStore	FLbutton	"Store", 1, 0, 1, 70, 20, iFad12PosX+20, iFad3PosY, 105, 106, 0, 0.1
kPRecall, ihPRecall	FLbutton	"Recall", 1, 0, 1, 70, 20, iFad12PosX+20, iFad3PosY+26, 105, 107, 0, kXfdTime, kpreset
kPRead, ihPRead		FLbutton	"f-Write", 1, 0, 1, 70, 20, iFad12PosX+20, iFad3PosY+94, 105, 118, 0, 0.1
kPWrite, ihPWrite	FLbutton	"f-Read", 1, 0, 1, 70, 20, iFad12PosX+20, iFad3PosY+120, 105, 119, 0, 0.1

ihPExclude 		FLbox 		"recall exclude", 1, -1, 14, 15, 15, iFad13PosX+20, iFad3PosY
kPGrFreq, ihPGrFreq	FLbutton	"GrFreq", 1, 0, 3, 20, 15,    iFad13PosX+35, iFad3PosY+20, -1
kPGrTransp, ihPGrTransp	FLbutton	"GrTransp", 1, 0, 3, 20, 15,  iFad13PosX+35, iFad3PosY+40, -1
kPTime, ihPTime		FLbutton	"Time", 1, 0, 3, 20, 15,      iFad13PosX+35, iFad3PosY+60, -1
kPWave, ihPWave		FLbutton	"Wave", 1, 0, 3, 20, 15,      iFad13PosX+35, iFad3PosY+80, -1
kPSweep, ihPSweep	FLbutton	"Sweep", 1, 0, 3, 20, 15,     iFad13PosX+35, iFad3PosY+100, -1
kPTrnCps, ihPTrnCps	FLbutton	"TrainCps", 1, 0, 3, 20, 15,     iFad13PosX+35, iFad3PosY+120, -1

			FLsetAlign	5, ihPExclude
			FLsetAlign	5, ihPGrFreq
			FLsetAlign	5, ihPGrTransp
			FLsetAlign	5, ihPTime
			FLsetAlign	5, ihPWave
			FLsetAlign	5, ihPSweep
			FLsetAlign	5, ihPTrnCps

	chnset	kPGrFreq, "PresetExclGrFreq"
	chnset	kPGrTransp, "PresetExclGrTransp"
	chnset	kPTime, "PresetExclTime"
	chnset	kPWave, "PresetExclWave"
	chnset	kPSweep, "PresetExclSweep"
	chnset	kPTrnCps, "PresetExclTrainCps"

        	FLpanel_end     
   		FLrun		


	
	endin
;*********************************************************************

;*********************************************************************
; instrument to turn the sound on or off (manipulating the gui "on" button)
;*********************************************************************
	instr 2

	iState = p4			; the state can be 1 (on) or 0 (off)
	FLsetVal_i	iState, gihOn

	endin
;*********************************************************************
