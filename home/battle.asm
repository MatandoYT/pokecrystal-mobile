UserPartyAttr:: ; 3945
	push af
	ld a, [hBattleTurn]
	and a
	jr nz, .ot
	pop af
	jr BattlePartyAttr
.ot
	pop af
	jr OTPartyAttr
; 3951


OpponentPartyAttr:: ; 3951
	push af
	ld a, [hBattleTurn]
	and a
	jr z, .ot
	pop af
	jr BattlePartyAttr
.ot
	pop af
	jr OTPartyAttr
; 395d


BattlePartyAttr:: ; 395d
; Get attribute a from the active BattleMon's party struct.
	push bc
	ld c, a
	ld b, 0
	ld hl, PartyMons
	add hl, bc
	ld a, [CurBattleMon]
	call GetPartyLocation
	pop bc
	ret
; 396d


OTPartyAttr:: ; 396d
; Get attribute a from the active EnemyMon's party struct.
	push bc
	ld c, a
	ld b, 0
	ld hl, OTPartyMon1Species
	add hl, bc
	ld a, [CurOTMon]
	call GetPartyLocation
	pop bc
	ret
; 397d


ResetDamage:: ; 397d
	xor a
	ld [CurDamage], a
	ld [CurDamage + 1], a
	ret
; 3985

SetPlayerTurn:: ; 3985
	xor a
	ld [hBattleTurn], a
	ret
; 3989

SetEnemyTurn:: ; 3989
	ld a, 1
	ld [hBattleTurn], a
	ret
; 398e


UpdateOpponentInParty:: ; 398e
	ld a, [hBattleTurn]
	and a
	jr z, UpdateEnemyMonInParty
	jr UpdateBattleMonInParty
; 3995

UpdateUserInParty:: ; 3995
	ld a, [hBattleTurn]
	and a
	jr z, UpdateBattleMonInParty
	jr UpdateEnemyMonInParty
; 399c

UpdateBattleMonInParty:: ; 399c
; Update level, status, current HP

	ld a, [CurBattleMon]

UpdateBattleMon:: ; 399f
	ld hl, PartyMon1Level
	call GetPartyLocation

	ld d, h
	ld e, l
	ld hl, BattleMonLevel
	ld bc, BattleMonMaxHP - BattleMonLevel
	jp CopyBytes
; 39b0

UpdateEnemyMonInParty:: ; 39b0
; Update level, status, current HP

; No wildmons.
	ld a, [wBattleMode]
	dec a
	ret z

	ld a, [CurOTMon]
	ld hl, OTPartyMon1Level
	call GetPartyLocation

	ld d, h
	ld e, l
	ld hl, EnemyMonLevel
	ld bc, EnemyMonMaxHP - EnemyMonLevel
	jp CopyBytes
; 39c9


RefreshBattleHuds:: ; 39c9
	call UpdateBattleHuds
	ld c, 3
	call DelayFrames
	jp WaitBGMap
; 39d4

UpdateBattleHuds:: ; 39d4
	farcall UpdatePlayerHUD
	farcall UpdateEnemyHUD
	ret
; 39e1


INCLUDE "home/battle_vars.asm"


FarCopyRadioText:: ; 3a90
	inc hl
	ld a, [hROMBank]
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ld a, e
	ld l, a
	ld a, d
	ld h, a
	ld de, wRadioText
	ld bc, 2 * SCREEN_WIDTH
	call CopyBytes
	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ret
; 3ab2


MobileTextBorder:: ; 3ab2

CELL_PHONE_TOP    EQU $5e
CELL_PHONE_BOTTOM EQU $5f

	; For mobile link battles only.
	ld a, [wLinkMode]
	cp LINK_MOBILE
	ret c

	; Draw a cell phone icon at the
	; top right corner of the border.
	hlcoord 19, 12
	ld [hl], CELL_PHONE_TOP
	hlcoord 19, 13
	ld [hl], CELL_PHONE_BOTTOM
	ret
; 3ac3


BattleTextBox:: ; 3ac3
; Open a textbox and print text at hl.
	push hl
	call SpeechTextBox
	call MobileTextBorder
	call UpdateSprites
	call ApplyTilemap
	pop hl
	call PrintTextBoxText
	ret
; 3ad5


StdBattleTextBox:: ; 3ad5
; Open a textbox and print battle text at 20:hl.

GLOBAL BattleText

	ld a, [hROMBank]
	push af

	ld a, BANK(BattleText)
	rst Bankswitch

	call BattleTextBox

	pop af
	rst Bankswitch
	ret
; 3ae1

GetBattleAnimPointer:: ; 3ae1

GLOBAL BattleAnimations
GLOBAL BattleAnimCommands

	ld a, BANK(BattleAnimations)
	rst Bankswitch

	ld a, [hli]
	ld [BattleAnimAddress], a
	ld a, [hl]
	ld [BattleAnimAddress + 1], a

	ld a, BANK(BattleAnimCommands)
	rst Bankswitch

	ret
; 3af0

GetBattleAnimByte:: ; 3af0

	push hl
	push de

	ld hl, BattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]

	ld a, BANK(BattleAnimations)
	rst Bankswitch

	ld a, [de]
	ld [BattleAnimByte], a
	inc de

	ld a, BANK(BattleAnimCommands)
	rst Bankswitch

	ld [hl], d
	dec hl
	ld [hl], e

	pop de
	pop hl

	ld a, [BattleAnimByte]
	ret
; 3b0c
