
gimaxchannels	= 80	; max number of preset values (parameter channels)
gSPresetFileName = "partikkelPresets.pst"

giPresetTable	ftgen	0, 0, 8192, -2, 0	; empty table for presets

#define WritePresetToTable(parm ' index) #
	i$parm		chnget	"$parm"							; read value from channel
			tableiw	i$parm, $index+(iPreset*gimaxchannels), giPresetTable	; write value to table
#

#define ReadPresetFromTable(parm ' index) #
	i$parm_Current	chnget	"$parm"						; read current value from channel
	i$parm_Target	table	$index+(iPreset*gimaxchannels), giPresetTable	; read destination (preset) value from table	
;	k$parm		line	i$parm_Current, iXfadeTime, i$parm_Target	; line providing interpolation
	k$parm		= (kXfadeIndex*(i$parm_Target-i$parm_Current))+i$parm_Current	; preset interpolation formula
			if gkGuiDisable > 0 kgoto skip_$parm
			FLsetVal 1, k$parm, gih$parm
			skip_$parm:
			chnset		k$parm, "$parm"

#

#define InterpolatePresetsFromTable(parm ' index) #
	i$parm_Current	table	$index+(iPreset1*gimaxchannels), giPresetTable	; read current value from table
	i$parm_Target	table	$index+(iPreset2*gimaxchannels), giPresetTable	; read destination (preset) value from table	
	k$parm		= (kXfadeIndex*(i$parm_Target-i$parm_Current))+i$parm_Current	; preset interpolation formula
			if gkGuiDisable > 0 kgoto skip_$parm
			chnset		k$parm, "$parm"
			FLsetVal 1, k$parm, gih$parm
			skip_$parm:
#
