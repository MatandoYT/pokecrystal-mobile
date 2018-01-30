const_value set 2
	const ROUTE8SAFFRONGATE_OFFICER

Route8SaffronGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route8SaffronGateOfficerScript:
	jumptextfaceplayer Route8SaffronGateOfficerText

Route8SaffronGateOfficerText:
	text "Have you been to"
	line "LAVENDER TOWN?"

	para "There's a tall"
	line "RADIO TOWER there."
	done

Route8SaffronGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 0, 4, 14, SAFFRON_CITY
	warp_event 0, 5, 15, SAFFRON_CITY
	warp_event 9, 4, 1, ROUTE_8
	warp_event 9, 5, 2, ROUTE_8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 5, 2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route8SaffronGateOfficerScript, -1
