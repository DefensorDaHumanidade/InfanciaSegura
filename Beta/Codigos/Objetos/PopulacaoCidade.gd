extends TextureRect


func _ready():
	pass


func _selecionarPessoa(evento):
	if evento is InputEventScreenTouch:
		if self.texture.get_path() != get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Icone").texture.get_path():
			return
		$Contorno.visible = true
		$Audio.play()
		
		get_node("/root/TelaDelegaciaFase3").RespostaCerta()
	pass
