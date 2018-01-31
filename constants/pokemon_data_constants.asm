; base data struct members (see data/pokemon/base_stats/*.asm)
BASE_DEX_NO      EQUS "(BaseDexNo - CurBaseData)"
BASE_STATS       EQUS "(BaseStats - CurBaseData)"
BASE_HP          EQUS "(BaseHP - CurBaseData)"
BASE_ATK         EQUS "(BaseAttack - CurBaseData)"
BASE_SPD         EQUS "(BaseSpeed - CurBaseData)"
BASE_SAT         EQUS "(BaseSpecialAttack - CurBaseData)"
BASE_SDF         EQUS "(BaseSpecialDefense - CurBaseData)"
BASE_TYPES       EQUS "(BaseType - CurBaseData)"
BASE_TYPE_1      EQUS "(BaseType1 - CurBaseData)"
BASE_TYPE_2      EQUS "(BaseType2 - CurBaseData)"
BASE_CATCH_RATE  EQUS "(BaseCatchRate - CurBaseData)"
BASE_EXP         EQUS "(BaseExp - CurBaseData)"
BASE_ITEMS       EQUS "(BaseItems - CurBaseData)"
BASE_ITEM_1      EQUS "(BaseItem1 - CurBaseData)"
BASE_ITEM_2      EQUS "(BaseItem2 - CurBaseData)"
BASE_GENDER      EQUS "(BaseGender - CurBaseData)"
BASE_UNKNOWN_1   EQUS "(BaseUnknown1 - CurBaseData)"
BASE_EGG_STEPS   EQUS "(BaseEggSteps - CurBaseData)"
BASE_UNKNOWN_2   EQUS "(BaseUnknown2 - CurBaseData)"
BASE_PIC_SIZE    EQUS "(BasePicSize - CurBaseData)"
BASE_PADDING     EQUS "(BasePadding - CurBaseData)"
BASE_GROWTH_RATE EQUS "(BaseGrowthRate - CurBaseData)"
BASE_EGG_GROUPS  EQUS "(BaseEggGroups - CurBaseData)"
BASE_TMHM        EQUS "(BaseTMHM - CurBaseData)"
BASE_DATA_SIZE   EQUS "(CurBaseDataEnd - CurBaseData)"

; gender ratio constants
GENDER_F0    EQU 0 percent
GENDER_F12_5 EQU 12 percent + 1
GENDER_F25   EQU 25 percent
GENDER_F50   EQU 50 percent
GENDER_F75   EQU 75 percent
GENDER_F100  EQU 100 percent - 1
GENDERLESS   EQU -1

; BaseGrowthRate values
; GrowthRates indexes (see data/growth_rates.asm)
	const_def
	const GROWTH_MEDIUM_FAST
	const GROWTH_SLIGHTLY_FAST
	const GROWTH_SLIGHTLY_SLOW
	const GROWTH_MEDIUM_SLOW
	const GROWTH_FAST
	const GROWTH_SLOW

; BaseEggGroups values
	const_def 1
	const EGG_MONSTER      ; 1
	const EGG_WATER_1      ; 2
	const EGG_BUG          ; 3
	const EGG_FLYING       ; 4
	const EGG_FIELD        ; 5
	const EGG_FAIRY        ; 6
	const EGG_GRASS        ; 7
	const EGG_HUMANLIKE    ; 8
	const EGG_WATER_3      ; 9
	const EGG_MINERAL      ; a
	const EGG_AMORPHOUS    ; b
	const EGG_WATER_2      ; c
	const EGG_DITTO        ; d
	const EGG_DRAGON       ; e
	const EGG_UNDISCOVERED ; f


; pokedex entries (see data/pokemon/dex_entries.asm)
NUM_DEX_ENTRY_BANKS EQU 4


; party_struct members (see macros/wram.asm)
MON_SPECIES            EQUS "(PartyMon1Species - PartyMon1)"
MON_ITEM               EQUS "(PartyMon1Item - PartyMon1)"
MON_MOVES              EQUS "(PartyMon1Moves - PartyMon1)"
MON_ID                 EQUS "(PartyMon1ID - PartyMon1)"
MON_EXP                EQUS "(PartyMon1Exp - PartyMon1)"
MON_STAT_EXP           EQUS "(PartyMon1StatExp - PartyMon1)"
MON_HP_EXP             EQUS "(PartyMon1HPExp - PartyMon1)"
MON_ATK_EXP            EQUS "(PartyMon1AtkExp - PartyMon1)"
MON_DEF_EXP            EQUS "(PartyMon1DefExp - PartyMon1)"
MON_SPD_EXP            EQUS "(PartyMon1SpdExp - PartyMon1)"
MON_SPC_EXP            EQUS "(PartyMon1SpcExp - PartyMon1)"
MON_DVS                EQUS "(PartyMon1DVs - PartyMon1)"
MON_PP                 EQUS "(PartyMon1PP - PartyMon1)"
MON_HAPPINESS          EQUS "(PartyMon1Happiness - PartyMon1)"
MON_PKRUS              EQUS "(PartyMon1PokerusStatus - PartyMon1)"
MON_CAUGHTDATA         EQUS "(PartyMon1CaughtData - PartyMon1)"
MON_CAUGHTLEVEL        EQUS "(PartyMon1CaughtLevel - PartyMon1)"
MON_CAUGHTTIME         EQUS "(PartyMon1CaughtTime - PartyMon1)"
MON_CAUGHTGENDER       EQUS "(PartyMon1CaughtGender - PartyMon1)"
MON_CAUGHTLOCATION     EQUS "(PartyMon1CaughtLocation - PartyMon1)"
MON_LEVEL              EQUS "(PartyMon1Level - PartyMon1)"
MON_STATUS             EQUS "(PartyMon1Status - PartyMon1)"
MON_HP                 EQUS "(PartyMon1HP - PartyMon1)"
MON_MAXHP              EQUS "(PartyMon1MaxHP - PartyMon1)"
MON_ATK                EQUS "(PartyMon1Attack - PartyMon1)"
MON_DEF                EQUS "(PartyMon1Defense - PartyMon1)"
MON_SPD                EQUS "(PartyMon1Speed - PartyMon1)"
MON_SAT                EQUS "(PartyMon1SpclAtk - PartyMon1)"
MON_SDF                EQUS "(PartyMon1SpclDef - PartyMon1)"
BOXMON_STRUCT_LENGTH   EQUS "(PartyMon1End - PartyMon1)"
PARTYMON_STRUCT_LENGTH EQUS "(PartyMon1StatsEnd - PartyMon1)"
REDMON_STRUCT_LENGTH EQU 44


; caught data

CAUGHT_TIME_MASK  EQU %11000000
CAUGHT_LEVEL_MASK EQU %00111111

CAUGHT_GENDER_MASK   EQU %10000000
CAUGHT_LOCATION_MASK EQU %01111111

CAUGHT_BY_UNKNOWN EQU 0
CAUGHT_BY_GIRL    EQU 1
CAUGHT_BY_BOY     EQU 2

CAUGHT_EGG_LEVEL EQU 1


; maximum number of party pokemon
PARTY_LENGTH EQU 6

; boxes
MONS_PER_BOX EQU 20
NUM_BOXES    EQU 14

; hall of fame
HOF_MON_LENGTH = 1 + 2 + 2 + 1 + (MON_NAME_LENGTH +- 1) ; species, id, dvs, level, nick
HOF_LENGTH = 1 + HOF_MON_LENGTH * PARTY_LENGTH + 1 ; win count, party, terminator
NUM_HOF_TEAMS = 30


; evolution types (used in data/pokemon/evos_attacks.asm)
	const_def 1
	const EVOLVE_LEVEL
	const EVOLVE_ITEM
	const EVOLVE_TRADE
	const EVOLVE_HAPPINESS
	const EVOLVE_STAT

; EVOLVE_HAPPINESS triggers
	const_def 1
	const TR_ANYTIME
	const TR_MORNDAY
	const TR_NITE

; EVOLVE_STAT triggers
	const_def 1
	const ATK_GT_DEF
	const ATK_LT_DEF
	const ATK_EQ_DEF


; wild data

NUM_GRASSMON EQU 7 ; data/wild/*_grass.asm table size
NUM_WATERMON EQU 3 ; data/wild/*_water.asm table size

GRASS_WILDDATA_LENGTH EQU (NUM_GRASSMON * 2 + 1) * 3 + 2
WATER_WILDDATA_LENGTH EQU (NUM_WATERMON * 2 + 1) * 1 + 2

NUM_ROAMMON_MAPS EQU 16 ; RoamMaps table size (see data/wild/roammon_maps.asm)


; treemon sets
; TreeMons indexes (see data/wild/treemons.asm)
	const_def
	const TREEMON_SET_CITY
	const TREEMON_SET_CANYON
	const TREEMON_SET_TOWN
	const TREEMON_SET_ROUTE
	const TREEMON_SET_KANTO
	const TREEMON_SET_LAKE
	const TREEMON_SET_FOREST
	const TREEMON_SET_ROCK
NUM_TREEMON_SETS EQU const_value

; treemon scores
	const_def
	const TREEMON_SCORE_BAD  ; 0
	const TREEMON_SCORE_GOOD ; 1
	const TREEMON_SCORE_RARE ; 2


; ChangeHappiness arguments (see data/happiness_changes.asm)
const_value = 1
	const HAPPINESS_GAINLEVEL         ; 01
	const HAPPINESS_USEDITEM          ; 02
	const HAPPINESS_USEDXITEM         ; 03
	const HAPPINESS_GYMBATTLE         ; 04
	const HAPPINESS_LEARNMOVE         ; 05
	const HAPPINESS_FAINTED           ; 06
	const HAPPINESS_POISONFAINT       ; 07
	const HAPPINESS_BEATENBYSTRONGFOE ; 08
	const HAPPINESS_YOUNGCUT1         ; 09
	const HAPPINESS_YOUNGCUT2         ; 0a
	const HAPPINESS_YOUNGCUT3         ; 0b
	const HAPPINESS_OLDERCUT1         ; 0c
	const HAPPINESS_OLDERCUT2         ; 0d
	const HAPPINESS_OLDERCUT3         ; 0e
	const HAPPINESS_BITTERPOWDER      ; 0f
	const HAPPINESS_ENERGYROOT        ; 10
	const HAPPINESS_REVIVALHERB       ; 11
	const HAPPINESS_GROOMING          ; 12
	const HAPPINESS_GAINLEVELATHOME   ; 13

; significant happiness values
BASE_HAPPINESS        EQU 70
FRIEND_BALL_HAPPINESS EQU 200
HAPPINESS_TO_EVOLVE   EQU 220
HAPPINESS_THRESHOLD_1 EQU 100
HAPPINESS_THRESHOLD_2 EQU 200


; PP
PP_UP_MASK EQU %11000000
PP_UP_ONE  EQU %01000000
PP_MASK    EQU %00111111
