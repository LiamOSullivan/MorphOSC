
; midi control
	instr 102

kctrl_1	ctrl7	1, 1, 0, 1	; mod wheel on channel 1
kctrl_1	tonek	kctrl_1, 1	; filter (using computer keyboard to send ctrl values)

kctrl1, kctrl2, kctrl3, kctrl4, kctrl5, kctrl6, kctrl7, kctrl8,\
kctrl9, kctrl10, kctrl11, kctrl12, kctrl13, kctrl14, kctrl15, kctrl16	\
	slider16	9,	\
	1, 0, 	1,	0,	0,	\
	2, 0,1500,	0,	giExpRise,	\
	3, 0, 	2,	0,	0,	\
	4, 0,   5,	0,	0,	\
	5, 0, 	1,	0,	0,	\
	6, 0, 	20,	0,	0,	\
	7, 0,	1500,	0,	giExpRise,	\
	8, 0, 	1,	0,	0,	\
	9, 0, 	7,	0,	0,	\
	10, 0, 	7,	0,	0,	\
	11, 0, 	1,	0,	0,	\
	12, 0, 	1,	0,	0,	\
	13, 0, 	1,	0,	0,	\
	14, 0, 	1,	0,	0,	\
	15, 0, 	1,	0,	0,	\
	16, 0, 	1,	0,	0	

ktrig1	changed	kctrl1
ktrig2	changed	kctrl2
ktrig3	changed	kctrl3
ktrig4	changed	kctrl4
ktrig5	changed	kctrl5
ktrig6	changed	kctrl6
ktrig7	changed	kctrl7
ktrig8	changed	kctrl8
ktrig9	changed	kctrl9
ktrig10	changed	kctrl10
ktrig11	changed	kctrl11
ktrig12	changed	kctrl12
ktrig13	changed	kctrl13
ktrig14	changed	kctrl14
ktrig15	changed	kctrl15
ktrig16	changed	kctrl16

ktrig_1		changed kctrl_1
ktrig15		= ktrig15 + ktrig_1
kctrl15b	= kctrl15+kctrl_1	; allow both controllers to set preset interpolate index


FLsetVal ktrig1,  kctrl1,  gihGrAmp 
FLsetVal ktrig2,  kctrl2,  gihGrFreq    
FLsetVal ktrig3,  kctrl3,  gihFqCenter  
FLsetVal ktrig4,  kctrl4,  gihGrDur     
FLsetVal ktrig5,  kctrl5,  gihGrAttack  
FLsetVal ktrig6,  kctrl6,  gihFmIndex   
FLsetVal ktrig7,  kctrl7,  gihFmFreq    
FLsetVal ktrig8,  kctrl8,  gihSweepShap
FLsetVal ktrig9,  kctrl9,  gihChMask2   
FLsetVal ktrig10, kctrl10, gihGainMsk2  
FLsetVal ktrig11, kctrl11, gihwidth     
;efx
FLsetVal ktrig12, kctrl12, gihdisplDly2 
FLsetVal ktrig12, kctrl12, gihchorusAmt
FLsetVal ktrig12, kctrl12, gihreverbAmt

FLsetVal ktrig13, kctrl13, gihJoyX
FLsetVal ktrig13, kctrl14, gihJoyY
FLsetVal ktrig14, kctrl13, gihJoyX	; hack for joy set val
FLsetVal ktrig14, kctrl14, gihJoyY

FLsetVal ktrig15, kctrl15b, gihPreXindx
FLsetVal ktrig16, kctrl16, gihTimePos   

; note on mapping on channel 9
kstatus, kchan, kdata1, kdata2 midiin
if kchan != 9 kgoto end
if kstatus == 144 kgoto noteon
goto end

noteon:
	if kdata1 != 64 kgoto end
	if kdata2 == 0 kgoto noteoff
	schedkwhen 1, 0, 1, 108, 0, -1
	kgoto end
noteoff:
	schedkwhen 1, 0, 1, -108, 0, 0.1
	kgoto end


end:
	endin