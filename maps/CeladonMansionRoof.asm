const_value set 2
	const CELADONMANSIONROOF_FISHER

CeladonMansionRoof_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansionRoofFisherScript:
	jumptextfaceplayer CeladonMansionRoofFisherText

MapCeladonMansionRoofSignpost0Script:
	jumptext UnknownText_0x71aa1

CeladonMansionRoofFisherText:
	text "High places--I do"
	line "love them so!"

	para "I'd say the only"
	line "thing that loves"

	para "heights as much as"
	line "me is smoke!"
	done

UnknownText_0x71aa1:
	text "There's graffiti"
	line "on the wall…"

	para "<PLAYER> added a"
	line "moustache!"
	done

CeladonMansionRoof_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 1, 1, 1, CELADON_MANSION_3F
	warp_event 6, 1, 4, CELADON_MANSION_3F
	warp_event 2, 5, 1, CELADON_MANSION_ROOF_HOUSE

	db 0 ; coord events

	db 1 ; bg events
	bg_event 6, 1, BGEVENT_LEFT, MapCeladonMansionRoofSignpost0Script

	db 1 ; object events
	object_event 7, 5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofFisherScript, -1
