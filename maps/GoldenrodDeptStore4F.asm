	const_def 2 ; object constants
	const GOLDENRODDEPTSTORE4F_CLERK
	const GOLDENRODDEPTSTORE4F_COOLTRAINER_M
	const GOLDENRODDEPTSTORE4F_BUG_CATCHER
	const GOLDENRODDEPTSTORE4F_GAMEBOY_KID

GoldenrodDeptStore4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ClerkScript_0x55ee9:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_4F
	closetext
	end

GoldenrodDeptStore4FCooltrainerMScript:
	jumptextfaceplayer GoldenrodDeptStore4FCooltrainerMText

GoldenrodDeptStore4FBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStore4FBugCatcherText

GameboyKidScript_0x55ef7:
	faceplayer
	opentext
	writetext UnknownText_0x55f74
	waitbutton
	closetext
	spriteface GOLDENRODDEPTSTORE4F_GAMEBOY_KID, DOWN
	end

GoldenrodDeptStore4FDirectory:
	jumptext GoldenrodDeptStore4FDirectoryText

GoldenrodDeptStore4FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore4FCooltrainerMText:
	text "Hey. I love strong"
	line "#MON."

	para "I feed them PRO-"
	line "TEIN to crank up"
	cont "their ATTACK."
	done

GoldenrodDeptStore4FBugCatcherText:
	text "IRON adds to your"
	line "#MON's DEFENSE."
	done

UnknownText_0x55f74:
	text "Some #MON"
	line "evolve only by"

	para "being traded via a"
	line "Game Link cable."

	para "I know of four:"
	line "MACHOKE, KADABRA,"

	para "HAUNTER and, um,"
	line "GRAVELER."

	para "I heard there are"
	line "others too."
	done

GoldenrodDeptStore4FDirectoryText:
	text "Let Us Pump Up"
	line "Your #MON!"

	para "4F MEDICINE BOX"
	done

GoldenrodDeptStore4F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12, 0, 1, GOLDENROD_DEPT_STORE_5F
	warp_event 15, 0, 2, GOLDENROD_DEPT_STORE_3F
	warp_event 2, 0, 1, GOLDENROD_DEPT_STORE_ELEVATOR

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14, 0, BGEVENT_READ, GoldenrodDeptStore4FDirectory
	bg_event 3, 0, BGEVENT_READ, GoldenrodDeptStore4FElevatorButton

	db 4 ; object events
	object_event 13, 5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ClerkScript_0x55ee9, -1
	object_event 11, 7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore4FCooltrainerMScript, -1
	object_event 7, 2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore4FBugCatcherScript, -1
	object_event 5, 1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GameboyKidScript_0x55ef7, -1
