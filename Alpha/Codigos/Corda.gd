extends Node2D

var arrastar = false


export (float) var ropeLength = 30
export (float) var constrain = 1	# distance between points
export (Vector2) var gravity = Vector2(0,9.8)
export (float) var dampening = 0.9
export (bool) var startPin = true
export (bool) var endPin = true

onready var line2D: = $Linha

var pos: PoolVector2Array
var posPrev: PoolVector2Array
var pointCount: int

func _ready()->void:
	pointCount = get_pointCount(ropeLength)
	resize_arrays()
	init_position()
	get_node("Linha/Inicio").rect_global_position = pos[pos.size()-1] - Vector2(80, 40)
	get_node("Linha/Fim").rect_global_position = pos[0] - Vector2(80, 40)

func get_pointCount(distance: float)->int:
	return int(ceil(distance / constrain))

func resize_arrays():
	pos.resize(pointCount)
	posPrev.resize(pointCount)

func init_position()->void:
	for i in range(pointCount):
		pos[i] = position + Vector2(constrain *i, 0)
		posPrev[i] = position + Vector2(constrain *i, 0)
	position = Vector2.ZERO
	

func _unhandled_input(event:InputEvent)->void:
#	if event is InputEventMouseMotion:
#		if Input.is_action_pressed("click"):	#Move start point
#			set_start(get_global_mouse_position())
#		if Input.is_action_pressed("right_click"):	#Move start point
#			set_last(get_global_mouse_position())
#	if event is InputEventMouseButton && event.is_pressed():
#		if event.button_index == 1:
#			set_start(get_global_mouse_position())
#		elif event.button_index == 2:
#			set_last(get_global_mouse_position())
	pass

func _process(delta)->void:
	update_points(delta)
	update_constrain()
	
	if not arrastar:
		$Linha/Inicio.rect_global_position = pos[pos.size()-1] - Vector2(80, 40)
		pass

#	get_node("Linha/Fim").rect_global_position = pos[0] - Vector2(80, 40)
	#update_constrain()	#Repeat to get tighter rope
	#update_constrain()
	
	# Send positions to Line2D for drawing
	line2D.points = pos

func set_start(p:Vector2)->void:
#	get_node("Linha/Inicio").rect_global_position = p - Vector2(80, 40)
	pos[0] = p
	posPrev[0] = p

func set_last(p:Vector2)->void:
	pos[pointCount-1] = p
	posPrev[pointCount-1] = p
	

func update_points(delta)->void:
	for i in range (pointCount):
		# not first and last || first if not pinned || last if not pinned
		if (i!=0 && i!=pointCount-1) || (i==0 && !startPin) || (i==pointCount-1 && !endPin):
			var velocity = (pos[i] -posPrev[i]) * dampening
			posPrev[i] = pos[i]
			pos[i] += velocity + (gravity * delta)

func update_constrain()->void:
	for i in range(pointCount):
		if i == pointCount-1:
			return
		var distance = pos[i].distance_to(pos[i+1])
		var difference = constrain - distance
		var percent = difference / distance
		var vec2 = pos[i+1] - pos[i]
		
		# if first point
		if i == 0:
			if startPin:
				pos[i+1] += vec2 * percent
			else:
				pos[i] -= vec2 * (percent/2)
				pos[i+1] += vec2 * (percent/2)
		# if last point, skip because no more points after it
		elif i == pointCount-1:
			pass
		# all the rest
		else:
			if i+1 == pointCount-1 && endPin:
				pos[i] -= vec2 * percent
			else:
				pos[i] -= vec2 * (percent/2)
				pos[i+1] += vec2 * (percent/2)


func _on_Inicio_arrastarInicio(event):
	if event is InputEventScreenTouch:
		if arrastar:
			arrastar = false
		else:
			arrastar = true
	if event is InputEventMouseMotion and arrastar:
		$Linha/Inicio.rect_global_position = event.global_position - Vector2(80, 40)
		set_last(get_global_mouse_position())
	pass # Replace with function body.
