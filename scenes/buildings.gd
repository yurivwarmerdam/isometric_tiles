extends TileMap

enum {
	EMPTY = -1,
	FACTORY = 0,
	SILO = 1,
	SAWMILL = 2,
	TREES = 3
	}
var directions = {
	NE=Vector2(0,-1),
	NW=Vector2(-1,0),
	SW=Vector2(0,1),
	SE=Vector2(1,0)
}

var placed_buildings:Array

func _ready():
	#revisit this....
	for factory in get_used_cells_by_id(FACTORY):
		placed_buildings[factory.x][factory.y]="asd"
		pass
	
	pass

func place_building(tile:Vector2):
	set_cellv(tile,FACTORY)
	print(tile)
	pass


class my_class:
	var position
	var claimed
	func _init(pos,is_claimed=false):
		position=pos
		claimed=is_claimed
