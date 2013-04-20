; ****** chorus effect ******
instr 301
ain	chnget	"chorusSend"
	chnclear "chorusSend"
#include "efx_chorus.inc"
outs	aLeft, aRight

; send to master for recording to file
	chnmix	aLeft,	"MasterAudioLeft"
	chnmix	aRight,	"MasterAudioRight"

endin

; ****** reverb effect ******
instr 302
ain	chnget	"reverbSend"
	chnclear "reverbSend"
#include "efx_reverbsc.inc"
outs	aLeft, aRight

; send to master for recording to file
	chnmix	aLeft,	"MasterAudioLeft"
	chnmix	aRight,	"MasterAudioRight"

endin

