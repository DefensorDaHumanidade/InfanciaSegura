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
	if $ConteinerVertical/Texto.text == "BotaoTras":
		$ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/Frente.svg")
	if $ConteinerVertical/Texto.text == "BotaoFrente":
		$ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/Tras.svg")
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
	if name == "BotaoDireita" and get_tree().current_scene.name == "TelaEscolaFase1":
		if get_tree().current_scene.indicePergunta < get_tree().current_scene.PerguntasFase1.size()-1:
			get_tree().current_scene.indicePergunta += 1
			get_tree().current_scene.atualizarPergunta()
		else:
			print("Acabaram as perguntas")
			Configuracoes.salvar.Cena = "res://Cenas/TelaEscolaEncerramentoFase1.tscn"
			if get_tree().change_scene("res://Cenas/TelaEscolaEncerramentoFase1.tscn") == OK:
				if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
					print("Cena salva: ", Configuracoes.salvar.Cena)
	if name == "BotaoDireita" and get_tree().current_scene.name == "TelaEscolaFase2":
		if get_tree().current_scene.indicePergunta < get_tree().current_scene.PerguntasFase2.size()-1:
			get_tree().current_scene.indicePergunta += 1
			get_tree().current_scene.atualizarPergunta()
		else:
			print("Acabaram as perguntas")
			Configuracoes.salvar.Cena = "res://Cenas/TelaEscolaEncerramentoFase2.tscn"
			if get_tree().change_scene("res://Cenas/TelaEscolaEncerramentoFase2.tscn") == OK:
				if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
					print("Cena salva: ", Configuracoes.salvar.Cena)
	if name == "BotaoDireita" and get_tree().current_scene.name == "TelaEscolaFase3":
		if get_tree().current_scene.indicePergunta < get_tree().current_scene.PerguntasFase3.size()-1:
			get_tree().current_scene.indicePergunta += 1
			get_tree().current_scene.atualizarPergunta()
		else:
			print("Acabaram as perguntas")
			Configuracoes.salvar.Cena = "res://Cenas/TelaEscolaEncerramentoFase3.tscn"
			if get_tree().change_scene("res://Cenas/TelaEscolaEncerramentoFase3.tscn") == OK:
				if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
					print("Cena salva: ", Configuracoes.salvar.Cena)


	if name == "BotaoDireita" and get_tree().current_scene.name == "TelaInternetFase2":
		if get_tree().current_scene.indicePerguntar < get_tree().current_scene.PedidosFase2.size()-1:
			get_tree().current_scene.indicePerguntar += 1
#			get_tree().current_scene.get_node("Tela/Coluna/ListaBotoes/BotaoAceitar").modulate = Color(1, 1, 1, 1)
#			get_tree().current_scene.get_node("Tela/Coluna/ListaBotoes/BotaoAceitar").pressed = false
#			get_tree().current_scene.get_node("Tela/Coluna/ListaBotoes/BotaoAceitar").disabled = false
#
#			get_tree().current_scene.get_node("Tela/Coluna/ListaBotoes/BotaoRecusar").modulate = Color(1, 1, 1, 1)
#			get_tree().current_scene.get_node("Tela/Coluna/ListaBotoes/BotaoRecusar").pressed = false
#			get_tree().current_scene.get_node("Tela/Coluna/ListaBotoes/BotaoRecusar").disabled = false

			get_tree().current_scene.proximaPergunta()
		else:
			print("Acabaram as perguntas")
			Configuracoes.salvar.Cena = "res://Cenas/TelaInternetEncerramentoFase2.tscn"
			if get_tree().change_scene("res://Cenas/TelaInternetEncerramentoFase2.tscn") == OK:
				if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
					print("Cena salva: ", Configuracoes.salvar.Cena)
	if name == "BotaoDireita" and get_tree().current_scene.name == "TelaInternetFase3":
		if get_tree().current_scene.indicePerguntar < get_tree().current_scene.PedidosFase3.size()-1:
			get_tree().current_scene.indicePerguntar += 1
			get_tree().current_scene.proximaPergunta()
		else:
			print("Acabaram as perguntas")
			Configuracoes.salvar.Cena = "res://Cenas/TelaInternetEncerramentoFase3.tscn"
			if get_tree().change_scene("res://Cenas/TelaInternetEncerramentoFase3.tscn") == OK:
				if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
					print("Cena salva: ", Configuracoes.salvar.Cena)
	if name == "BotaoDireita" and get_tree().current_scene.name == "TelaInternetFase1":
		if get_tree().current_scene.indicePergunta < get_tree().current_scene.elementosCertos.size():
#			get_tree().current_scene.indicePerguntar += 1
			get_tree().current_scene.carregarColunas()
		else:
			print("Acabaram as perguntas")
			Configuracoes.salvar.Cena = "res://Cenas/TelaInternetEncerramentoFase1.tscn"
			if get_tree().change_scene("res://Cenas/TelaInternetEncerramentoFase1.tscn") == OK:
				if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
					print("Cena salva: ", Configuracoes.salvar.Cena)
	pass # Replace with function body.


func _on_BotaoVertical_Modo(estado_botao):
	print("Estado do botao ", name, ": ", estado_botao)
	if name == "BotaoEsquerda":
		if estado_botao:
			$ConteinerVertical.modulate = Color(0.5, 0.5, 0.5, 1)
			$ConteinerVertical.rect_position.y = $ConteinerVertical.rect_position.y + 15
	#		print("Botao ", name, " pressionado!")
			get_parent().get_node("Campo/Margem/Texto/Voz").play()
	#		$ConteinerVertical.modulate = Color(0.5, 0.5, 0.5, 1)
	#		$ConteinerVertical.rect_position.y = $ConteinerVertical.rect_position.y + 15
		else:
			$ConteinerVertical.modulate = Color(1, 1, 1, 1)
			$ConteinerVertical.rect_position.y = $ConteinerVertical.rect_position.y - 15
	#		print("Botao ", name, " solto!")
			get_parent().get_node("Campo/Margem/Texto/Voz").stop()
	#		$ConteinerVertical.modulate = Color(1, 1, 1, 1)
	#		$ConteinerVertical.rect_position.y = $ConteinerVertical.rect_position.y - 15
	if name == "BotaoDireita":
		if estado_botao:
			
			if get_tree().current_scene.name == "TelaHospitalFase1Generico":
				get_node("/root/TelaHospitalFase1Generico/Centro/Cena").visible = false
				get_node("/root/TelaHospitalFase1Generico/Centro/Tras").visible = true
				$ConteinerVertical/Texto.text = "BotaoFrente"
				$ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/Tras.svg")
	#			$ConteinerVertical/Texto.get("custom_fonts/font").size = 50
			if get_tree().current_scene.name == "TelaHospitalFase2Generico":
				get_node("/root/TelaHospitalFase2Generico/Centro/Cena").visible = false
				get_node("/root/TelaHospitalFase2Generico/Centro/Tras").visible = true
				$ConteinerVertical/Texto.text = "BotaoFrente"
				$ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/Tras.svg")

		else:
			if get_tree().current_scene.name == "TelaHospitalFase1Generico":
				get_node("/root/TelaHospitalFase1Generico/Centro/Cena").visible = true
				get_node("/root/TelaHospitalFase1Generico/Centro/Tras").visible = false
				$ConteinerVertical/Texto.text = "BotaoTras"
				$ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/Frente.svg")
	#			$ConteinerVertical/Texto.get("custom_fonts/font").size = 60
			if get_tree().current_scene.name == "TelaHospitalFase2Generico":
				get_node("/root/TelaHospitalFase2Generico/Centro/Cena").visible = true
				get_node("/root/TelaHospitalFase2Generico/Centro/Tras").visible = false
				$ConteinerVertical/Texto.text = "BotaoFrente"
				$ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/Tras.svg")
	pass # Replace with function body.


