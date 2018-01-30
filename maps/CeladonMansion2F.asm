CeladonMansion2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansion2FComputer:
	jumptext CeladonMansion2FComputerText

CeladonMansion2FSign:
	jumptext CeladonMansion2FSignText

CeladonMansion2FBookshelf:
	jumpstd difficultbookshelf

CeladonMansion2FComputerText:
	text "<PLAYER> turned on"
	line "the PC."

	para "…"

	para "Someone was in the"
	line "middle of compos-"
	cont "ing an e-mail."

	para "…I hope you'll"
	line "come visit KANTO."

	para "I think you'll be"
	line "surprised at how"

	para "much things have"
	line "changed here."

	para "You'll also see"
	line "many #MON that"

	para "aren't native to"
	line "JOHTO."

	para "To the PRODUCER"

	para "…"
	done

CeladonMansion2FSignText:
	text "GAME FREAK"
	line "MEETING ROOM"
	done

CeladonMansion2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 0, 0, 4, CELADON_MANSION_1F
	warp_event 1, 0, 2, CELADON_MANSION_3F
	warp_event 6, 0, 3, CELADON_MANSION_3F
	warp_event 7, 0, 5, CELADON_MANSION_1F

	db 0 ; coord events

	db 3 ; bg events
	bg_event 0, 3, BGEVENT_READ, CeladonMansion2FComputer
	bg_event 5, 8, BGEVENT_UP, CeladonMansion2FSign
	bg_event 2, 3, BGEVENT_READ, CeladonMansion2FBookshelf

	db 0 ; object events
