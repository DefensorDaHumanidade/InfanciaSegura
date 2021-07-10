extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (String) var ProximaCena
export (String) var TocarMusica
export (bool) var TrocarCena = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print($ConteinerVertical/Texto.text)
	if $ConteinerVertical/Texto.text == "BotaoVoz":
		$ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/Voz.svg")
		$ConteinerVertical/Icone.flip_h = false
	if $ConteinerVertical/Texto.text == "BotaoIr":
		$ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/SetaHorizontal.svg")
		$ConteinerVertical/Icone.self_modulate = Color(0, 0.9, 0.1, 1)
		$ConteinerVertical/Icone.flip_h = false
	if $ConteinerVertical/Texto.text == "BotaoMenu" or $ConteinerVertical/Texto.text == "BotaoVoltar":
		$ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/SetaHorizontal.svg")
		$ConteinerVertical/Icone.modulate = Color(0, 0.9, 0.9, 1)
		$ConteinerVertical/Icone.flip_h = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BotaoVertical_Selecionado():
#	if not controle_auxiliar:
	print("Botao ", name, " pressionado!")
	if name != "BotaoEsquerda":
		$Som.play()
	$ConteinerVertical.modulate = Color(0.5, 0.5, 0.5, 1)
	$ConteinerVertical.rect_position.y = $ConteinerVertical.rect_position.y + 15
	pass # Replace with function body.


func _on_BotaoVertical_Solto():
#	if not toggle_mode:
	print("Botao ", name, " solto!")
	$ConteinerVertical.modulate = Color(1, 1, 1, 1)
	$ConteinerVertical.rect_position.y = $ConteinerVertical.rect_position.y - 15
	pass # Replace with function body.


func _on_BotaoVertical_Comando():
	print("Realizando acao do botao: ", name)
	if TrocarCena:
		if get_tree().change_scene(ProximaCena) == OK:
			Configuracoes.salvar.Cena = ProximaCena
			Configuracoes.salvar.NomeMusica = TocarMusica
			Configuracoes.gerenciarMusicas()
			if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
				print("Cena salva: ", ProximaCena)
		else:
			print("Cena nao encontrada")
	pass # Replace with function body.


func _on_BotaoVertical_Modo(estado_botao):
	print("Estado do botao ", name, ": ", estado_botao)
	if estado_botao:
		print("Botao ", name, " pressionado!")
		get_parent().get_node("Campo/Margem/Texto/Voz").play()
#		$ConteinerVertical.modulate = Color(0.5, 0.5, 0.5, 1)
#		$ConteinerVertical.rect_position.y = $ConteinerVertical.rect_position.y + 15
	else:
		print("Botao ", name, " solto!")
		get_parent().get_node("Campo/Margem/Texto/Voz").stop()
#		$ConteinerVertical.modulate = Color(1, 1, 1, 1)
#		$ConteinerVertical.rect_position.y = $ConteinerVertical.rect_position.y - 15
	pass # Replace with function body.


