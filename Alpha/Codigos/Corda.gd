extends Node2D

var arrastar = false
var acerto = false

var pino : String



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
	constrain = 15
	pointCount = get_pointCount(150)
	dampening = 0.8
	resize_arrays()
	init_position()
	get_node("Linha/Inicio").rect_global_position = pos[pos.size()-1] - Vector2(0, 0)
	get_node("Linha/Fim").rect_global_position = pos[0] - Vector2(60, 40)

func get_pointCount(distance: float)->int:
	return int(ceil(distance / constrain))

func resize_arrays():
	pos.resize(pointCount)
	posPrev.resize(pointCount)

func init_position()->void:
	for i in range(pointCount):
		pos[i] = global_position + Vector2(constrain *i, 0)
		posPrev[i] = global_position + Vector2(constrain *i, 0)
	global_position = Vector2.ZERO
	

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
	
	if not arrastar:
		$Linha/Inicio.rect_position = pos[pos.size()-1] - Vector2(80, 40)
		if acerto:
			self.endPin = true
			line2D.get_child(0).mouse_filter = 2 
			$Acerto.play()
			acerto = false
			print("Pino: ", pino)
			get_node("/root/TelaDelegaciaFase1").contador += 1
			get_node("/root/TelaDelegaciaFase1/CaixaDialogo/Margem/Elementos/Campo/Margem/Texto").bbcode_text = tr("DelegaciaFase1_"+pino)
			get_node("/root/TelaDelegaciaFase1/CaixaDialogo/Margem/Elementos/Campo/Margem/Texto").percent_visible = 0
			get_node("/root/TelaDelegaciaFase1/CaixaDialogo/Margem/Elementos/Campo/Margem/Texto").taxaExposicao = 0
			get_node("/root/TelaDelegaciaFase1/CaixaDialogo/Margem/Elementos/Campo/Margem/Texto").set_process(true)
			get_node("/root/TelaDelegaciaFase1/CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz").stream = load(str("res://Elementos/Sonoros/Vozes/DelegaciaFase1_"+pino+".mp3"))
			get_node("/root/TelaDelegaciaFase1/CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz").play()
			get_node("/root/TelaDelegaciaFase1/CaixaDialogo/Margem/Elementos/BotaoEsquerda").pressed = true
#			print("Fim da fase: ", get_node("/root/TelaDelegaciaFase1").contador)
			if get_node("/root/TelaDelegaciaFase1").contador > 6:
				print("Fim da fase")
				get_node("/root/TelaDelegaciaFase1/CaixaDialogo/Margem/Elementos/BotaoDireita").visible = true
	else:
		set_last(get_global_mouse_position())
	
	update_points(delta)
	update_constrain()
	

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
	pos[pointCount-1] = $Linha/Inicio.rect_position + Vector2(80, 40)
	posPrev[pointCount-1] = $Linha/Inicio.rect_position + Vector2(80, 40)
#	$Linha/Inicio.rect_global_position = posPrev[pointCount-1] = p + Vector2(300, 0)
	
func distancias()->void:
	if sqrt((pos[0].x-pos[pos.size()-1].x)*(pos[0].x-pos[pos.size()-1].x)+(pos[0].y-pos[pos.size()-1].y)*(pos[0].y-pos[pos.size()-1].y) ) < 90:
#		print("AQUI:", sqrt((pos[0].x-pos[pos.size()-1].x)*(pos[0].x-pos[pos.size()-1].x)+(pos[0].y-pos[pos.size()-1].y)*(pos[0].y-pos[pos.size()-1].y) ))
		pass
	else: 
#		print( sqrt((pos[0].x-pos[pos.size()-1].x)*(pos[0].x-pos[pos.size()-1].x)+(pos[0].y-pos[pos.size()-1].y)*(pos[0].y-pos[pos.size()-1].y) ))
		pointCount = get_pointCount(int(sqrt((pos[0].x-pos[pos.size()-1].x)*(pos[0].x-pos[pos.size()-1].x)+(pos[0].y-pos[pos.size()-1].y)*(pos[0].y-pos[pos.size()-1].y) ))/2)
		resize_arrays()
	pass


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
		distancias()
#		set_last(get_global_mouse_position())
		pass
	pass # Replace with function body.


func _on_Area_entrou(area):
#	print("AHHHHHHHHHHHHHHHHHHHHHH: ", area.get_parent().name)
#	print("AHHHHHHHHHHHHHHHHHHHHHH: ", self.get_parent().name)
	if area.get_parent().name == self.get_parent().name:
#		self.endPin = true
		acerto = true
		pino = area.get_parent().name
#		area.get_node("Colidir").queue_free()
#		area.monitoring = false
#		area.monitorable = false
#		self.set_deferred("monitoring", false) 
#		self.set_deferred("monitorable", false) 
	else:
#		self.endPin = false
		acerto = false
	pass # Replace with function body.


func _on_Area_area_saiu(area):
	acerto = false
#	self.endPin = false
	pass # Replace with function body.
