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



a1, a2, a3, a4 partikkel agrainfreq, kdistribution, idisttab, async, kenv2amt, ienv2tab, \
               ienv_attack, ienv_decay, ksustain_amount, ka_d_ratio, kduration, kamp, igainmasks, \
               kwavfreq, ksweepshape, iwavfreqstarttab, iwavfreqendtab, awavfm, \
               ifmamptab, kfmenv, icosine, kTrainCps, knumpartials, \
               kchroma, ichannelmasks, krandommask, kwaveform1, kwaveform2, kwaveform3, kwaveform4, \
               iwaveamptab, asamplepos1, asamplepos2, asamplepos3, asamplepos4, \
               kwavekey1, kwavekey2, kwavekey3, kwavekey4, imax_grains


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


