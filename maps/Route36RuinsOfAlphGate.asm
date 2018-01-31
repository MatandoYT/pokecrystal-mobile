const_value set 2 ; person constants
	const ROUTE36RUINSOFALPHGATE_OFFICER
	const ROUTE36RUINSOFALPHGATE_GRAMPS

Route36RuinsOfAlphGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route36RuinsOfAlphGateOfficerScript:
	jumptextfaceplayer Route36RuinsOfAlphGateOfficerText

Route36RuinsOfAlphGateGrampsScript:
	jumptextfaceplayer Route36RuinsOfAlphGateGrampsText

Route36RuinsOfAlphGateOfficerText:
	text "Don't you wonder"
	line "who'd make some-"
	cont "thing like this?"
	cont "And why?"
	done

Route36RuinsOfAlphGateGrampsText:
	text "Did you see that"
	line "strange tree in"
	cont "the road?"

	para "That may explain"
	line "why fewer people"

	para "are visiting the"
	line "RUINS OF ALPH."
	done

Route36RuinsOfAlphGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 4, 0, 3, ROUTE_36
	warp_event 5, 0, 4, ROUTE_36
	warp_event 4, 7, 9, RUINS_OF_ALPH_OUTSIDE
	warp_event 5, 7, 9, RUINS_OF_ALPH_OUTSIDE

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 0, 4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36RuinsOfAlphGateOfficerScript, -1
	object_event 7, 5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route36RuinsOfAlphGateGrampsScript, -1
