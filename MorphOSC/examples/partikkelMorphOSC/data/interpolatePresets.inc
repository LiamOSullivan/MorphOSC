
; these parameters may be excluded from preset recall
kExclGrFreq	chnget	"PresetExclGrFreq"
kExclGrTransp	chnget	"PresetExclGrTransp"
kExclTime	chnget	"PresetExclTime"
kExclWave   	chnget	"PresetExclWave"
kExclSweep   	chnget	"PresetExclSweep"
kExclTrnCps   	chnget	"PresetExclTrainCps"

;	$InterpolatePresetsFromTable(GrAmp'      0)
;	$InterpolatePresetsFromTable(Sync'       1)

if kExclGrFreq == 1 goto skipGrFreq
	$InterpolatePresetsFromTable(GrFreq'     2)
skipGrFreq:

	$InterpolatePresetsFromTable(GfFmFqRat'  3)
	$InterpolatePresetsFromTable(GfFmIndx'   4)
	$InterpolatePresetsFromTable(GrDist'     5)

if kExclTrnCps == 1 goto skipTrnCps
	$InterpolatePresetsFromTable(TrnCps'       6)
skipTrnCps:

if kExclGrTransp == 1 goto skipGrTransp
	$InterpolatePresetsFromTable(GrTransp'   7)
skipGrTransp:

if kExclSweep == 1 goto skipGrSweep
	$InterpolatePresetsFromTable(FqCenter'   8)
	$InterpolatePresetsFromTable(SweepShap'   9)
skipGrSweep:

	$InterpolatePresetsFromTable(GrShape'    10)
	$InterpolatePresetsFromTable(GrAttack'   11)
	$InterpolatePresetsFromTable(GrDur'      12)
	$InterpolatePresetsFromTable(FmFreq'     13)
	$InterpolatePresetsFromTable(FmIndex'    14)
	$InterpolatePresetsFromTable(TrnAmp'     15)
	$InterpolatePresetsFromTable(TrnPart'    16)
	$InterpolatePresetsFromTable(TrnChrom'   17)
	$InterpolatePresetsFromTable(GainMsk1'   18)
	$InterpolatePresetsFromTable(GainMsk2'   19)
	$InterpolatePresetsFromTable(ChMask1'    20)
	$InterpolatePresetsFromTable(ChMask2'    21)
	$InterpolatePresetsFromTable(RandMask'   22)

if kExclWave == 1 goto skipWave
	$InterpolatePresetsFromTable(JoyX'       23)
	$InterpolatePresetsFromTable(JoyY'       24)
skipWave:

if kExclTime == 1 goto skipTime
	$InterpolatePresetsFromTable(TimePos'    25)
	$InterpolatePresetsFromTable(timLfoFq'   26)
	$InterpolatePresetsFromTable(timLfoAm'   27)
skipTime:

	$InterpolatePresetsFromTable(displDly2'	 28)
	$InterpolatePresetsFromTable(chRewrit'	 29)
	$InterpolatePresetsFromTable(width'      30)
	$InterpolatePresetsFromTable(chorusAmt'  31)
	$InterpolatePresetsFromTable(reverbAmt'  32)

