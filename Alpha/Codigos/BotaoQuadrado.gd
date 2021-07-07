extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	atualizandoIcones()
	pass # Replace with function body.


func atualizandoIcones():
	if name == "BotaoFecharConfiguracoes":
		$Icone.texture = load("res://Elementos/Visuais/Icones/X.png")
		$Icone.self_modulate = Color(0.8, 0, 0, 1)
		self_modulate = Color(1, 0.3, 0.3, 1)
		pass
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_BotaoQuadrado_Selecionado():
	print("Botao ", name, " pressionado!")
	$Som.play()
	$Icone.modulate = Color(0.5, 0.5, 0.5, 1)
	$Icone.rect_position.y = $Icone.rect_position.y + 15
	pass # Replace with function body.


func _on_BotaoQuadrado_Solto():
	print("Botao ", name, " solto!")
	$Icone.modulate = Color(1, 1, 1, 1)
	$Icone.rect_position.y = $Icone.rect_position.y - 15
	pass # Replace with function body.


func _on_BotaoQuadrado_Comando():
	print("Realizando acao do botao: ", name)
	if name == "BotaoFecharConfiguracoes":
		print("Fechando as configuracoes")
		get_node("/root/Configuracoes/CantoSuperiorDireito/BotaoConfiguracoes").pressed = false
		get_node("/root/TelaAjustes").queue_free()
	pass # Replace with function body.


func _on_BotaoQuadrado_Modo(estado_botao):
	if name == "BotaoConfiguracoes":
		print("Tela de Ajustes: ", estado_botao)
		if estado_botao:
			get_node("/root/").add_child(load("res://Cenas/TelaAjustes.tscn").instance())
	#		get_parent().get_parent().get_parent().add_child(instacedScene)
		else:
			if get_node("/root/TelaAjustes"): #ESSA LINHA ESTA ERRADA E NAO CORRIGE O PROBLEMA 
				get_node("/root/Configuracoes/CantoSuperiorDireito/BotaoConfiguracoes").pressed = false
				get_node("/root/TelaAjustes").queue_free()
	pass # Replace with function body.
