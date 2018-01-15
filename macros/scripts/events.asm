; ScriptCommandTable indexes (see engine/scripting.asm)
	enum_start

	enum scall_command ; $00
scall: MACRO
	db scall_command
	dw \1 ; pointer
ENDM

	enum farscall_command ; $01
farscall: MACRO
	db farscall_command
	dba \1
ENDM

	enum ptcall_command ; $02
ptcall: MACRO
	db ptcall_command
	dw \1 ; pointer
ENDM

	enum jump_command ; $03
jump: MACRO
	db jump_command
	dw \1 ; pointer
ENDM

	enum farjump_command ; $04
farjump: MACRO
	db farjump_command
	dba \1
ENDM

	enum ptjump_command ; $05
ptjump: MACRO
	db ptjump_command
	dw \1 ; pointer
ENDM

	enum if_equal_command ; $06
if_equal: MACRO
	db if_equal_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	enum if_not_equal_command ; $07
if_not_equal: MACRO
	db if_not_equal_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	enum iffalse_command ; $08
iffalse: MACRO
	db iffalse_command
	dw \1 ; pointer
ENDM

	enum iftrue_command ; $09
iftrue: MACRO
	db iftrue_command
	dw \1 ; pointer
ENDM

	enum if_greater_than_command ; $0a
if_greater_than: MACRO
	db if_greater_than_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	enum if_less_than_command ; $0b
if_less_than: MACRO
	db if_less_than_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	enum jumpstd_command ; $0c
jumpstd: MACRO
	db jumpstd_command
	dw \1 ; predefined_script
ENDM

	enum callstd_command ; $0d
callstd: MACRO
	db callstd_command
	dw \1 ; predefined_script
ENDM

	enum callasm_command ; $0e
callasm: MACRO
	db callasm_command
	dba \1
ENDM

	enum special_command ; $0f
special: MACRO
	db special_command
	dw (\1Special - SpecialsPointers) / 3
ENDM

	enum ptcallasm_command ; $10
ptcallasm: MACRO
	db ptcallasm_command
	dw \1 ; asm
ENDM

	enum checkmapscene_command ; $11
checkmapscene: MACRO
	db checkmapscene_command
	map \1 ; map
ENDM

	enum setmapscene_command ; $12
setmapscene: MACRO
	db setmapscene_command
	map \1 ; map
	db \2 ; scene_id
ENDM

	enum checkscene_command ; $13
checkscene: MACRO
	db checkscene_command
ENDM

	enum setscene_command ; $14
setscene: MACRO
	db setscene_command
	db \1 ; scene_id
ENDM

	enum writebyte_command ; $15
writebyte: MACRO
	db writebyte_command
	db \1 ; value
ENDM

	enum addvar_command ; $16
addvar: MACRO
	db addvar_command
	db \1 ; value
ENDM

	enum random_command ; $17
random: MACRO
	db random_command
	db \1 ; input
ENDM

	enum checkver_command ; $18
checkver: MACRO
	db checkver_command
ENDM

	enum copybytetovar_command ; $19
copybytetovar: MACRO
	db copybytetovar_command
	dw \1 ; address
ENDM

	enum copyvartobyte_command ; $1a
copyvartobyte: MACRO
	db copyvartobyte_command
	dw \1 ; address
ENDM

	enum loadvar_command ; $1b
loadvar: MACRO
	db loadvar_command
	dw \1 ; address
	db \2 ; value
ENDM

	enum checkcode_command ; $1c
checkcode: MACRO
	db checkcode_command
	db \1 ; variable_id
ENDM

	enum writevarcode_command ; $1d
writevarcode: MACRO
	db writevarcode_command
	db \1 ; variable_id
ENDM

	enum writecode_command ; $1e
writecode: MACRO
	db writecode_command
	db \1 ; variable_id
	db \2 ; value
ENDM

	enum giveitem_command ; $1f
giveitem: MACRO
	db giveitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
ENDM

	enum takeitem_command ; $20
takeitem: MACRO
	db takeitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
ENDM

	enum checkitem_command ; $21
checkitem: MACRO
	db checkitem_command
	db \1 ; item
ENDM

	enum givemoney_command ; $22
givemoney: MACRO
	db givemoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	enum takemoney_command ; $23
takemoney: MACRO
	db takemoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	enum checkmoney_command ; $24
checkmoney: MACRO
	db checkmoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	enum givecoins_command ; $25
givecoins: MACRO
	db givecoins_command
	dw \1 ; coins
ENDM

	enum takecoins_command ; $26
takecoins: MACRO
	db takecoins_command
	dw \1 ; coins
ENDM

	enum checkcoins_command ; $27
checkcoins: MACRO
	db checkcoins_command
	dw \1 ; coins
ENDM

	enum addcellnum_command ; $28
addcellnum: MACRO
	db addcellnum_command
	db \1 ; person
ENDM

	enum delcellnum_command ; $29
delcellnum: MACRO
	db delcellnum_command
	db \1 ; person
ENDM

	enum checkcellnum_command ; $2a
checkcellnum: MACRO
	db checkcellnum_command
	db \1 ; person
ENDM

	enum checktime_command ; $2b
checktime: MACRO
	db checktime_command
	db \1 ; time
ENDM

checkmorn EQUS "checktime MORN"
checkday  EQUS "checktime DAY"
checknite EQUS "checktime NITE"

	enum checkpoke_command ; $2c
checkpoke: MACRO
	db checkpoke_command
	db \1 ; pkmn
ENDM

	enum givepoke_command ; $2d
givepoke: MACRO
	db givepoke_command
	db \1 ; pokemon
	db \2 ; level
	if _NARG >= 3
	db \3 ; item
	if _NARG >= 4
	db \4 ; trainer
	if \4
	dw \5 ; trainer_name_pointer
	dw \6 ; pkmn_nickname
	endc
	else
	db 0
	endc
	else
	db 0, 0
	endc
ENDM

	enum giveegg_command ; $2e
giveegg: MACRO
	db giveegg_command
	db \1 ; pkmn
	db \2 ; level
ENDM

	enum givepokeitem_command ; $2f
givepokeitem: MACRO
	db givepokeitem_command
	dw \1 ; pointer
ENDM

	enum checkpokeitem_command ; $30
checkpokeitem: MACRO
	db checkpokeitem_command
	dw \1 ; pointer
ENDM

	enum checkevent_command ; $31
checkevent: MACRO
	db checkevent_command
	dw \1 ; event_flag
ENDM

	enum clearevent_command ; $32
clearevent: MACRO
	db clearevent_command
	dw \1 ; event_flag
ENDM

	enum setevent_command ; $33
setevent: MACRO
	db setevent_command
	dw \1 ; event_flag
ENDM

	enum checkflag_command ; $34
checkflag: MACRO
	db checkflag_command
	dw \1 ; engine_flag
ENDM

	enum clearflag_command ; $35
clearflag: MACRO
	db clearflag_command
	dw \1 ; engine_flag
ENDM

	enum setflag_command ; $36
setflag: MACRO
	db setflag_command
	dw \1 ; engine_flag
ENDM

	enum wildon_command ; $37
wildon: MACRO
	db wildon_command
ENDM

	enum wildoff_command ; $38
wildoff: MACRO
	db wildoff_command
ENDM

	enum xycompare_command ; $39
xycompare: MACRO
	db xycompare_command
	dw \1 ; pointer
ENDM

	enum warpmod_command ; $3a
warpmod: MACRO
	db warpmod_command
	db \1 ; warp_id
	map \2 ; map
ENDM

	enum blackoutmod_command ; $3b
blackoutmod: MACRO
	db blackoutmod_command
	map \1 ; map
ENDM

	enum warp_command ; $3c
warp: MACRO
	db warp_command
	map \1 ; map
	db \2 ; x
	db \3 ; y
ENDM

	enum readmoney_command ; $3d
readmoney: MACRO
	db readmoney_command
	db \1 ; account
	db \2 ; memory
ENDM

	enum readcoins_command ; $3e
readcoins: MACRO
	db readcoins_command
	db \1 ; memory
ENDM

	enum vartomem_command ; $3f
vartomem: MACRO
	db vartomem_command
	db \1 ; memory
ENDM

	enum pokenamemem_command ; $40
pokenamemem: MACRO
	db pokenamemem_command
	db \1 ; pokemon
	db \2 ; memory
ENDM

	enum itemtotext_command ; $41
itemtotext: MACRO
	db itemtotext_command
	db \1 ; item
	db \2 ; memory
ENDM

	enum mapnametotext_command ; $42
mapnametotext: MACRO
	db mapnametotext_command
	db \1 ; memory
ENDM

	enum trainertotext_command ; $43
trainertotext: MACRO
	db trainertotext_command
	db \1 ; trainer_id
	db \2 ; trainer_group
	db \3 ; memory
ENDM

	enum stringtotext_command ; $44
stringtotext: MACRO
	db stringtotext_command
	dw \1 ; text_pointer
	db \2 ; memory
ENDM

	enum itemnotify_command ; $45
itemnotify: MACRO
	db itemnotify_command
ENDM

	enum pocketisfull_command ; $46
pocketisfull: MACRO
	db pocketisfull_command
ENDM

	enum opentext_command ; $47
opentext: MACRO
	db opentext_command
ENDM

	enum refreshscreen_command ; $48
refreshscreen: MACRO
	db refreshscreen_command
if _NARG == 1
	db \1 ; dummy
else
	db 0
endc
ENDM

	enum closetext_command ; $49
closetext: MACRO
	db closetext_command
ENDM

	enum loadbytec2cf_command ; $4a
loadbytec2cf: MACRO
	db loadbytec2cf_command
	db \1 ; byte
ENDM

	enum farwritetext_command ; $4b
farwritetext: MACRO
	db farwritetext_command
	dba \1
ENDM

	enum writetext_command ; $4c
writetext: MACRO
	db writetext_command
	dw \1 ; text_pointer
ENDM

	enum repeattext_command ; $4d
repeattext: MACRO
	db repeattext_command
	db \1 ; byte
	db \2 ; byte
ENDM

	enum yesorno_command ; $4e
yesorno: MACRO
	db yesorno_command
ENDM

	enum loadmenudata_command ; $4f
loadmenudata: MACRO
	db loadmenudata_command
	dw \1 ; data
ENDM

	enum closewindow_command ; $50
closewindow: MACRO
	db closewindow_command
ENDM

	enum jumptextfaceplayer_command ; $51
jumptextfaceplayer: MACRO
	db jumptextfaceplayer_command
	dw \1 ; text_pointer
ENDM

; if _CRYSTAL
	enum farjumptext_command ; $52
farjumptext: MACRO
	db farjumptext_command
	dba \1
ENDM
; endc

	enum jumptext_command ; $53
jumptext: MACRO
	db jumptext_command
	dw \1 ; text_pointer
ENDM

	enum waitbutton_command ; $54
waitbutton: MACRO
	db waitbutton_command
ENDM

	enum buttonsound_command ; $55
buttonsound: MACRO
	db buttonsound_command
ENDM

	enum pokepic_command ; $56
pokepic: MACRO
	db pokepic_command
	db \1 ; pokemon
ENDM

	enum closepokepic_command ; $57
closepokepic: MACRO
	db closepokepic_command
ENDM

	enum _2dmenu_command ; $58
_2dmenu: MACRO
	db _2dmenu_command
ENDM

	enum verticalmenu_command ; $59
verticalmenu: MACRO
	db verticalmenu_command
ENDM

	enum loadpikachudata_command ; $5a
loadpikachudata: MACRO
	db loadpikachudata_command
ENDM

	enum randomwildmon_command ; $5b
randomwildmon: MACRO
	db randomwildmon_command
ENDM

	enum loadmemtrainer_command ; $5c
loadmemtrainer: MACRO
	db loadmemtrainer_command
ENDM

	enum loadwildmon_command ; $5d
loadwildmon: MACRO
	db loadwildmon_command
	db \1 ; pokemon
	db \2 ; level
ENDM

	enum loadtrainer_command ; $5e
loadtrainer: MACRO
	db loadtrainer_command
	db \1 ; trainer_group
	db \2 ; trainer_id
ENDM

	enum startbattle_command ; $5f
startbattle: MACRO
	db startbattle_command
ENDM

	enum reloadmapafterbattle_command ; $60
reloadmapafterbattle: MACRO
	db reloadmapafterbattle_command
ENDM

	enum catchtutorial_command ; $61
catchtutorial: MACRO
	db catchtutorial_command
	db \1 ; byte
ENDM

	enum trainertext_command ; $62
trainertext: MACRO
	db trainertext_command
	db \1 ; which_text
ENDM

	enum trainerflagaction_command ; $63
trainerflagaction: MACRO
	db trainerflagaction_command
	db \1 ; action
ENDM

	enum winlosstext_command ; $64
winlosstext: MACRO
	db winlosstext_command
	dw \1 ; win_text_pointer
	dw \2 ; loss_text_pointer
ENDM

	enum scripttalkafter_command ; $65
scripttalkafter: MACRO
	db scripttalkafter_command
ENDM

	enum end_if_just_battled_command ; $66
end_if_just_battled: MACRO
	db end_if_just_battled_command
ENDM

	enum check_just_battled_command ; $67
check_just_battled: MACRO
	db check_just_battled_command
ENDM

	enum setlasttalked_command ; $68
setlasttalked: MACRO
	db setlasttalked_command
	db \1 ; object id
ENDM

	enum applymovement_command ; $69
applymovement: MACRO
	db applymovement_command
	db \1 ; object id
	dw \2 ; data
ENDM

	enum applymovement2_command ; $6a
applymovement2: MACRO
	db applymovement2_command
	dw \1 ; data
ENDM

	enum faceplayer_command ; $6b
faceplayer: MACRO
	db faceplayer_command
ENDM

	enum faceobject_command ; $6c
faceobject: MACRO
	db faceobject_command
	db \1 ; object1
	db \2 ; object2
ENDM

	enum variablesprite_command ; $6d
variablesprite: MACRO
	db variablesprite_command
	db \1 - SPRITE_VARS ; byte
	db \2 ; sprite
ENDM

	enum disappear_command ; $6e
disappear: MACRO
	db disappear_command
	db \1 ; object id
ENDM

	enum appear_command ; $6f
appear: MACRO
	db appear_command
	db \1 ; object id
ENDM

	enum follow_command ; $70
follow: MACRO
	db follow_command
	db \1 ; object2
	db \2 ; object1
ENDM

	enum stopfollow_command ; $71
stopfollow: MACRO
	db stopfollow_command
ENDM

	enum moveobject_command ; $72
moveobject: MACRO
	db moveobject_command
	db \1 ; object id
	db \2 ; x
	db \3 ; y
ENDM

	enum writeobjectxy_command ; $73
writeobjectxy: MACRO
	db writeobjectxy_command
	db \1 ; object id
ENDM

	enum loademote_command ; $74
loademote: MACRO
	db loademote_command
	db \1 ; bubble
ENDM

	enum showemote_command ; $75
showemote: MACRO
	db showemote_command
	db \1 ; bubble
	db \2 ; object id
	db \3 ; time
ENDM

	enum spriteface_command ; $76
spriteface: MACRO
	db spriteface_command
	db \1 ; object id
	db \2 ; facing
ENDM

	enum follownotexact_command ; $77
follownotexact: MACRO
	db follownotexact_command
	db \1 ; object2
	db \2 ; object1
ENDM

	enum earthquake_command ; $78
earthquake: MACRO
	db earthquake_command
	db \1 ; param
ENDM

	enum changemap_command ; $79
changemap: MACRO
	db changemap_command
	db \1 ; map_bank
	dw \2 ; map_data_pointer
ENDM

	enum changeblock_command ; $7a
changeblock: MACRO
	db changeblock_command
	db \1 ; x
	db \2 ; y
	db \3 ; block
ENDM

	enum reloadmap_command ; $7b
reloadmap: MACRO
	db reloadmap_command
ENDM

	enum reloadmappart_command ; $7c
reloadmappart: MACRO
	db reloadmappart_command
ENDM

	enum writecmdqueue_command ; $7d
writecmdqueue: MACRO
	db writecmdqueue_command
	dw \1 ; queue_pointer
ENDM

	enum delcmdqueue_command ; $7e
delcmdqueue: MACRO
	db delcmdqueue_command
	db \1 ; byte
ENDM

	enum playmusic_command ; $7f
playmusic: MACRO
	db playmusic_command
	dw \1 ; music_pointer
ENDM

	enum encountermusic_command ; $80
encountermusic: MACRO
	db encountermusic_command
ENDM

	enum musicfadeout_command ; $81
musicfadeout: MACRO
	db musicfadeout_command
	dw \1 ; music
	db \2 ; fadetime
ENDM

	enum playmapmusic_command ; $82
playmapmusic: MACRO
	db playmapmusic_command
ENDM

	enum dontrestartmapmusic_command ; $83
dontrestartmapmusic: MACRO
	db dontrestartmapmusic_command
ENDM

	enum cry_command ; $84
cry: MACRO
	db cry_command
	dw \1 ; cry_id
ENDM

	enum playsound_command ; $85
playsound: MACRO
	db playsound_command
	dw \1 ; sound_pointer
ENDM

	enum waitsfx_command ; $86
waitsfx: MACRO
	db waitsfx_command
ENDM

	enum warpsound_command ; $87
warpsound: MACRO
	db warpsound_command
ENDM

	enum specialsound_command ; $88
specialsound: MACRO
	db specialsound_command
ENDM

	enum passtoengine_command ; $89
passtoengine: MACRO
	db passtoengine_command
	db \1 ; data_pointer
ENDM

	enum newloadmap_command ; $8a
newloadmap: MACRO
	db newloadmap_command
	db \1 ; which_method
ENDM

	enum pause_command ; $8b
pause: MACRO
	db pause_command
	db \1 ; length
ENDM

	enum deactivatefacing_command ; $8c
deactivatefacing: MACRO
	db deactivatefacing_command
	db \1 ; time
ENDM

	enum priorityjump_command ; $8d
priorityjump: MACRO
	db priorityjump_command
	dw \1 ; pointer
ENDM

	enum warpcheck_command ; $8e
warpcheck: MACRO
	db warpcheck_command
ENDM

	enum ptpriorityjump_command ; $8f
ptpriorityjump: MACRO
	db ptpriorityjump_command
	dw \1 ; pointer
ENDM

	enum return_command ; $90
return: MACRO
	db return_command
ENDM

	enum end_command ; $91
end: MACRO
	db end_command
ENDM

	enum reloadandreturn_command ; $92
reloadandreturn: MACRO
	db reloadandreturn_command
	db \1 ; which_method
ENDM

	enum end_all_command ; $93
end_all: MACRO
	db end_all_command
ENDM

	enum pokemart_command ; $94
pokemart: MACRO
	db pokemart_command
	db \1 ; dialog_id
	dw \2 ; mart_id
ENDM

	enum elevator_command ; $95
elevator: MACRO
	db elevator_command
	dw \1 ; floor_list_pointer
ENDM

	enum trade_command ; $96
trade: MACRO
	db trade_command
	db \1 ; trade_id
ENDM

	enum askforphonenumber_command ; $97
askforphonenumber: MACRO
	db askforphonenumber_command
	db \1 ; number
ENDM

	enum phonecall_command ; $98
phonecall: MACRO
	db phonecall_command
	dw \1 ; caller_name
ENDM

	enum hangup_command ; $99
hangup: MACRO
	db hangup_command
ENDM

	enum describedecoration_command ; $9a
describedecoration: MACRO
	db describedecoration_command
	db \1 ; byte
ENDM

	enum fruittree_command ; $9b
fruittree: MACRO
	db fruittree_command
	db \1 ; tree_id
ENDM

	enum specialphonecall_command ; $9c
specialphonecall: MACRO
	db specialphonecall_command
	dw \1 ; call_id
ENDM

	enum checkphonecall_command ; $9d
checkphonecall: MACRO
	db checkphonecall_command
ENDM

	enum verbosegiveitem_command ; $9e
verbosegiveitem: MACRO
	db verbosegiveitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
ENDM

	enum verbosegiveitem2_command ; $9f
verbosegiveitem2: MACRO
	db verbosegiveitem2_command
	db \1 ; item
	db \2 ; var
ENDM

	enum swarm_command ; $a0
swarm: MACRO
	db swarm_command
	db \1 ; flag
	map \2 ; map
ENDM

	enum halloffame_command ; $a1
halloffame: MACRO
	db halloffame_command
ENDM

	enum credits_command ; $a2
credits: MACRO
	db credits_command
ENDM

	enum warpfacing_command ; $a3
warpfacing: MACRO
	db warpfacing_command
	db \1 ; facing
	map \2 ; map
	db \3 ; x
	db \4 ; y
ENDM

	enum battletowertext_command ; $a4
battletowertext: MACRO
	db battletowertext_command
	db \1 ; memory
ENDM

	enum landmarktotext_command ; $a5
landmarktotext: MACRO
	db landmarktotext_command
	db \1 ; id
	db \2 ; memory
ENDM

	enum trainerclassname_command ; $a6
trainerclassname: MACRO
	db trainerclassname_command
	db \1 ; id
	db \2 ; memory
ENDM

	enum name_command ; $a7
name: MACRO
	db name_command
	db \1 ; type
	db \2 ; id
	db \3 ; memory
ENDM

	enum wait_command ; $a8
wait: MACRO
	db wait_command
	db \1 ; duration
ENDM

	enum check_save_command ; $a9
check_save: MACRO
	db check_save_command
ENDM
