const_value set 2
	const ROUTE5CLEANSETAGHOUSE_GRANNY
	const ROUTE5CLEANSETAGHOUSE_TEACHER

Route5CleanseTagHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GrannyScript_0x18b634:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue UnknownScript_0x18b649
	writetext UnknownText_0x18b655
	buttonsound
	verbosegiveitem CLEANSE_TAG
	iffalse UnknownScript_0x18b64d
	setevent EVENT_GOT_CLEANSE_TAG
UnknownScript_0x18b649:
	writetext UnknownText_0x18b6a7
	waitbutton
UnknownScript_0x18b64d:
	closetext
	end

Route5CleanseTagHouseTeacherScript:
	jumptextfaceplayer Route5CleanseTagHouseTeacherText

HouseForSaleBookshelf:
	jumpstd difficultbookshelf

UnknownText_0x18b655:
	text "Eeyaaaah!"

	para "I sense a sinister"
	line "shadow hovering"
	cont "over you."

	para "Take this to ward"
	line "it off!"
	done

UnknownText_0x18b6a7:
	text "You were in mortal"
	line "danger, but you"
	cont "are protected now."
	done

Route5CleanseTagHouseTeacherText:
	text "My grandma is into"
	line "warding off what"

	para "she believes to be"
	line "evil spirits."

	para "I'm sorry that she"
	line "startled you."
	done

Route5CleanseTagHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 7, 4, ROUTE_5
	warp_event 3, 7, 4, ROUTE_5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 0, 1, BGEVENT_READ, HouseForSaleBookshelf
	bg_event 1, 1, BGEVENT_READ, HouseForSaleBookshelf

	db 2 ; object events
	object_event 2, 5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GrannyScript_0x18b634, -1
	object_event 5, 3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseTeacherScript, -1
