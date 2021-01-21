extends Node2D

export var is_active:bool = false
onready var sprite = $Sprite

var spawn_position:Vector2

signal die

func _ready():
	initialize()
	pass

func initialize():
	sprite.visible = false

func spawn():
	position=spawn_position
	sprite.visible = true
	is_active = true

func toggle_is_active():
	is_active = !is_active

func kill():
	is_active=false
	sprite.visible = false
	position=spawn_position
	emit_signal("die")
