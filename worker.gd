extends Node2D

export var is_active:bool = false
export var pickup_point:Vector2 = Vector2(600,424)
export var dropoff_point:Vector2 = Vector2(720,370)
export var speed=50
export var cargo_capacity:int=10
export var load_speed=5
var current_cargo:float

onready var sprite = $Sprite
var delta:float
var spawn_position:Vector2

func _ready():

	pass

# warning-ignore:shadowed_variable
func _process(delta):
	self.delta=delta
	pass

#hauling stuff:
	#var result:bool
	#result=move_to_pickup()
	#if result:
	#	result=load_cargo()
	#if result:
	#	result=move_to_dropoff()
	#if result:
	#	result=unload_cargo()
	#return result

#------Tasks------#

func task_move_to_pickup(task):
	if position==pickup_point: task.succeed()
	else: move_to(pickup_point)
	pass

func task_move_to_dropoff(task):
	if position==dropoff_point: task.succeed()
	else: move_to(dropoff_point)
	pass

func task_load_cargo(task):
	if current_cargo==cargo_capacity: task.succeed()
	else: load_cargo()
	pass

func task_unload_cargo(task):
	if current_cargo==0: task.succeed()
	else: unload_cargo()
	pass

#move somewhere
func move_to(target):
	position= position.move_toward(target,speed*delta)
	pass

func load_cargo():
	current_cargo=clamp(current_cargo+(delta*load_speed),0,cargo_capacity)
	$Label.text=str(stepify(current_cargo,0.1))+"/"+str(cargo_capacity)
	#$Label.text=str(current_cargo)
	pass


func unload_cargo():
	current_cargo=clamp(current_cargo-(delta*load_speed),0,cargo_capacity)
	$Label.text=str(stepify(current_cargo,0.1))+"/"+str(cargo_capacity)
	pass


#this might be relevant if we're doing some pooling again.
func initialize():
	sprite.visible = false

func spawn():
	position=spawn_position
	sprite.visible = true
	is_active = true

func toggle_is_active():
	is_active = !is_active
