

; chorus effect
; ain is input, aLeft and aRight are outputs

ilfoSpd		= 1.5
ilfoAmt		= 0.0025
irndAmt		= ilfoAmt*0.2
irndSpdMin 	= 5
irndSpdMax 	= 12

alfo1		oscil	ilfoAmt, ilfoSpd, giSine, 0		; lfo
arnd1		jspline	irndAmt, irndSpdMin, irndSpdMax 
alfo1		= alfo1 + ilfoAmt + arnd1		; offset
alfo2		oscil	ilfoAmt, ilfoSpd, giSine, 0.25	; lfo
arnd2		jspline	irndAmt, irndSpdMin, irndSpdMax 
alfo2		= alfo2 + ilfoAmt + arnd2		; offset
alfo3		oscil	ilfoAmt, ilfoSpd, giSine, 0.5	; lfo
arnd3		jspline	irndAmt, irndSpdMin, irndSpdMax 
alfo3		= alfo3 + ilfoAmt + arnd3		; offset
alfo4		oscil	ilfoAmt, ilfoSpd, giSine, 0.75	; lfo
arnd4		jspline	irndAmt, irndSpdMin, irndSpdMax 
alfo4		= alfo4 + ilfoAmt + arnd4		; offset

adelt1		= alfo1 + 0.001
adelt2		= alfo2 + 0.001
adelt3		= alfo3 + 0.001
adelt4		= alfo4 + 0.001
imaxdel		= 2
iwinsiz		= 4

a1		vdelayx	ain, adelt1, imaxdel, iwinsiz
a2		vdelayx	ain, adelt2, imaxdel, iwinsiz
a3		vdelayx	ain, adelt3, imaxdel, iwinsiz
a4		vdelayx	ain, adelt4, imaxdel, iwinsiz

aLeft		= (a1+a2+ain)*0.3
aRight		= (a3+a4+ain)*0.3

