SafariZoneBeta_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

SafariZoneBeta_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $17, $9, 1, SAFARI_ZONE_FUCHSIA_GATE_BETA
	warp_def $17, $a, 2, SAFARI_ZONE_FUCHSIA_GATE_BETA

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
