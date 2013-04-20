
;*********************************************************************
; replacement for Gui widgets
;*********************************************************************
	instr	1

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
	
	endin
;*********************************************************************

