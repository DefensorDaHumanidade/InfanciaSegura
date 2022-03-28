extends Control

func _ready():
	VisualServer.set_default_clear_color(Color("#008390"))
	
	imprimindoVersao()
	
	if get_node_or_null("/root/Carregar/Botao"):
		get_node("/root/Carregar/Botao").hide()
	pass

func imprimindoVersao():
	var auxiliar = tr("TextoVersao")
	get_node("TextoVersao").text = auxiliar.format({"str": ProjectSettings.get("application/config/versao")})
	pass

func _Toque(evento):
	if evento is InputEventScreenTouch:
		$AnimarTransicao.play("Transicao")
	pass

func _FimTransicao(_animacao):
	if get_node_or_null("/root/Carregar/Botao"):
		get_node("/root/Carregar/Botao").show()
	
	if not Carregar.Dados.Cena:
		Carregar.Dados.Cena = "res://Cenas/Telas/TelaCadastro.tscn"
		Carregar.salvarDados(Carregar.Dados)
	
	if Carregar.Dados.Musica:
		get_node("/root/Carregar/Musica").stop()
		get_node("/root/Carregar/Musica").stream = load("res://Elementos/Sonoros/Musica/"+Carregar.Dados.Musica)
		get_node("/root/Carregar/Musica").play()
	Carregar.trocarCena(Carregar.Dados.Cena, get_tree().get_current_scene())
	pass
