extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (String) var ProximaCena
export (bool) var TrocarCena = false

# Called when the node enters the scene tree for the first time.
func _ready():
	atualizandoIcones()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func atualizandoIcones():
	if name != "Hospital" and name != "Escola" and name != "Delegacia" and name != "Internet":
		$ConteinerHorizontal/Icone.visible = false
		$ConteinerHorizontal.alignment = BoxContainer.ALIGN_CENTER
	if name == "Hospital":
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Icones/Maleta.svg")
		self_modulate = Color(0.0, 0.8, 1, 1)
	if name == "Escola":
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Icones/Livro.png")
		self_modulate = Color(1, 1, 0, 1)
	if name == "Delegacia":
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Icones/Sirene.svg")
		self_modulate = Color(1, 0.3, 0.3, 1)
	if name == "Internet":
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Icones/Arroba.svg")
		self_modulate = Color(0, 0.9, 0, 1)
	if name == "Jogar":
		self_modulate = Color(0, 0.8, 0.2, 1)
	get_tree().call_group("BotoesEscola", "trocarCor", Color(1, 1, 0, 1))
	get_tree().call_group("BotoesDelegacia", "trocarCor", Color(1, 0.3, 0.3, 1))
	get_tree().call_group("BotoesInternet", "trocarCor", Color(0, 0.9, 0, 1))
	get_tree().call_group("BotoesHospital", "trocarCor", Color(0.0, 0.8, 1, 1))
	pass


func trocarCor(cor):
	self_modulate = cor
	pass

func _on_BotaoHorizontal_Selecionado():
	print("Botao ", name, " pressionado!")
	$ConteinerHorizontal.modulate = Color(0.5, 0.5, 0.5, 1)
	$ConteinerHorizontal.rect_position.y = $ConteinerHorizontal.rect_position.y + 15
	pass # Replace with function body.


func _on_BotaoHorizontal_Solto():
	print("Botao ", name, " solto!")
	$ConteinerHorizontal.modulate  = Color(1, 1, 1, 1)
	$ConteinerHorizontal.rect_position.y = $ConteinerHorizontal.rect_position.y - 15
	pass # Replace with function body.


func _on_BotaoHorizontal_Comando():
	print("Realizando acao do botao: ", name)
	if TrocarCena:
		if get_tree().change_scene(ProximaCena) == OK:
			Configuracoes.salvar.Cena = ProximaCena
			if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
				print("Cena salva: ", ProximaCena)
		else:
			print("Cena nao encontrada")
#	if name == "Escola":
#		get_tree().change_scene("res://Cenas/TelaSecundaria.tscn")
	pass # Replace with function body.



