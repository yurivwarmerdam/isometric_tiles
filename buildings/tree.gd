extends Node2D

var resource_capacity:float=10
var output_level:float=0
var is_claimed:bool=false

func _init():
	Whiteboard.add_tree(self)

func _process(delta):
	add_output(delta)

#allows both positive and negative numbers
func add_output(amount:float):
	output_level=clamp(output_level+amount,0,resource_capacity)
	$Label.text=str(stepify(output_level,0.1))+"/"+str(resource_capacity)

