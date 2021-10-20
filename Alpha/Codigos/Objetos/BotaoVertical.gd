extends TextureButton

export (String) var TrocarTela
export (String) var TrocarMusica

func _ready():
	pass

func _pressionado():
	get_node("Vertical/Icone").modulate = Color(0.5, 0.5, 0.5, 1)
	get_node("Vertical").rect_position.y = get_node("Vertical").rect_position.y + 10
	$Som.play()
	pass

func _solto():
	get_node("Vertical/Icone").modulate = Color(1, 1, 1, 1)
	get_node("Vertical").rect_position.y = get_node("Vertical").rect_position.y - 10
	pass

func _acao():
	if TrocarMusica:
		get_node("/root/Carregar/Musica").stop()
		get_node("/root/Carregar/Musica").stream = load("res://Elementos/Sonoros/Musica/"+TrocarMusica)
		get_node("/root/Carregar/Musica").play()
		Carregar.Dados.Musica = TrocarMusica
	if TrocarTela:
		Carregar.Dados.Cena = "res://Cenas/Telas/"+TrocarTela+".tscn"
		Carregar.salvarDados(Carregar.Dados)
		Carregar.trocarCena(Carregar.Dados.Cena, get_tree().get_current_scene())
	pass

func _ouvirVoz(estado):
	if self.get_parent().get_node_or_null("Caixa/Margem/Texto/Voz"):
		if estado:
			self.get_parent().get_node_or_null("Caixa/Margem/Texto/Voz").play()
		else:
			self.get_parent().get_node_or_null("Caixa/Margem/Texto/Voz").stop()
	pass
