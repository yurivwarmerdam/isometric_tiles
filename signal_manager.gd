extends Control

onready var tilemap:TileMap = get_tree().get_root().get_node("main/tiles").tilemap
onready var enemy_pool = get_tree().get_root().get_node("main/enemy_pool")

var score:int

func _ready():
	score=0
	$Label.text=str(score)
	enemy_pool.connect("enemy_death",self,"_on_enemy_death")
# warning-ignore:return_value_discarded
	$debug_button.connect("pressed",self,"_on_test_button_pressed")

func _on_enemy_death():
	update_score()

func _on_test_button_pressed():
	#_on_enemy_death()
	
	pass

func update_score():
	score+=1
	$Label.text=str(score)
