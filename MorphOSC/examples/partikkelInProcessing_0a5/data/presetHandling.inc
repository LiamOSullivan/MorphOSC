
;*************** Preset Handling instruments *******************

;***************************************************************
; store presets
;***************************************************************
	instr 106

	iPreset		chnget	"presetNumber"

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

#include "recallPresets.inc"

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

