extends Node2D

func _ready():
	$log_slider.tick_count=Whiteboard.thopters.size()+1
	$log_slider.max_value=Whiteboard.thopters.size()
	$plank_slider.tick_count=Whiteboard.thopters.size()+1
	$plank_slider.max_value=Whiteboard.thopters.size()
# warning-ignore:return_value_discarded
	$log_slider.connect("value_changed",self,"_on_log_slider_changed")
# warning-ignore:return_value_discarded
	$plank_slider.connect("value_changed",self,"_on_plank_slider_changed")
	assign_jobs()

# warning-ignore:unused_argument
func _on_log_slider_changed(value):
	if $log_slider.value > $plank_slider.value:
		$plank_slider.value=$log_slider.value
	assign_jobs()
	
# warning-ignore:unused_argument
func _on_plank_slider_changed(value):
	if $log_slider.value > $plank_slider.value:
		$log_slider.value=$plank_slider.value
	assign_jobs()

func assign_jobs():
	for i in Whiteboard.thopters.size():
		#add condition && i<$plank_slider
		if i<$log_slider.value:
			#should haul
			Whiteboard.thopters[i].current_job="haul_logs"
		elif  i<$plank_slider.value:
			Whiteboard.thopters[i].current_job="haul_planks"
		else:
			#should ide
			Whiteboard.thopters[i].current_job="idle"
	pass
