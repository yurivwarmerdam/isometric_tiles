extends Node2D

onready var tilemap = $ground
onready var reference_tilemap = TileMap.new()
onready var highlight = $player_input_handler/tile_cursor



var tile_offset = Vector2(0,16)

func _ready():
	setup_reference_tilemap()
	pass

#func _process(_delta):
#	var hightlight_pos=tilemap.map_to_world(tilemap.world_to_map(get_global_mouse_position()))+tile_offset
#	highlight.position=hightlight_pos
#	pass


func setup_reference_tilemap():
	reference_tilemap.mode = TileMap.MODE_ISOMETRIC
	reference_tilemap.cell_size = Vector2(48,24)
	reference_tilemap.cell_quadrant_size = 16
	
