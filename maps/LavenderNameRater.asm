const_value set 2
	const LAVENDERNAMERATER_NAME_RATER

LavenderNameRater_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

LavenderNameRater:
	faceplayer
	opentext
	special NameRater
	waitbutton
	closetext
	end

LavenderNameRaterUnusedBookshelf:
	jumpstd difficultbookshelf

LavenderNameRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 7, 4, LAVENDER_TOWN
	warp_event 3, 7, 4, LAVENDER_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 2, 3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderNameRater, -1
