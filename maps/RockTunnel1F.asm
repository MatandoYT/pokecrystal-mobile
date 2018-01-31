	const_def 2 ; object constants
	const ROCKTUNNEL1F_POKE_BALL1
	const ROCKTUNNEL1F_POKE_BALL2

RockTunnel1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RockTunnel1FElixer:
	itemball ELIXER

RockTunnel1FTMSteelWing:
	itemball TM_STEEL_WING

RockTunnel1FHiddenXAccuracy:
	hiddenitem X_ACCURACY, EVENT_ROCK_TUNNEL_1F_HIDDEN_X_ACCURACY

RockTunnel1FHiddenXDefend:
	hiddenitem X_DEFEND, EVENT_ROCK_TUNNEL_1F_HIDDEN_X_DEFEND

RockTunnel1F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 15, 3, 1, ROUTE_9
	warp_event 11, 25, 1, ROUTE_10_SOUTH
	warp_event 5, 3, 3, ROCK_TUNNEL_B1F
	warp_event 15, 9, 2, ROCK_TUNNEL_B1F
	warp_event 27, 3, 4, ROCK_TUNNEL_B1F
	warp_event 27, 13, 1, ROCK_TUNNEL_B1F

	db 0 ; coord events

	db 2 ; bg events
	bg_event 24, 4, BGEVENT_ITEM, RockTunnel1FHiddenXAccuracy
	bg_event 21, 15, BGEVENT_ITEM, RockTunnel1FHiddenXDefend

	db 2 ; object events
	object_event 4, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FElixer, EVENT_ROCK_TUNNEL_1F_ELIXER
	object_event 10, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FTMSteelWing, EVENT_ROCK_TUNNEL_1F_TM_STEEL_WING
