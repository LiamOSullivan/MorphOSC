
; read values from master chn
	kamp		chnget	"GrAmp"				; grain amplitude
	kgrainfreq	chnget	"GrFreq"
	kgffmfq		chnget 	"GfFmFqRat"
	kgffmindx	chnget	"GfFmIndx"
	kdistribution	chnget	"GrDist"		; periodic or stochastic distribution of grains, 0 = periodic
	kwavTransp	chnget "GrTransp"
	kwavFqCenter	chnget	"FqCenter"		; grain wave frequency gravity center (for sweeps)
	ksweepduration	chnget	"SweepDur"		; frequency sweep duration (as fraction of grain duration)
	ksustain_amount	chnget "GrShape"		; balance between enveloped time(attack+decay) and sustain level time, 0 = no time at sustain level
	ka_d_ratio	chnget "GrAttack"		; balance between attack time and decay time, 0 = zero attack time and full decay time
	kGrainDur	chnget "GrDur"		; grain duration, as multiple of grain frequency
	kfmfq		chnget 	"FmFreq"
	kfmindx		chnget	"FmIndex"
	knFmIndx	chnget	"nFmIndx"
	knFmDist	chnget	"nFmDist"
        knFmFreq        chnget	"nFmFreq"
	kgainmaskfrom	chnget	"GainMsk1"	; gain masking index start
	kgainmaskto	chnget	"GainMsk2"	; gain masking index end (loop point)
	kchannelmaskfrom chnget	"ChMask1"	; channel masking index start
	kchannelmaskto	chnget	"ChMask2"	; channel masking index end (loop point)
	krandommask	chnget	"RandMask"	; random masking (muting) of individual grains
	ksamplepos	chnget	"TimePos"	; start position for reading grain waveform
	kTimeLfoFreq	chnget	"timLfoFq"
	kTimeLfoAmt	chnget	"timLfoAm"

; copy values to voice channel only if GUI values has changed, else leaving cloud end values as is
#define CopyChnIfChanged(parm'chname'voiceN) #
	kT$parm		changed		k$parm
	if kT$parm == 0 kgoto skip$parm$voiceN
	chnset  k$parm,		"$chname"	
skip$parm$voiceN:
#


; copy values to voice specific chn
#define CopyPartikkelChn(voice) #

$CopyChnIfChanged(amp'GrAmp$voice'$voice)
$CopyChnIfChanged(grainfreq'GrFreq$voice'$voice)
$CopyChnIfChanged(gffmfq'GfFmFqRat$voice'$voice)
$CopyChnIfChanged(gffmindx'GfFmIndx$voice'$voice)
$CopyChnIfChanged(distribution'GrDist$voice'$voice)
$CopyChnIfChanged(wavTransp'GrTransp$voice'$voice)
$CopyChnIfChanged(wavFqCenter'FqCenter$voice'$voice)
$CopyChnIfChanged(sweepduration'SweepDur$voice'$voice)
$CopyChnIfChanged(sustain_amount'GrShape$voice'$voice)
$CopyChnIfChanged(a_d_ratio'GrAttack$voice'$voice)
$CopyChnIfChanged(GrainDur'GrDur$voice'$voice)
$CopyChnIfChanged(fmfq'FmFreq$voice'$voice)
$CopyChnIfChanged(fmindx'FmIndex$voice'$voice)
$CopyChnIfChanged(nFmIndx'nFmIndx$voice'$voice)
$CopyChnIfChanged(nFmDist'nFmDist$voice'$voice)
$CopyChnIfChanged(nFmFreq'nFmFreq$voice'$voice)
$CopyChnIfChanged(gainmaskfrom'GainMsk1$voice'$voice)
$CopyChnIfChanged(gainmaskto'GainMsk2$voice'$voice)
$CopyChnIfChanged(channelmaskfrom'ChMask1$voice'$voice)
$CopyChnIfChanged(channelmaskto'ChMask2$voice'$voice)
$CopyChnIfChanged(randommask'RandMask$voice'$voice)
$CopyChnIfChanged(samplepos'TimePos$voice'$voice)
$CopyChnIfChanged(TimeLfoFreq'timLfoFq$voice'$voice)
$CopyChnIfChanged(TimeLfoAmt'timLfoAm$voice'$voice)

#

$CopyPartikkelChn(1)
$CopyPartikkelChn(2)
$CopyPartikkelChn(3)
$CopyPartikkelChn(4)


