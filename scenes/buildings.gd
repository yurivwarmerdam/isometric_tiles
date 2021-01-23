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
var x_size=23
var y_min=-23
var y_max=23
var y_size=y_max+abs(y_min)+1


func _ready():
	#revisit this....
	for x in x_size+1:
		placed_buildings.append([])
		for y in y_max+1:
			placed_buildings[x].append(null)
		for _y in range(y_min,0):
			placed_buildings[x].append(null)
	print(placed_buildings.size())
	
	for factory in get_used_cells_by_id(FACTORY):
		add_placed_building(factory,building_class.new(Vector2(factory.x,factory.y)))
		#placed_buildings[factory.x][factory.y]=building_class.new(Vector2(factory.x,factory.y))
		pass
	for sawmill in get_used_cells_by_id(SAWMILL):
		var my_building=building_class.new(sawmill)
		add_placed_building(sawmill,my_building)
		add_placed_building(sawmill+directions.SE,my_building)
		placed_buildings[sawmill.x][sawmill.y]=my_building
		placed_buildings[sawmill.x+1][sawmill.y]=my_building
		pass
	
	pass

func place_building(tile:Vector2):
	if placed_buildings[tile.x][tile.y] == null:
		set_cellv(tile,FACTORY)
		#add nedw building to placed_buildings
		add_placed_building(tile,building_class.new(tile))
		print(tile)

func add_placed_building(pos:Vector2,building:building_class):
	placed_buildings[pos.x][pos.y]=building
	pass

class building_class:
	var position:Vector2
	var claimed:bool
	func _init(pos:Vector2,is_claimed:bool=false):
		position=pos
		claimed=is_claimed
