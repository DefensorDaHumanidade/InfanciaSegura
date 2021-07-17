extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pessoa_clicar(evento):
#	if (evento is InputEventMouseButton and evento.pressed) or (evento is InputEventScreenTouch and evento.pressed) and not evento.is_echo():
#		print(evento)
	if evento is InputEventMouseButton or evento is InputEventScreenTouch:
		if not evento.pressed and not evento.is_echo():
			if self.get_node("Numeracao").text == "50":
				return
			$Clicar.play()
			if self.get_node("Numeracao").text == "42":
				for i in get_tree().current_scene.elementoGerados:
					i.get_node("Numeracao").text = "50"
				self.modulate = Color(0.4, 1.0, 0.4, 1.0)
				get_tree().current_scene.acertouPessoa()
			else:
				self.get_node("Numeracao").text = "50"
				get_tree().current_scene.errouPessoa()
				self.modulate = Color(1.0, 0.4, 0.4, 1.0)
	pass # Replace with function body.
