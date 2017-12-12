Route16_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_NEWMAP, .AlwaysOnBike

.AlwaysOnBike:
	checkcode VAR_YCOORD
	if_less_than $5, .CanWalk
	checkcode VAR_XCOORD
	if_greater_than $d, .CanWalk
	setflag ENGINE_ALWAYS_ON_BIKE
	return

.CanWalk:
	clearflag ENGINE_ALWAYS_ON_BIKE
	return

CyclingRoadSign:
	jumptext CyclingRoadSignText

CyclingRoadSignText:
	text "CYCLING ROAD"

	para "DOWNHILL COASTING"
	line "ALL THE WAY!"
	done

Route16_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $1, $3, 1, ROUTE_16_FUCHSIA_SPEECH_HOUSE
	warp_def $6, $e, 3, ROUTE_16_GATE
	warp_def $7, $e, 4, ROUTE_16_GATE
	warp_def $6, $9, 1, ROUTE_16_GATE
	warp_def $7, $9, 2, ROUTE_16_GATE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 5, 5, SIGNPOST_READ, CyclingRoadSign

.PersonEvents:
	db 0
