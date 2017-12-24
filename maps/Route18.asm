const_value set 2
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2

Route18_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperBoris:
	trainer EVENT_BEAT_BIRD_KEEPER_BORIS, BIRD_KEEPER, BORIS, Bird_keeperBorisSeenText, Bird_keeperBorisBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext Bird_keeperBorisAfterBattleText
	waitbutton
	closetext
	end

TrainerBird_keeperBob:
	trainer EVENT_BEAT_BIRD_KEEPER_BOB, BIRD_KEEPER, BOB, Bird_keeperBobSeenText, Bird_keeperBobBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext Bird_keeperBobAfterBattleText
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

Bird_keeperBorisSeenText:
	text "If you're looking"
	line "for #MON, you"

	para "have to look in"
	line "the tall grass."
	done

Bird_keeperBorisBeatenText:
	text "Ayieee!"
	done

Bird_keeperBorisAfterBattleText:
	text "Since you're so"
	line "strong, it must be"
	cont "fun to battle."
	done

Bird_keeperBobSeenText:
	text "CYCLING ROAD is a"
	line "quick shortcut to"
	cont "CELADON."
	done

Bird_keeperBobBeatenText:
	text "…Whew!"
	done

Bird_keeperBobAfterBattleText:
	text "If you don't have"
	line "a BICYCLE, you're"

	para "not allowed to use"
	line "the shortcut."
	done

Route18SignText:
	text "ROUTE 18"

	para "CELADON CITY -"
	line "FUCHSIA CITY"
	done

Route18_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $6, $2, 3, ROUTE_17_18_GATE
	warp_def $7, $2, 4, ROUTE_17_18_GATE

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 5, 9, BGEVENT_READ, Route18Sign

.ObjectEvents:
	db 2
	object_event SPRITE_YOUNGSTER, 12, 9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBird_keeperBoris, -1
	object_event SPRITE_YOUNGSTER, 6, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBird_keeperBob, -1
