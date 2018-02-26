RuinsOfAlphAerodactylChamber_MapScripts:
	db 2 ; scene scripts
	scene_script .CheckWall ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	priorityjump .WallOpenScript
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	return

.WallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_FINISHED
	closetext
	end

MapRuinsOfAlphAerodactylChamberSignpost2Script:
	refreshscreen
	writebyte UNOWNPUZZLE_AERODACTYL
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_AERODACTYL_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_S_TO_W
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, MovementData_0x58e4d
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

MapRuinsOfAlphAerodactylChamberSignpost1Script:
	jumptext UnknownText_0x58ec2

MapRuinsOfAlphAerodactylChamberSignpost3Script:
	jumptext UnknownText_0x58ee7

MapRuinsOfAlphAerodactylChamberSignpost4Script:
	opentext
	writetext UnknownText_0x58e4f
	writebyte UNOWNWORDS_LIGHT
	special DisplayUnownWords
	closetext
	end

MapRuinsOfAlphAerodactylChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue .WallOpen
	opentext
	writetext UnknownText_0x58e81
	writebyte UNOWNWORDS_LIGHT
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext UnknownText_0x58ea2
	waitbutton
	closetext
	end

MovementData_0x58e4d:
	skyfall_top
	step_end

UnknownText_0x58e4f:
	text "Patterns appeared"
	line "on the walls…"
	done

; unused
UnusedText_0x58e70:
	text "It's UNOWN text!"
	done

UnknownText_0x58e81:
	text "Patterns appeared"
	line "on the walls…"
	done

UnknownText_0x58ea2:
	text "There's a big hole"
	line "in the wall!"
	done

UnknownText_0x58ec2:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

UnknownText_0x58ee7:
	text "This flying #-"
	line "MON attacked its"

	para "prey with saw-like"
	line "fangs."
	done

RuinsOfAlphAerodactylChamber_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 4
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 4
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 8
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 9
	warp_event  4,  0, RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event  2,  3, BGEVENT_READ, MapRuinsOfAlphAerodactylChamberSignpost1Script
	bg_event  5,  3, BGEVENT_READ, MapRuinsOfAlphAerodactylChamberSignpost1Script
	bg_event  3,  2, BGEVENT_UP, MapRuinsOfAlphAerodactylChamberSignpost2Script
	bg_event  4,  2, BGEVENT_UP, MapRuinsOfAlphAerodactylChamberSignpost3Script
	bg_event  3,  0, BGEVENT_UP, MapRuinsOfAlphAerodactylChamberSignpost4Script
	bg_event  4,  0, BGEVENT_UP, MapRuinsOfAlphAerodactylChamberSignpost5Script

	db 0 ; object events
