const_value set 2
	const ROUTE30BERRYHOUSE_POKEFAN_M

Route30BerryHouse_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x196d64:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
	iftrue UnknownScript_0x196d79
	writetext UnknownText_0x196d82
	buttonsound
	verbosegiveitem BERRY
	iffalse UnknownScript_0x196d7d
	setevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
UnknownScript_0x196d79:
	writetext UnknownText_0x196dec
	waitbutton
UnknownScript_0x196d7d:
	closetext
	end

Route30BerryHouseBookshelf:
	jumpstd magazinebookshelf

UnknownText_0x196d82:
	text "You know, #MON"
	line "eat BERRIES."

	para "Well, my #MON"
	line "got healthier by"
	cont "eating a BERRY."

	para "Here. I'll share"
	line "one with you!"
	done

UnknownText_0x196dec:
	text "Check trees for"
	line "BERRIES. They just"
	cont "drop right off."
	done

Route30BerryHouse_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_event 2, 7, 1, ROUTE_30
	warp_event 3, 7, 1, ROUTE_30

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 0, 1, BGEVENT_READ, Route30BerryHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, Route30BerryHouseBookshelf

.ObjectEvents:
	db 1
	object_event 2, 3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanMScript_0x196d64, -1
