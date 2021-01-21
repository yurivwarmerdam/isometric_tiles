extends Area2D

export var speed=10
export var goal = Vector2(1032, 72)

var start_position
var score

onready var shape = $CollisionShape2D

func _ready():
	start_position=position
	score=0
	pass # Replace with function body.

func _process(delta):
	move(delta)
	pass

func move(delta):
	position+= (goal-position).normalized()*speed*delta
	pass

func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		attack()

func attack():
	position = start_position
	score +=1
	print(score)
