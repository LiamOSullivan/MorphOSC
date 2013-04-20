
kspeed	chnget	"chRewrit"

if kspeed < 0.01 kgoto restoreOriginal
kRestoreFlag	= 0

kval1	oscil	0.5, kspeed*1, giTri
kval2	oscil	0.5, kspeed*1.3,giTri
kval3	oscil	0.5, kspeed*1.5,giTri
kval4	oscil	0.5, kspeed*1.7,giTri
inumchannels	= 4
kval1	= ((kval1+0.5) * (inumchannels-1))
kval2	= ((kval2+0.5) * (inumchannels-1))
kval3	= ((kval3+0.5) * (inumchannels-1))
kval4	= ((kval4+0.5) * (inumchannels-1))
	tablew	kval1, 2, giChnMask
	tablew	kval2, 3, giChnMask
	tablew	kval3, 4, giChnMask
	tablew	kval4, 5, giChnMask

kgoto noRestore

restoreOriginal:
if kRestoreFlag == 1 kgoto nocopy
	tablecopy	giChnMask, giChnMaskOrig
	kRestoreFlag	= 1
nocopy:
noRestore: