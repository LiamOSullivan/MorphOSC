
; masking tables
giGainMask	ftgen	0, 0, 8, -2, 0, 0, 1, 0.2, 0.5, 0.8, 0.1, 0.3, 0.5, 0.6		; gain mask table
giChnMask	ftgen	0, 0, 8, -2, 0, 0, 0, 1, 2, 3, 2.5, 1.5, 0.5, 3			; channel mask table

giChnMaskOrig	ftgen	0, 0, 8, -2, 0, 0, 0, 1, 2, 3, 2.5, 1.5, 0.5, 3			; a manually typed copy of giChnMask

giWavAmps	ftgen	0, 0, 32, -2, 0, 0, 1, 0, 0, 0, 0,  0, 1, 0, 0, 0, 1, 1, 0, 0, 0		; gain per wave per grain

giWavfreqStart	ftgen	0, 0, 8, -2, 0, 0, 1,2,3,4					; start freq scalers
giWavfreqEnd	ftgen	0, 0, 8, -2, 0, 0, 1,0.5,5					; end freq scalers

giFmAmps	ftgen	0, 0, 8, -2, 0, 0,  0,0.25,0.5,1				; fm index scalers

giProbDist	ftgen	0, 0, 1024, 7, 1, 1024, 0					; probability distribution for random grain masking
;giProbDist	ftgen	0, 0, 16, 16, 1, 16, -10, 0					; probability distribution for random grain masking
;giProbDist	ftgen	0, 0, 1024, 21, 4, 1 					; probability distribution for random grain masking