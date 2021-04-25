extends Node2D


var capacity = 10
var occupants = 0

func _init():
	Whiteboard.add_idle_hatch(self)
