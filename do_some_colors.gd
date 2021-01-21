extends Node2D

var offset


func _draw():
	offset=get_viewport_rect().size/2
	#draw_circles()
	#draw_more_circles()
	even_more_circles()



func draw_circles():
	var array:Array=[]
	for n in range(-25,26):
		for m in range(-25,26):
			array.append(Vector2(n*10,m*10))
	for n in array.size():
		draw_circle(offset+array[n],3,Color(.1,array[n].x/250,array[n].y/250))


func draw_more_circles():
	var circle_positions:Array=[]
	var circle_colors:Array=[]
	var size = 50
	var half_size = size/2
	for n in range(size+1):
		for m in range(size+1):
			circle_positions.append(Vector2((n-half_size)*10,(m-half_size)*10))
			circle_colors.append(Vector2(float(n)/size,float(m)/size))
	for n in circle_positions.size():
		draw_circle(offset+circle_positions[n],3,Color(.5,circle_colors[n].x,circle_colors[n].y))

func even_more_circles():
	var circle_positions:Array=[]
	var circle_colors:Array=[]
	var size = 20
	var half_size = size/2
	for n in range(size+1):
		for m in range(size+1):
			for o in range(size+1):
				circle_positions.append(Vector2(o,o)+Vector2((n-half_size)*size*1.5,(m-half_size)*size*1.5))
				circle_colors.append(Vector3(float(n)/size,float(m)/size,float(o)/size))
	for n in circle_positions.size():
		draw_circle(offset+circle_positions[n],size*.3,Color(circle_colors[n].z,circle_colors[n].x,circle_colors[n].y))
