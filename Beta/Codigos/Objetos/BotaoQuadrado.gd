extends TextureButton

func _ready():
	pass

func _pressionado():
	if not self.toggle_mode:
		get_node("Icone").modulate = Color(0.5, 0.5, 0.5, 1)
		get_node("Icone").rect_position.y = $Icone.rect_position.y + 10
		$Som.play()
	pass

func _solto():
	if not self.toggle_mode:
		get_node("Icone").modulate = Color(1, 1, 1, 1)
		get_node("Icone").rect_position.y = get_node("Icone").rect_position.y - 10
	pass

func _interruptor(estado):
	if estado:
		get_node("Icone").modulate = Color(0.5, 0.5, 0.5, 1)
		get_node("Icone").rect_position.y = $Icone.rect_position.y + 10
		$Som.play()
	else:
		get_node("Icone").modulate = Color(1, 1, 1, 1)
		get_node("Icone").rect_position.y = get_node("Icone").rect_position.y - 10
		$Som.play()
	pass
