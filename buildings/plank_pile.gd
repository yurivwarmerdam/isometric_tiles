extends Node2D

var input_capacity:float=20
var input_level:float=0
var output_level:float=0
var is_claimed:bool=false

func _init():
	Whiteboard.add_plank_pile(self)

#allows both positive and negative numbers
func add_input(amount:float):
	input_level=clamp(input_level+amount,0,input_capacity)
	$Label_input.text=str(stepify(input_level,0.1))+"/"+str(input_capacity)

func input_headspace()->float:
	return input_capacity-input_level
