BattleTowerMobileError: ; all of this moved from mobile_5f
	call FadeToMenu
	xor a
	ld [wc303], a
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a

	call DisplayMobileError

	pop af
	ldh [rSVBK], a
	call ExitAllMenus
	ret

DisplayMobileError:
.loop
	call JoyTextDelay
	call .RunJumptable
	ld a, [wc303]
	bit 7, a
	jr nz, .quit
	farcall HDMATransferAttrMapAndTileMapToWRAMBank3
	jr .loop

.quit
	call .deinit
	ret

.deinit
	ld a, [wMobileErrorCodeBuffer]
	cp $22
	jr z, .asm_17f597
	cp $31
	jr z, .asm_17f58a
	cp $33
	ret nz
	ld a, [wMobileErrorCodeBuffer + 1]
	cp $1
	ret nz
	ld a, [wMobileErrorCodeBuffer + 2]
	cp $2
	ret nz
	jr .asm_17f5a1

.asm_17f58a
	ld a, [wMobileErrorCodeBuffer + 1]
	cp $3
	ret nz
	ld a, [wMobileErrorCodeBuffer + 2]
	and a
	ret nz
	jr .asm_17f5a1

.asm_17f597
	ld a, [wMobileErrorCodeBuffer + 1]
	and a
	ret nz
	ld a, [wMobileErrorCodeBuffer + 2]
	and a
	ret nz

.asm_17f5a1
	ld a, BANK(sMobileLoginPassword)
	call GetSRAMBank
	xor a
	ld [sMobileLoginPassword], a
	call CloseSRAM
	ret

.RunJumptable:
	jumptable .Jumptable, wc303

.Jumptable:
	dw Function17f5c3
	dw Function17ff23
	dw Function17f5d2

Function17f5c3:
	call Function17f5e4
	farcall FinishExitMenu
	ld a, $1
	ld [wc303], a
	ret

Function17f5d2:
	call Function17f5e4
	farcall HDMATransferAttrMapAndTileMapToWRAMBank3
	call SetPalettes
	ld a, $1
	ld [wc303], a
	ret

Function17f5e4:
	ld a, $8
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeID + 1], a
	ld a, " "
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ld a, $6
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	hlcoord 2, 1
	ld b, $1
	ld c, $e
	call Function3eea
	hlcoord 0, 4;1, 4
	ld b, $c
	ld c, $12;$10
	call Function3eea
	hlcoord 3, 2
	ld de, MobileCommunicationErrorText
	call PlaceString
	call Function17ff3c
	jr nc, .asm_17f632
	hlcoord 11, 2
	call Function17f6b7

.asm_17f632
	ld a, [wMobileErrorCodeBuffer]
	cp $d0
	jr nc, .asm_17f684
	cp $10
	jr c, .asm_17f679
	sub $10
	cp $24
	jr nc, .asm_17f679
	ld e, a
	ld d, $0
	ld hl, MobileErrorCodeTable
	add hl, de
	add hl, de
	ld a, [wMobileErrorCodeBuffer + 1]
	ld e, a
	ld a, [wMobileErrorCodeBuffer + 2]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld h, a
	ld l, c
	ld a, [hli]
	and a
	jr z, .asm_17f679
	ld c, a
.asm_17f65d
	ld a, [hli]
	ld b, a
	ld a, [hli]
	cp $ff
	jr nz, .asm_17f667
	cp b
	jr z, .asm_17f66e

.asm_17f667
	xor d
	jr nz, .asm_17f674
	ld a, b
	xor e
	jr nz, .asm_17f674

.asm_17f66e
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	jr .asm_17f67d

.asm_17f674
	inc hl
	inc hl
	dec c
	jr nz, .asm_17f65d

.asm_17f679
	ld a, $d9
	jr .asm_17f684

.asm_17f67d
	hlcoord 1, 6;2, 6
	call PlaceString
	ret

.asm_17f684
	sub $d0
	ld e, a
	ld d, 0
	ld hl, Table_17f699
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	hlcoord 1, 6;2, 6
	call PlaceString
	ret

Table_17f699:
	dw MobileErrorCode_101_000_Text
	dw MobileErrorCode_101_001_Text
	dw MobileErrorCode_101_002_Text
	dw MobileErrorCode_101_003_Text
	dw MobileErrorCode_101_004_Text
	dw MobileErrorCode_101_005_Text
	dw MobileErrorCode_101_006_Text
	dw MobileErrorCode_101_007_Text
	dw MobileErrorCode_101_008_Text
	dw MobileErrorCode_101_009_Text
	dw MobileErrorCode_101_009_Text

Palette_17f6af:
	RGB  5,  5, 16
	RGB  8, 19, 28
	RGB  0,  0,  0
	RGB 31, 31, 31

Function17f6b7:
	ld a, [wMobileErrorCodeBuffer]
	call .bcd_two_digits
	inc hl
	ld a, [wMobileErrorCodeBuffer + 2]
	and $f
	call .bcd_digit
	ld a, [wMobileErrorCodeBuffer + 1]
	call .bcd_two_digits
	ret

.bcd_two_digits
	ld c, a
	and $f0
	swap a
	call .bcd_digit
	ld a, c
	and $f

.bcd_digit
	add "0"
	ld [hli], a
	ret

MobileCommunicationErrorText:
	db "?????????????????????????????????@"

String_17f6e8:
	db   "????????????<NO>???????????????"
	next "???????????????<WO>"
	next "?????????????????????????????????"
	db   "@"

MobileErrorCodeTable:
	dw MobileErrorCodes_10
	dw MobileErrorCodes_11
	dw MobileErrorCodes_12
	dw MobileErrorCodes_13
	dw MobileErrorCodes_14
	dw MobileErrorCodes_15
	dw MobileErrorCodes_16
	dw MobileErrorCodes_17
	dw MobileErrorCodes_20
	dw MobileErrorCodes_20
	dw MobileErrorCodes_20
	dw MobileErrorCodes_20
	dw MobileErrorCodes_20
	dw MobileErrorCodes_20
	dw MobileErrorCodes_20
	dw MobileErrorCodes_20
	dw MobileErrorCodes_20
	dw MobileErrorCodes_21
	dw MobileErrorCodes_22
	dw MobileErrorCodes_23
	dw MobileErrorCodes_24
	dw MobileErrorCodes_25
	dw MobileErrorCodes_26
	dw MobileErrorCodes_30
	dw MobileErrorCodes_30
	dw MobileErrorCodes_30
	dw MobileErrorCodes_30
	dw MobileErrorCodes_30
	dw MobileErrorCodes_30
	dw MobileErrorCodes_30
	dw MobileErrorCodes_30
	dw MobileErrorCodes_30
	dw MobileErrorCodes_30
	dw MobileErrorCodes_31
	dw MobileErrorCodes_32
	dw MobileErrorCodes_33

MobileErrorCodes_10: db 1
	dw $000, MobileErrorCode_10_000_Text

MobileErrorCodes_11: db 1
	dw $000, MobileErrorCode_11_000_Text

MobileErrorCodes_12: db 1
	dw $000, MobileErrorCode_12_000_Text

MobileErrorCodes_13: db 1
	dw $000, MobileErrorCode_13_000_Text

MobileErrorCodes_14: db 1
	dw $000, MobileErrorCode_14_000_Text

MobileErrorCodes_15: db 4
	dw $000, MobileErrorCode_15_000_Text
	dw $001, MobileErrorCode_15_001_Text
	dw $002, MobileErrorCode_15_002_Text
	dw $003, MobileErrorCode_15_003_Text

MobileErrorCodes_16: db 1
	dw $000, MobileErrorCode_CommuncationErrorText

MobileErrorCodes_17: db 1
	dw $000, MobileErrorCode_CommuncationErrorText

MobileErrorCodes_20: db 1
	dw $000, MobileErrorCode_CommuncationErrorText

MobileErrorCodes_21: db 1
	dw $000, MobileErrorCode_CommuncationErrorText

MobileErrorCodes_22: db 1
	dw $000, MobileErrorCode_22_000_Text

MobileErrorCodes_23: db 1
	dw $000, MobileErrorCode_23_000_Text

MobileErrorCodes_24: db 1
	dw $000, MobileErrorCode_LineBusyText

MobileErrorCodes_25: db 1
	dw $000, MobileErrorCode_25_000_Text

MobileErrorCodes_26: db 1
	dw $000, MobileErrorCode_26_000_Text

MobileErrorCodes_30: db 17
	dw $000, MobileErrorCode_CommuncationErrorText
	dw $221, MobileErrorCode_LineBusyText
	dw $421, MobileErrorCode_LineBusyText
	dw $450, MobileErrorCode_30_450_Text
	dw $451, MobileErrorCode_LineBusyText
	dw $452, MobileErrorCode_LineBusyText
	dw $500, MobileErrorCode_CommuncationErrorText
	dw $501, MobileErrorCode_CommuncationErrorText
	dw $502, MobileErrorCode_CommuncationErrorText
	dw $503, MobileErrorCode_CommuncationErrorText
	dw $504, MobileErrorCode_CommuncationErrorText
	dw $550, MobileErrorCode_30_550_Text
	dw $551, MobileErrorCode_30_551_Text
	dw $552, MobileErrorCode_LineBusyText
	dw $553, MobileErrorCode_30_553_Text
	dw $554, MobileErrorCode_LineBusyText
	dw -1, MobileErrorCode_LineBusyText

MobileErrorCodes_31: db 5
	dw $000, MobileErrorCode_CommuncationErrorText
	dw $002, MobileErrorCode_31_002_Text
	dw $003, MobileErrorCode_31_003_Text
	dw $004, MobileErrorCode_CommuncationErrorText
	dw -1, MobileErrorCode_LineBusyText

MobileErrorCodes_32: db 17
	dw $000, MobileErrorCode_CommuncationErrorText
	dw $301, MobileErrorCode_CommuncationErrorText
	dw $302, MobileErrorCode_CommuncationErrorText
	dw $400, MobileErrorCode_CommuncationErrorText
	dw $401, MobileErrorCode_CommuncationErrorText
	dw $403, MobileErrorCode_32_403_Text
	dw $404, MobileErrorCode_32_404_Text
	dw $405, MobileErrorCode_CommuncationErrorText
	dw $406, MobileErrorCode_CommuncationErrorText
	dw $407, MobileErrorCode_CommuncationErrorText
	dw $408, MobileErrorCode_32_408_Text
	dw $500, MobileErrorCode_ServerErrorText
	dw $501, MobileErrorCode_CommuncationErrorText
	dw $502, MobileErrorCode_ServerErrorText
	dw $503, MobileErrorCode_32_503_Text
	dw $504, MobileErrorCode_ServerErrorText
	dw -1, MobileErrorCode_ServerErrorText

MobileErrorCodes_33: db 19
	dw $101, MobileErrorCode_33_101_Text
	dw $102, MobileErrorCode_33_102_Text
	dw $103, MobileErrorCode_33_103_Text
	dw $104, MobileErrorCode_33_104_Text
	dw $105, MobileErrorCode_33_105_Text
	dw $106, MobileErrorCode_33_106_Text
	dw $201, MobileErrorCode_33_201_Text
	dw $202, MobileErrorCode_CommuncationErrorText
	dw $203, MobileErrorCode_33_203_Text
	dw $204, MobileErrorCode_CommuncationErrorText
	dw $205, MobileErrorCode_ServerErrorText
	dw $206, MobileErrorCode_33_206_Text
	dw $299, MobileErrorCode_33_299_Text
	dw $301, MobileErrorCode_ServerErrorText
	dw $401, MobileErrorCode_ServerErrorText
	dw $402, MobileErrorCode_ServerErrorText
	dw $403, MobileErrorCode_ServerErrorText
	dw $404, MobileErrorCode_ServerErrorText
	dw -1, MobileErrorCode_ServerErrorText

MobileErrorCode_10_000_Text:
; The Mobile Adapter is not properly plugged in.
; Ensure you have taken a good look at and properly followed the instructions.
	db   "The MOBILE ADAPTER";"??????????????????????????????????????????"
	next "is not connected";"??????????????????????????????"
	next "properly. Please";"???????????????????????????????????????"
	next "refer to the";"????????????????????????????????????"
	next "instruction";"??????????????????????????????"
	next "manual."
	db   "@"

MobileErrorCode_11_000_Text:
MobileErrorCode_13_000_Text:
	db   "Couldn't communi-";"????????????????????????????????????????????????" ; longer than below?
	next "cate because the";"????????????????????????????????????????????????"
	next "line is busy.";"??????????????????????????????"
	next "Please try again";"????????????????????????"
	next "later.";"?????????????????????????????????"
	db   "@"

MobileErrorCode_12_000_Text:
; As the telephone line is busy, the phone was not able to gather enough information (?)
; Please wait for a while and call again.
	db   "Couldn't communi-";"????????????????????????????????????????????????"
	next "cate because the";"????????????????????????????????????"
	next "line is busy.";"????????????????????????"
	next "Please try again";"?????????????????????????????????"
	next "later."
	db   "@"

MobileErrorCode_15_000_Text:
MobileErrorCode_15_001_Text:
MobileErrorCode_15_002_Text:
MobileErrorCode_15_003_Text:
; There is an error with the Mobile Adapter.
; Please wait for a little while before calling again.
; If the problem persists, please contact the Mobile Support Center.
	db   "MOBILE ADAPTER";"?????????????????????????????????????????????"
	next "error. Please try";"????????????????????????"
	next "again later. If";"?????????????????????????????????"
	next "the problem per-";"???????????????????????????"
	next "sists, contact the";"???????????????????????????????????????"
	next "Support Center.";"??????????????????????????????"
	db   "@"

MobileErrorCode_CommuncationErrorText:
; Communication error.
; Please wait a moment, and then try again.
; If the issue persists, please contact the mobile support center.
	db   "Communication";"???????????????????????????"
	next "error. Please try";"????????????????????????"
	next "again later. If";"?????????????????????????????????"
	next "the problem per-";"???????????????????????????"
	next "sists, contact the";"???????????????????????????????????????"
	next "support center.";"??????????????????????????????"
	db   "@"

MobileErrorCode_22_000_Text:
	db   "Invalid LOG-IN";"??????????????????????????????"
	next "PASSWORD or LOG-";"?????????????????????????????????"
	next "IN-ID. Please";"???????????????????????????"
	next "change your PASS-";"???????????????????????????????????????"
	next "WORD and try";"????????????????????????"
	next "again later.";"?????????????????????????????????"
	db   "@"

MobileErrorCode_23_000_Text::
	db   "The phone was";"??????????????????????????????"
	next "disconnected.";"???????????????????????????????????????"
	next "Please refer to";"??????????????????"
	next "the instruction";"????????????????????????"
	next "manual and try";"?????????????????????????????????"
	next "again later."
	db   "@"

MobileErrorCode_ServerErrorText:
; There was a communication error with the mobile center.
; Please wait a moment and then try again.:
	db   "Error communica-";"???????????????????????????"
	next "ting with the";"???????????????????????????"
	next "MOBILE CENTER.";"?????????????????????"
	next "Please try";"?????????????????????????????????"
	next "again later."
	db   "@"

MobileErrorCode_14_000_Text:
MobileErrorCode_25_000_Text:
; The Mobile Adapter's details have expired and the information is not correct.
; Please use the Mobile Trainer to repeat the initial registration (process).
	db   "The MOBILE ADAPTER";"???????????????????????????"
	next "is not configured";"??????????????????????????????????????????"
	next "properly. Please";"??????????????????????????????"
	next "configure it using";"??????????????????????????????"
	next "MOBILE TRAINER.";"?????????????????????????????????????????????"
	db   "@"

MobileErrorCode_32_503_Text:
	db   "The MOBILE CENTER";"???????????????????????????"
	next "is busy. Please";"???????????????????????????????????????"
	next "try again later.";"?????????????????????"
	next "For details,";"?????????????????????????????????"
	next "see the instruc-";"????????????????????????????????????"
	next "tion manual.";"?????????????????????????????????????????????"
	db   "@"

MobileErrorCode_30_450_Text:
MobileErrorCode_30_550_Text:
MobileErrorCode_30_551_Text:
MobileErrorCode_30_553_Text:
; There is a mistake with the email address of the addressee.
; Please replace with a / the correct email address.
	db   "The email address";"???????????????????????????????????????" ; ???
	next "is incorrect.";"???????????????????????????"
	next "Please change";"???????????????????????????????????????"
	next "your email";"??????????????????????????????"
	next "address."
	db   "@"

MobileErrorCode_31_002_Text:
	db   "There is an error";"????????????????????????"
	next "in your email";"??????????????????????????????"
	next "address.";"???????????????????????????????????????"
	next "Please confirm it";"??????????????????"
	next "using MOBILE";"??????????????????????????????"
	next "TRAINER.";"?????????????????????????????????????????????"
	db   "@"

MobileErrorCode_31_003_Text:
MobileErrorCode_33_201_Text:
	db   "Incorrect LOG-IN";"??????????????????????????????"
	next "PASSWORD or MOBILE";"???????????????????????????"
	next "CENTER error.";"?????????????????????????????????????????????"
	next "Please try again";"???????????????????????????????????????"
	next "later.";"????????????????????????"
	;next "?????????????????????????????????"
	db   "@"

MobileErrorCode_32_403_Text:
MobileErrorCode_32_404_Text:
	db   "Communication";"????????????????????????????????????????????????"
	next "error. Please try";"?????????????????????"
	next "again later. If";"?????????????????????????????????"
	next "the problem per-";"???????????????????????????"
	next "sists, contact the";"???????????????????????????????????????"
	next "support center.";"??????????????????????????????"
	db   "@"

MobileErrorCode_26_000_Text:
MobileErrorCode_32_408_Text:
	db   "Time is up, the";"?????????????????????" ; ???
	next "call ended.";"??????????????????????????????"
	next "Refer to the";"?????????????????????????????????????????????"
	next "instruction manual";"????????????????????????????????????"
	next "for details.";"?????????????????????????????????????????????"
	db   "@"

MobileErrorCode_33_101_Text:
	db   "????????????????????????????????????" ; ???
	next "????????????????????????????????????????????????"
	next "??????????????????????????????????????????"
	next "????????????????????????????????????"
	next "?????????????????????????????????????????????"
	db   "@"

MobileErrorCode_33_102_Text:
MobileErrorCode_33_299_Text:
	db   "?????????????????????????????????????????????" ; ???
	next "???????????????????????????"
	next "????????????????????????????????????"
	next "?????????????????????????????????????????????"
	db   "@"

MobileErrorCode_LineBusyText:
; The telephone line is busy. Due to this error, the Mobile Center cannot communicate.
; Please wait for a little while and call again.
	db   "There was an error";"?????????????????????????????????????????????"
	next "with the phone or";"??????????????????????????????????????????"
	next "the MOBILE CENTER.";"?????????????????????????????????"
	next "Please try again";"????????????????????????"
	next "later.";"?????????????????????????????????"
	db   "@"

MobileErrorCode_33_103_Text:
	db   "?????????????????????????????????" ; ??? month limit?
	next "??????????????????????????????????????????"
	next "?????????????????????????????????????????????"
	next "????????????????????????????????????"
	next "?????????????????????????????????????????????"
	db   "@"

MobileErrorCode_33_106_Text:
	db   "The MOBILE CENTER";"??????????????????????????????????????????" ; ???
	next "is undergoing";"????????????????????????????????????"
	next "maintenance.";"?????????????????????????????????"
	next "Please try again";"????????????????????????"
	next "later.";"?????????????????????????????????"
	db   "@"

MobileErrorCode_33_104_Text:
MobileErrorCode_33_105_Text:
MobileErrorCode_33_203_Text:
MobileErrorCode_33_206_Text:
MobileErrorCode_101_004_Text:
	db   "Communication";"????????????????????????????????????????????????"
	next "error.";"????????????????????????????????????"
	next "See the instruc-";"?????????????????????????????????????????????"
	next "tion manual for"
	next "details."
	db   "@"

MobileErrorCode_101_006_Text:
	db   "Hung up the phone";"????????????????????????????????????"
	next "because there was";"??????????????????????????????????????????"
	next "no input for 3";"??????????????????????????????"
	next "minutes."
	db   "@"

MobileErrorCode_101_001_Text:
MobileErrorCode_101_002_Text:
	db   "Communication";"???????????????????????????"
	next "failed.";"????????????????????????"
	next "Please try";"?????????????????????????????????"
	next "again.";"??????????????????????????????"
	db   "@"

MobileErrorCode_101_003_Text:
MobileErrorCode_101_008_Text:
MobileErrorCode_101_009_Text:
	db   "Communication";"????????????????????????????????????????????????" ; duplicate?
	next "error. Please try";"?????????????????????"
	next "again later. If";"?????????????????????????????????"
	next "the problem per-";"???????????????????????????"
	next "sists, contact the";"???????????????????????????????????????"
	next "support center.";"??????????????????????????????"
	db   "@"

MobileErrorCode_101_007_Text:
	db   "Due to the long";"????????????????????????????????????"
	next "waiting time, the";"??????????????????????????????"
	next "phone was hung up."
	db   "@"

MobileErrorCode_101_005_Text:
	db   "The types of";"??????????????????????????????????????????"
	next "MOBILE ADAPTERS";"??????????????????????????????"
	next "used differ.";"????????????????????????????????????"
	next "See the instruc-";"?????????????????????????????????????????????"
	next "tion manual for"
	next "details."
	db   "@"

String_17fe9a: ; unused
	db   "The #MON NEWS";"???????????????????????????"
	next "were updated.";"????????????????????????????????????"
	next "Please load the";"????????????????????????????????????"
	next "new NEWS before";"?????????????????????????????????????????????"
	next "updating the";"????????????????????????????????????????????????"
	next "RANKINGS."
	db   "@"

MobileErrorCode_101_000_Text:
	db   "???????????????????????????????????????" ; ???
	next "???????????????????????????????????????"
	next "????????????????????????"
	next "???????????????????????????????????????"
	next "????????????????????????????????????????????????"
	db   "@"

Function17ff23:
	ldh a, [hJoyPressed]
	and a
	ret z
	ld a, $8
	ld [wMusicFade], a
	ld a, [wMapMusic]
	ld [wMusicFadeID], a
	xor a
	ld [wMusicFadeID + 1], a
	ld hl, wc303
	set 7, [hl]
	ret

Function17ff3c:
	nop
	ld a, [wMobileErrorCodeBuffer]
	cp $d0
	ret c
	hlcoord 10, 2
	ld de, String_17ff68
	call PlaceString
	ld a, [wMobileErrorCodeBuffer]
	push af
	sub $d0
	inc a
	ld [wMobileErrorCodeBuffer], a
	hlcoord 14, 2
	ld de, wMobileErrorCodeBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	pop af
	ld [wMobileErrorCodeBuffer], a
	and a
	ret

String_17ff68:
	db "?????????@"