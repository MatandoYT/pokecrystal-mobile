	const_def 2 ; object constants
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2

Route18_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperBoris:
	trainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, BirdKeeperBorisSeenText, BirdKeeperBorisBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BirdKeeperBorisAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBob:
	trainer BIRD_KEEPER, BOB, EVENT_BEAT_BIRD_KEEPER_BOB, BirdKeeperBobSeenText, BirdKeeperBobBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BirdKeeperBobAfterBattleText
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

BirdKeeperBorisSeenText:
	text "If you're looking"
	line "for #MON, you"

	para "have to look in"
	line "the tall grass."
	done

BirdKeeperBorisBeatenText:
	text "Ayieee!"
	done

BirdKeeperBorisAfterBattleText:
	text "Since you're so"
	line "strong, it must be"
	cont "fun to battle."
	done

BirdKeeperBobSeenText:
	text "CYCLING ROAD is a"
	line "quick shortcut to"
	cont "CELADON."
	done

BirdKeeperBobBeatenText:
	text "…Whew!"
	done

BirdKeeperBobAfterBattleText:
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

Route18_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 6, 3, ROUTE_17_ROUTE_18_GATE
	warp_event 2, 7, 4, ROUTE_17_ROUTE_18_GATE

	db 0 ; coord events

	db 1 ; bg events
	bg_event 9, 5, BGEVENT_READ, Route18Sign

	db 2 ; object events
	object_event 9, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBoris, -1
	object_event 13, 6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBob, -1
