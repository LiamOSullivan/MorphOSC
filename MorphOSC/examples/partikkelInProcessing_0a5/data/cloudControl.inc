
; cloud control automation, per voice

#define PartikkelCloudAutomationAll() #
; start values
	i1a_d_ratio	chnget 	"sGrAttack"		; balance between attack time and decay time, 0 = zero attack time and full decay time
	i1fmfq		chnget 	"sFmFreq"
	i1fmindx	chnget	"sFmIndex"
	i1nFmIndx	chnget	"snFmIndx"
	i1nFmDist	chnget	"snFmDist"
      i1nFmFreq       chnget	"snFmFreq"
	i1randommask	chnget	"sRandMask"	; random masking (muting) of individual grains
	i1samplepos	chnget	"sTimePos"	; start position for reading grain waveform
; end values
	iCa_d_ratio	chnget 	"CGrAttack"		; balance between attack time and decay time, 0 = zero attack time and full decay time
	iCdistribution	chnget	"CGrDist"		; periodic or stochastic distribution of grains, 0 = periodic
	iCfmfq	chnget 	"CFmFreq"
	iCfmindx	chnget	"CFmIndex"
	iCnFmIndx	chnget	"CnFmIndx"
	iCnFmDist	chnget	"CnFmDist"
      iCnFmFreq        chnget	"CnFmFreq"
	iCrandommask	chnget	"CRandMask"	; random masking (muting) of individual grains
	iCsamplepos	chnget	"CTimePos"	; start position for reading grain waveform
; curve trajectory values
	i2a_d_ratio	chnget 	"eGrAttack"		; balance between attack time and decay time, 0 = zero attack time and full decay time
	i2distribution	chnget	"eGrDist"		; periodic or stochastic distribution of grains, 0 = periodic
	i2fmfq		chnget 	"eFmFreq"
	i2fmindx	chnget	"eFmIndex"
	i2nFmIndx	chnget	"enFmIndx"
	i2nFmDist	chnget	"enFmDist"
        i2nFmFreq       chnget	"enFmFreq"
	i2randommask	chnget	"eRandMask"	; random masking (muting) of individual grains
	i2samplepos	chnget	"eTimePos"	; start position for reading grain waveform

; insert curve generators ->> chn for each voice here
	ka_d_ratio     transeg	i1a_d_ratio  , p3,iCa_d_ratio  ,i2a_d_ratio  
	kfmfq          transeg	i1fmfq       , p3,iCfmfq       ,i2fmfq       
	kfmindx        transeg	i1fmindx     , p3,iCfmindx     ,i2fmindx     
	knFmIndx       transeg	i1nFmIndx    , p3,iCnFmIndx    ,i2nFmIndx    
	knFmDist       transeg	i1nFmDist    , p3,iCnFmDist    ,i2nFmDist    
	knFmFreq       transeg	i1nFmFreq    , p3,iCnFmFreq    ,i2nFmFreq    
	krandommask    transeg	i1randommask , p3,iCrandommask ,i2randommask 
	ksamplepos     transeg	i1samplepos  , p3,iCsamplepos  ,i2samplepos  

#

#define PartikkelCloudAutomationVoice(A) #
; $A argument sets voice/instance

; start values
	i1amp		chnget	"sGrAmp$A"				; grain amplitude
	i1grainfreq	chnget	"sGrFreq$A"
	i1wavTransp	chnget 	"sGrTransp$A"
	i1GrainDur	chnget 	"sGrDur$A"		; grain duration, as multiple of grain frequency
	i1distribution	chnget	"sGrDist$A"		; periodic or stochastic distribution of grains, 0 = periodic
;end values
	i2amp		chnget	"eGrAmp$A"				; grain amplitude
	i2grainfreq	chnget	"eGrFreq$A"
	i2wavTransp	chnget 	"eGrTransp$A"
	i2GrainDur	chnget 	"eGrDur$A"		; grain duration, as multiple of grain frequency
	i2distribution	chnget	"eGrDist$A"		; periodic or stochastic distribution of grains, 0 = periodic
; curve trajectory values
	iCamp		chnget	"CGrAmp$A"				; grain amplitude
	iCgrainfreq	chnget	"CGrFreq$A"
	iCwavTransp	chnget 	"CGrTransp$A"
	iCGrainDur	chnget 	"CGrDur$A"		; grain duration, as multiple of grain frequency
	iCdistribution	chnget	"CGrDist$A"		; periodic or stochastic distribution of grains, 0 = periodic

; insert curve generators ->> chn for each voice here
	kamp		transeg	i1amp, 		p3, iCamp, 	i2amp
	kgrainfreq	transeg	i1grainfreq, 	p3, iCgrainfreq, i2grainfreq
	kwavTransp	transeg i1wavTransp, 	p3, iCwavTransp, i2wavTransp
	kGrainDur	transeg i1GrainDur,	p3, iCGrainDur, i2GrainDur
	kdistribution	transeg i1distribution, p3, iCdistribution, i2distribution
        chnset		kamp,     	"GrAmp$A"       
        chnset		kgrainfreq,     "GrFreq$A"
        chnset		kwavTransp,     "GrTransp$A"
        chnset		kGrainDur,      "GrDur$A"
        chnset		kdistribution,  "GrDist$A"

; write values from PartikkelCloudAutomationAll macro to each voice channel
	chnset	ka_d_ratio, "GrAttack$A"     
	chnset	kfmfq,      "FmFreq$A"    
	chnset	kfmindx,    "FmIndex$A"    
	chnset	knFmIndx,   "nFmIndx$A"    
	chnset	knFmDist,   "nFmDist$A"    
	chnset	knFmFreq,   "nFmFreq$A"    
	chnset	krandommask,"RandMask$A"    
	chnset	ksamplepos, "TimePos$A"     

#


$PartikkelCloudAutomationAll()
$PartikkelCloudAutomationVoice(1)
$PartikkelCloudAutomationVoice(2)
$PartikkelCloudAutomationVoice(3)
$PartikkelCloudAutomationVoice(4)

