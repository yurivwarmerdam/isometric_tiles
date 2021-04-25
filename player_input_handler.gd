extends Node2D
onready var ground:TileMap = get_tree().get_root().get_node("main/tiles/ground")
onready var buildings:TileMap = get_tree().get_root().get_node("main/tiles/buildings")
onready var enemies:Array = get_tree().get_root().get_node("main/enemy_pool").enemies
onready var reference_tilemap = TileMap.new()

onready var highlight = $tile_cursor
var tile_offset = Vector2(0,16)

func _ready():
	setup_reference_tilemap()
	pass

func _process(_delta):
	var hightlight_pos=reference_tilemap.map_to_world(reference_tilemap.world_to_map(get_global_mouse_position()))+tile_offset
	highlight.position=hightlight_pos
	pass


func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		var clicked_tile=ground.world_to_map(get_global_mouse_position())
		if ground.get_cellv(clicked_tile) == 1:
			attack_tile(ground.world_to_map(get_global_mouse_position()))
		elif ground.get_cellv(clicked_tile) == 0:
			buildings.place_building(clicked_tile)

func attack_tile(tile:Vector2):
	for enemy in enemies:
		if ground.world_to_map(enemy.position) == tile:
			enemy.kill()

func setup_reference_tilemap():
	reference_tilemap.mode = TileMap.MODE_ISOMETRIC
	reference_tilemap.cell_size = Vector2(48,24)
	reference_tilemap.cell_quadrant_size = 16
	
