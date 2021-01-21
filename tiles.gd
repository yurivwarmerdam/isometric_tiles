extends Node2D

onready var tilemap = $ground
onready var highlight = $Node2D

var tile_offset

func _ready():
	tile_offset=Vector2(0,16)
	pass

func _process(_delta):
	var hightlight_pos=tilemap.map_to_world(tilemap.world_to_map(get_global_mouse_position()))+tile_offset
	highlight.position=hightlight_pos
	pass
