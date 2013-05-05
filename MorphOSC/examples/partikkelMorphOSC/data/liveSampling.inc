
;*************** Live Sampling instruments *******************

;***************************************************************
; write audio input to table
;***************************************************************
	instr 121

ain		inch	1			; audio in
ain		= ain/0dbfs
itable		chnget	"SampNum"		; get table number to write to
itable		table	itable, giAudioTableMap	; map table num into named tables numbers

	kstart	init 0
	kstart	tablewa	itable, ain, 0		;write audio ain to table itable

	endin

;***************************************************************
