Route6UndergroundEntrance_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route6UndergroundEntrance_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 1, ROUTE_6
	warp_def $7, $4, 1, ROUTE_6
	warp_def $3, $4, 2, UNDERGROUND

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
