extends Node
#philospiphical consideration: whiteboard should never contain an update() function. It just contains:
# - state
# - references ot objects
# - helper funcitons that should be generically accessible.
# down the line I can consider splitting these groups up into separate whiteboards.

var trees:Array=[]
var sawmills:Array=[]
var thopters:Array=[]
var plank_piles:Array=[]
var idle_hatches:Array=[]

func add_tree(tree:Node):
	trees.append(tree)
	
func add_sawmill(sawmill:Node):
	sawmills.append(sawmill)

func add_thopter(thopter:Node):
	thopters.append(thopter)

func add_plank_pile(pile:Node):
	plank_piles.append(pile)

func add_idle_hatch(hatch:Node):
	plank_piles.append(hatch)
