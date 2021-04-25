extends Node2D

var input_capacity:float=10
var output_capacity:float=10
var input_level:float=0
var output_level:float=0
var is_claimed:bool=false

func _init():
	Whiteboard.add_sawmill(self)

func _process(delta):
	if input_level>=delta:
		add_input(-delta)
		add_output(delta)
	elif input_level > 0.0:
		add_output(input_level)
		add_input(-input_level)

#allows both positive and negative numbers
func add_input(amount:float):
	input_level=clamp(input_level+amount,0,input_capacity)
	$Label_input.text=str(stepify(input_level,0.1))+"/"+str(input_capacity)

#allows both positive and negative numbers
func add_output(amount:float):
	output_level=clamp(output_level+amount,0,output_capacity)
	$Label_output.text=str(stepify(output_level,0.1))+"/"+str(output_capacity)

func input_headspace()->float:
	return input_capacity-input_level
