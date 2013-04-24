
; samples
giSound1	ftgen	0, 0, 262144, 1, "1.wav", 0, 0, 1
giSound2	ftgen	0, 0, 262144, 1, "2.wav", 0, 0, 1
giSound3	ftgen	0, 0, 262144, 1, "3.wav", 0, 0, 1
giSound4	ftgen	0, 0, 262144, 1, "4.wav", 0, 0, 1

giLive1		ftgen	0, 0, 262144, 2, 0	; empty table for live sampling
giLive2		ftgen	0, 0, 262144, 2, 0	; empty table for live sampling
giLive3		ftgen	0, 0, 262144, 2, 0	; empty table for live sampling
giLive4		ftgen	0, 0, 262144, 2, 0	; empty table for live sampling

giAudioTableMap	ftgen	0, 0, 16, -2, \		; map of table numbers for named tables containing audio waveforms
giLive1, giLive2, giLive3, giLive4,\	
giSound1, giSound2, giSound3, giSound4
