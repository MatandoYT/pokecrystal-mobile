const_value set 2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2

FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Unused_0x75ea6:
	end

Captain:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .LaterTrip
	writetext SSAquaCaptainExhaustingText
	waitbutton
	closetext
	end

.LaterTrip:
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end

Granddaughter2:
	spriteface FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	opentext
	writetext GranddaughterCaptainPlayWithMeText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext GranddaughterHasToFindGrandpaText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, MovementData_0x76004
	moveobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, $3, $13
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	spriteface PLAYER, UP
	spriteface FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	special Special_FadeInQuickly
	spriteface FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, MovementData_0x7600c
	spriteface FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	opentext
	writetext GranddaughterWasPlayingMText
	waitbutton
	closetext
	jump .cont

.PlayerIsFemale:
	opentext
	writetext GranddaughterWasPlayingFText
	waitbutton
	closetext
.cont:
	spriteface FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, MovementData_0x76010
	opentext
	writetext SSAquaEntertainedGranddaughterText
	buttonsound
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene FAST_SHIP_1F, $0
	jump SSAquaMetalCoatAndDocking

Grandpa:
	faceplayer
	opentext
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue SSAquaGotMetalCoat
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftrue SSAquaFoundGranddaughter
	writetext SSAquaCantFindGranddaughterText
	waitbutton
	closetext
	setmapscene FAST_SHIP_1F, $0
	end

SSAquaMetalCoatAndDocking:
	writetext GrandpaHaveThisText
	buttonsound
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext SSAquaHasArrivedVermilionText
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	closetext
	end

SSAquaFoundGranddaughter:
	writetext GrandpaHaveThisText
	buttonsound
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	end

SSAquaGotMetalCoat:
	writetext GrandpaTravellingText
	waitbutton
	closetext
	end

Granddaughter1:
	faceplayer
	opentext
	writetext GranddaughterHadFunText
	waitbutton
	closetext
	end

TrainerPokefanmColin:
	trainer EVENT_BEAT_POKEFANM_COLIN, POKEFANM, COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PokefanmColinAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer EVENT_BEAT_TWINS_MEG_AND_PEG, TWINS, MEGANDPEG1, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext TwinsMegandpeg1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer EVENT_BEAT_TWINS_MEG_AND_PEG, TWINS, MEGANDPEG2, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext TwinsMegandpeg2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer EVENT_BEAT_PSYCHIC_RODNEY, PSYCHIC_T, RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PsychicRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer EVENT_BEAT_POKEFANM_JEREMY, POKEFANM, JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PokefanmJeremyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer EVENT_BEAT_POKEFANF_GEORGIA, POKEFANF, GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PokefanfGeorgiaAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer EVENT_BEAT_SUPER_NERD_SHAWN, SUPER_NERD, SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SupernerdShawnAfterBattleText
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd trashcan

MovementData_0x76004:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_0x7600c:
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x76010:
	step DOWN
	step_end

SSAquaCaptainExhaustingText:
	text "Whew! Thanks for"
	line "coming along."

	para "Keeping that lit-"
	line "tle girl amused"
	cont "was exhausting."
	done

SSAquaCaptainHowDoYouLikeText:
	text "How do you like"
	line "S.S.AQUA's ride?"

	para "She practically"
	line "skates across the"
	cont "waves."
	done

SSAquaCantFindGranddaughterText:
	text "Oh, hello…"

	para "I still can't find"
	line "my granddaughter."

	para "If she's on the"
	line "ship, that's OK."

	para "She's an energetic"
	line "child, so she may"

	para "be bugging some-"
	line "one. I'm worried…"
	done

SSAquaEntertainedGranddaughterText:
	text "<PLAY_G>, was it?"
	line "I heard you enter-"
	cont "tained my grand-"
	cont "daughter."

	para "I want to thank"
	line "you for that."
	done

GrandpaHaveThisText:
	text "I know! I'd like"
	line "you to have this!"
	done

GrandpaTravellingText:
	text "We're traveling"
	line "around the world."
	done

GranddaughterCaptainPlayWithMeText:
	text "CAPTAIN, play with"
	line "me, please?"

	para "I'm bored! I want"
	line "to play more!"
	done

GranddaughterHasToFindGrandpaText:
	text "Hi! Will you play"
	line "with me?"

	para "…Oh!"

	para "Grandpa's worried"
	line "about me?"

	para "I have to go!"

	para "I have to go find"
	line "Grandpa!"
	done

GranddaughterWasPlayingMText:
	text "Grandpa, here I"
	line "am! I was playing"

	para "with the CAPTAIN"
	line "and this guy!"
	done

GranddaughterWasPlayingFText:
	text "Grandpa, here I"
	line "am! I was playing"

	para "with the CAPTAIN"
	line "and this big girl!"
	done

GranddaughterHadFunText:
	text "I had lots of fun"
	line "playing!"
	done

PokefanmColinSeenText:
	text "Hey, kid! Want to"
	line "battle with me?"
	done

PokefanmColinBeatenText:
	text "You're strong!"
	done

PokefanmColinAfterBattleText:
	text "You're traveling"
	line "all alone?"

	para "Isn't your mom"
	line "worried?"
	done

TwinsMegandpeg1SeenText:
	text "You think I'm a"
	line "baby?"
	cont "That's not fair!"
	done

TwinsMegandpeg1BeatenText:
	text "Oh! We lost!"
	done

TwinsMegandpeg1AfterBattleText:
	text "Baby is a rude"
	line "name to call us"
	cont "girls!"
	done

TwinsMegandpeg2SeenText:
	text "I'm not a baby!"

	para "That's not nice to"
	line "say to a lady!"
	done

TwinsMegandpeg2BeatenText:
	text "Oh! We lost!"
	done

TwinsMegandpeg2AfterBattleText:
	text "Sometimes, kids"
	line "are smarter than"
	cont "grown-ups!"
	done

PsychicRodneySeenText:
	text "Ssh! My brain is"
	line "picking up radio"
	cont "signals!"
	done

PsychicRodneyBeatenText:
	text "…I hear some-"
	line "thing!"
	done

PsychicRodneyAfterBattleText:
	text "I get it. You can"
	line "hear JOHTO's radio"
	cont "on the FAST SHIP."
	done

PokefanmJeremySeenText:
	text "What do you think?"
	line "My #MON are"
	cont "beautiful, yes?"
	done

PokefanmJeremyBeatenText:
	text "Oh, no! My beauti-"
	line "ful #MON!"
	done

PokefanmJeremyAfterBattleText:
	text "I must go to the"
	line "#MON SALON and"
	cont "fix them up nice!"
	done

PokefanfGeorgiaSeenText:
	text "I'm going to shop"
	line "at the DEPT.STORE"
	cont "and then…"
	done

PokefanfGeorgiaBeatenText:
	text "What was I going"
	line "to do?"
	done

PokefanfGeorgiaAfterBattleText:
	text "Oh, yes! I have to"
	line "get my #MON out"
	cont "of DAY-CARE!"
	done

SupernerdShawnSeenText:
	text "What kinds of #"
	line "BALLS do you have"
	cont "with you?"
	done

SupernerdShawnBeatenText:
	text "Wait! Stop! Don't!"
	line "Please!"
	done

SupernerdShawnAfterBattleText:
	text "You should use the"
	line "right BALLS to fit"
	cont "the situation."
	done

SSAquaHasArrivedVermilionText:
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "VERMILION CITY."
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def $7, $2, 8, FAST_SHIP_1F
	warp_def $7, $3, 8, FAST_SHIP_1F
	warp_def $13, $2, 9, FAST_SHIP_1F
	warp_def $13, $3, 9, FAST_SHIP_1F
	warp_def $21, $2, 10, FAST_SHIP_1F
	warp_def $21, $3, 10, FAST_SHIP_1F

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 25, 4, BGEVENT_READ, FastShipCaptainsCabinTrashcan

.ObjectEvents:
	db 11
	object_event SPRITE_CAPTAIN, 25, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Captain, -1
	object_event SPRITE_GENTLEMAN, 17, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Grandpa, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	object_event SPRITE_TWIN, 17, 3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Granddaughter1, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	object_event SPRITE_TWIN, 25, 2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Granddaughter2, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	object_event SPRITE_POKEFAN_M, 6, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event SPRITE_TWIN, 4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event SPRITE_TWIN, 4, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event SPRITE_SUPER_NERD, 5, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event SPRITE_POKEFAN_F, 5, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event SPRITE_SUPER_NERD, 15, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
