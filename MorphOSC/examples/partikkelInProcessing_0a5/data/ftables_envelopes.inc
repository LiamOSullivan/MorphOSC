
giSine		ftgen	0, 0, 65537, 10, 1

giSigmoRise	ftgen	0, 0, 8193, 19, 0.5, 1, 270, 1		; rising sigmoid 
giSigmoFall	ftgen	0, 0, 8193, 19, 0.5, 1, 90, 1		; falling sigmoid 
giExpRise_	ftgen	0, 0, 8193,  5, 0.001, 8192, 1		; rising exponential
giExpFall_	ftgen	0, 0, 8193,  5, 1, 8192, 0.001		; falling exponential
giLinRise	ftgen	0, 0, 8193,  7, 0, 8192, 1		; rising linear
giLinFall	ftgen	0, 0, 8193,  7, 1, 8192, 0		; falling linear

; rewriting of exponentials, to cover full range 0.0 to 1.0
giExpRise	ftgen	0, 0, 8193, 24, giExpRise_, 0.0, 1.0
giExpFall	ftgen	0, 0, 8193, 24, giExpFall_, 0.0, 1.0
