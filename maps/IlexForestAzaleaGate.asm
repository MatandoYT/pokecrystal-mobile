const_value set 2
	const ILEXFORESTAZALEAGATE_OFFICER
	const ILEXFORESTAZALEAGATE_GRANNY

IlexForestAzaleaGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

IlexForestAzaleaGateOfficerScript:
	jumptextfaceplayer IlexForestAzaleaGateOfficerText

IlexForestAzaleaGateGrannyScript:
	jumptextfaceplayer IlexForestAzaleaGateGrannyText

IlexForestAzaleaGateOfficerText:
	text "ILEX FOREST is"
	line "big. Be careful!"
	cont "Don't get lost."
	done

IlexForestAzaleaGateGrannyText:
	text "The FOREST is"
	line "watched over by"
	cont "its protector."

	para "Stay out of"
	line "mischief!"
	done

IlexForestAzaleaGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 2, ILEX_FOREST
	warp_def $5, $0, 3, ILEX_FOREST
	warp_def $4, $9, 7, AZALEA_TOWN
	warp_def $5, $9, 8, AZALEA_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, IlexForestAzaleaGateOfficerScript, -1
	person_event SPRITE_GRANNY, 3, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, IlexForestAzaleaGateGrannyScript, -1
