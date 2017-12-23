const_value set 2
	const CERULEANTRADESPEECHHOUSE_GRANNY
	const CERULEANTRADESPEECHHOUSE_GRAMPS
	const CERULEANTRADESPEECHHOUSE_RHYDON
	const CERULEANTRADESPEECHHOUSE_ZUBAT

CeruleanTradeSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

CeruleanTradeSpeechHouseGrannyScript:
	jumptextfaceplayer CeruleanTradeSpeechHouseGrannyText

CeruleanTradeSpeechHouseGrampsScript:
	jumptextfaceplayer CeruleanTradeSpeechHouseGrampsText

RhydonScript_0x188139:
	opentext
	writetext UnknownText_0x18819c
	cry KANGASKHAN
	waitbutton
	closetext
	end

ZubatScript_0x188143:
	opentext
	writetext UnknownText_0x1881b5
	cry ZUBAT
	waitbutton
	closetext
	end

CeruleanTradeSpeechHouseGrannyText:
	text "My husband lives"
	line "happily with #-"
	cont "MON he got through"
	cont "trades."
	done

CeruleanTradeSpeechHouseGrampsText:
	text "Ah… I'm so happy…"
	done

UnknownText_0x18819c:
	text "KANGASKHAN: Garu"
	line "garuu."
	done

UnknownText_0x1881b5:
	text "ZUBAT: Zuba zubaa."
	done

CeruleanTradeSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, CERULEAN_CITY
	warp_def $7, $3, 3, CERULEAN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_GRANNY, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseGrannyScript, -1
	person_event SPRITE_GRAMPS, 2, 1, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseGrampsScript, -1
	person_event SPRITE_RHYDON, 2, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, RhydonScript_0x188139, -1
	person_event SPRITE_ZUBAT, 6, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ZubatScript_0x188143, -1
