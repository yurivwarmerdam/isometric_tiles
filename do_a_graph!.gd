extends Node2D

var offset

func _draw():
	var full=get_viewport_rect().size
	var half=get_viewport_rect().size/2
	var pos1=Vector2(0,half.y)
	var pos2=Vector2(full.x,half.y)
	var pos3=Vector2(half.x,0)
	var pos4=Vector2(half.x,full.y)
	offset=get_viewport_rect().size/2
	
	draw_line(pos1,pos2,Color.bisque)
	draw_line(pos3,pos4,Color.bisque)
	draw_graph()
	
		#draw_circles()
	#draw_more_circles()
	even_more_circles()

func draw_graph():
	var array:Array=[]
	for n in range(-600,601):
		array.append(some_function(n))
		array.append(another_function(n))
		array.append(third_function(n))
	for n in array.size()-1:
		var pos1:Vector2=array[n]
		var pos2:Vector2=array[n+1]
		draw_line(pos1,pos2,Color(float(n)/array.size(),float(n)/array.size(),float(n)/array.size()),2)
	pass

func some_function(i:int) ->Vector2:
	var result=(i*i)*-.001
	return offset+Vector2(i,result)

func another_function(i:int) ->Vector2:
	if i==0: return offset
	else:
		var result = (1.0/i)*5000
		return offset+Vector2(i,result)

func third_function(i:int)->Vector2:
	return offset+Vector2(i,0)



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
