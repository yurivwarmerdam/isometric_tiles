extends Node2D

export var spawn_position:Vector2 = Vector2(0,589)
export var pool_size:int = 10
export var timer_wait_time = 5
#export var pool_size:int = 1000
#export var timer_wait_time = 0.01
export var enemy_speed=10
export var goal = Vector2(1032, 72)

signal enemy_death

var enemies:Array=[]

var enemy_prototype = preload("res://scenes/enemy.tscn")

onready var timer=$Timer
func _ready():
	while enemies.size() < pool_size:
		var new_enemy=enemy_prototype.instance()
		#new_enemy.position=spawn_position
		add_child(new_enemy)
		new_enemy.spawn_position=spawn_position
		new_enemy.connect("die",self, "_on_enemy_death")
		enemies.append(new_enemy)
	timer.wait_time=timer_wait_time
	timer.connect("timeout",self,"_do_spawn_attempt")
	pass

func _process(delta):
	_move_enemies(delta)
	pass

func _do_spawn_attempt():
	for enemy in enemies:
		if !enemy.is_active:
			enemy.spawn()
			return enemy
	pass

func _move_enemies(delta):
	for enemy in enemies:
		if enemy.is_active:
			move_enemy(enemy, delta)
	pass

func move_enemy(enemy, delta):
	enemy.position= enemy.position.move_toward(goal,enemy_speed*delta)
	pass

func _on_enemy_death():
	emit_signal("enemy_death")
