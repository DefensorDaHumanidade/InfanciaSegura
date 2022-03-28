extends Control

func _ready():
	if Carregar.Dados.Identificador:
		get_node("Centro/Horizontal/CampoTexto").text =  Carregar.Dados.Identificador
	elif get_node_or_null("Centro/Horizontal/Jogar"):
		get_node("Centro/Horizontal/Jogar").modulate = Color(0.5, 0.5, 0.5, 1.0)
		get_node("Centro/Horizontal/Jogar").disabled = true
	if OS.get_name() == "HTML5":
		get_node("Centro/Horizontal/Jogar").modulate = Color(1.0, 1.0, 1.0, 1.0)
		get_node("Centro/Horizontal/Jogar").disabled = false
	pass

func _TextoInserido():
	if get_node_or_null("Centro/Horizontal/CampoTexto"):
		print("Identificador do jogador: ", get_node("Centro/Horizontal/CampoTexto").text)
		Carregar.Dados.Identificador = get_node("Centro/Horizontal/CampoTexto").text
	if not get_node("Centro/Horizontal/CampoTexto").text == "":
		get_node("Centro/Horizontal/Jogar").modulate = Color(1.0, 1.0, 1.0, 1.0)
		get_node("Centro/Horizontal/Jogar").disabled = false
	else:
		get_node("Centro/Horizontal/Jogar").modulate = Color(0.5, 0.5, 0.5, 1.0)
		get_node("Centro/Horizontal/Jogar").disabled = true
	pass

func _TextoInicial(texto):
	if not texto == "":
		get_node("Centro/Horizontal/Jogar").modulate = Color(1.0, 1.0, 1.0, 1.0)
		get_node("Centro/Horizontal/Jogar").disabled = false
	else:
		get_node("Centro/Horizontal/Jogar").modulate = Color(0.5, 0.5, 0.5, 1.0)
		get_node("Centro/Horizontal/Jogar").disabled = true
	pass

func _trocarCena():
	if not get_node("Centro/Horizontal/CampoTexto").text == "":
		Carregar.Dados.Cena = "res://Cenas/Telas/TelaGenero.tscn"
		Carregar.salvarDados(Carregar.Dados)
		Carregar.trocarCena("res://Cenas/Telas/TelaGenero.tscn", get_tree().get_current_scene())
	pass


func _TextoDigitado(novo_texto):
	get_node("Centro/Horizontal/Jogar").modulate = Color(1.0, 1.0, 1.0, 1.0)
	get_node("Centro/Horizontal/Jogar").disabled = false
	pass

