extends Node2D
onready var ground:TileMap = get_tree().get_root().get_node("main/tiles/ground")
onready var buildings:TileMap = get_tree().get_root().get_node("main/tiles/buildings")
onready var enemies:Array = get_tree().get_root().get_node("main/enemy_pool").enemies

func _ready():
	pass

#probably something like this?
func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		var clicked_tile=ground.world_to_map(get_global_mouse_position())
		if ground.get_cellv(clicked_tile) == 1:
			attack_tile(ground.world_to_map(get_global_mouse_position()))
		elif ground.get_cellv(clicked_tile) == 0:
			buildings.place_building(clicked_tile)
		#print(tilemap.get_cellv(tilemap.world_to_map(get_global_mouse_position())))
		

func attack_tile(tile:Vector2):
	for enemy in enemies:
		if ground.world_to_map(enemy.position) == tile:
			enemy.kill()

