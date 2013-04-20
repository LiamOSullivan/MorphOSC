
; these parameters may be excluded from preset recall
kExclGrFreq	chnget	"PresetExclGrFreq"
kExclGrTransp	chnget	"PresetExclGrTransp"
kExclTime	chnget	"PresetExclTime"
kExclWave   	chnget	"PresetExclWave"
kExclSweep   	chnget	"PresetExclSweep"
kExclTrnCps   	chnget	"PresetExclTrainCps"

;	$ReadPresetFromTable(GrAmp'      0)
;	$ReadPresetFromTable(Sync'       1)

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
	$ReadPresetFromTable(width'      30)
	$ReadPresetFromTable(chorusAmt'  31)
	$ReadPresetFromTable(reverbAmt'  32)

