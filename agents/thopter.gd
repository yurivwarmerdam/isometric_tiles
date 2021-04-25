extends Node2D

#levelable atributes:
var cargo_capacity:float=1
var cargo_level:float=0
var speed=50

#bookkeeping variables
var input:Node2D=null
var output:Node2D=null
var delta:float
var load_speed:float=2
var current_job:String="idle"

func _init():
	Whiteboard.add_thopter(self)

# warning-ignore:shadowed_variable
func _process(delta):
	self.delta=delta
	pass

func task_get_input_target_tree(task):
	for tree in Whiteboard.trees:
		if !tree.is_claimed:
			tree.is_claimed = true
			input=tree
			task.succeed()
			break
	if input==null: task.failed()
	pass

func task_get_input_target_sawmill(task):
	for mill in Whiteboard.sawmills:
		if !mill.is_claimed:
			mill.is_claimed = true
			input=mill
			task.succeed()
			break
	if input==null: task.failed()
	pass

func task_get_output_target_sawmill(task):
	for sawmill in Whiteboard.sawmills:
		if !sawmill.is_claimed:
			#debug: disabling claiming sawmills to allow multiple bots per sawmill
			#sawmill.is_claimed = true
			output=sawmill
			task.succeed()
			break
	if output==null: task.failed()
	task.succeed()
	pass

func task_get_output_target_storage(task):
	for pile in Whiteboard.plank_piles:
		if !pile.is_claimed:
			#debug: disabling claiming sawmills to allow multiple bots per sawmill
			#sawmill.is_claimed = true
			output=pile
			task.succeed()
			break
	if output==null: task.failed()
	task.succeed()
	pass

func task_aaa_test(task):
	print("test behavior")
	task.failed()

func task_move_to_input(task):
	move_to(input.position)
	if self.position==input.position: task.succeed()

func task_move_to_output(task):
	move_to(output.position)
	if self.position==output.position: task.succeed()

func task_load(task):
	load_resource(load_speed*delta)
	if cargo_level==cargo_capacity: task.succeed()
	
func task_unload(task):
	unload_resource(load_speed*delta)
	if cargo_level ==0: task.succeed()

	
func task_clear_input(task):
	input.is_claimed = false
	input=null
	task.succeed()

func task_clear_output(task):
	output.is_claimed = false
	output=null
	task.succeed()
	

func task_is_idling(task):
	if current_job == "idle": task.succeed()
	else: task.failed()

func task_is_hauling_logs(task):
	if current_job == "haul_logs": task.succeed()
	else: task.failed()

func task_is_hauling_planks(task):
	if current_job == "haul_planks": task.succeed()
	else: task.failed()


func move_to(target:Vector2):
	if target.x < self.position.x:
		$Sprite.flip_h = true
	if target.x > self.position.x:
		$Sprite.flip_h = false
	if target.y < self.position.y:
		$Sprite.flip_v = true
	if target.y > self.position.y:
		$Sprite.flip_v = false
	position= position.move_toward(target,speed*delta)
	pass

func load_resource(amount:float):
	var amount_to_load:float = amount
	if cargo_capacity-cargo_level < amount: 
		amount_to_load=cargo_capacity-cargo_level
	if input.output_level >=amount_to_load:
		input.add_output(-amount_to_load)
		cargo_level= move_toward(cargo_level, cargo_capacity,amount_to_load)
	elif input.output_level >0:
		cargo_level= move_toward(cargo_level, cargo_capacity,input.output_level)
		input.add_output(-input.output_level)
	$Label.text = str(stepify(cargo_level,0.1))+"/"+str(cargo_capacity)
	
func unload_resource(amount:float):
	var amount_to_unload = amount
	if cargo_level < amount:
		amount_to_unload= cargo_level
	if output.input_headspace() > amount_to_unload:
		output.add_input(amount_to_unload)
		cargo_level = move_toward(cargo_level,0,amount_to_unload)

func change_job(job:String):
	current_job=job
