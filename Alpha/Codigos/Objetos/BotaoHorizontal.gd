extends TextureButton

export (String) var TrocarTela
export (String) var TrocarMusica
export (String) var TrocaAlternativa

func _ready():
	pass

func _pressionado():
	if not self.toggle_mode:
		get_node("Horizontal/Icone").modulate = Color(0.5, 0.5, 0.5, 1)
		get_node("Horizontal").rect_position.y = get_node("Horizontal").rect_position.y + 10
		$Som.play()
	pass

func _solto():
	if not self.toggle_mode:
		get_node("Horizontal/Icone").modulate = Color(1, 1, 1, 1)
		get_node("Horizontal").rect_position.y = get_node("Horizontal").rect_position.y - 10
	pass

func _interruptor(estado):
	if estado:
		get_node("Horizontal/Icone").modulate = Color(0.5, 0.5, 0.5, 1)
		get_node("Horizontal").rect_position.y = get_node("Horizontal").rect_position.y + 10
		if not self.name == "Botao":
			TranslationServer.set_locale(self.name)
			Carregar.Dados.Idioma = self.name
			Carregar.salvarDados(Carregar.Dados)
#		$Som.play()
	else:
		get_node("Horizontal/Icone").modulate = Color(1, 1, 1, 1)
		get_node("Horizontal").rect_position.y = get_node("Horizontal").rect_position.y - 10
#		$Som.play()
	pass

func _acao():
	
	if get_parent().get_parent().get_node(".").name == "Fases":
		Carregar.FaseAtual = self.name
	
	if TrocarMusica:
		get_node("/root/Carregar/Musica").stop()
		get_node("/root/Carregar/Musica").stream = load("res://Elementos/Sonoros/Musica/"+TrocarMusica)
		get_node("/root/Carregar/Musica").play()
		Carregar.Dados.Musica = TrocarMusica
	
	if TrocarTela and TrocaAlternativa: #DILEMA
		if Carregar.Dados.Tutorial[Carregar.FaseAtual]:
			Carregar.Dados.Cena = "res://Cenas/Telas/"+TrocaAlternativa+".tscn"
		else:
			Carregar.Dados.Cena = "res://Cenas/Telas/"+TrocarTela+".tscn"
		Carregar.salvarDados(Carregar.Dados)
		Carregar.trocarCena(Carregar.Dados.Cena, get_tree().get_current_scene())
	else:
		if TrocarTela:
			Carregar.Dados.Cena = "res://Cenas/Telas/"+TrocarTela+".tscn"
			Carregar.salvarDados(Carregar.Dados)
			Carregar.trocarCena(Carregar.Dados.Cena, get_tree().get_current_scene())
	
	pass
