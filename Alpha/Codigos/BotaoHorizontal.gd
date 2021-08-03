extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (String) var ProximaCena
export (String) var Tutorial
export (String) var TocarMusica
export (bool) var TrocarCena = false

# Called when the node enters the scene tree for the first time.
func _ready():
	atualizandoIcones()
	if TranslationServer.get_locale() == "pt_BR" or TranslationServer.get_locale() == "pt":
		if name == "BotaoBrasil":
			self.pressed = true
	if TranslationServer.get_locale() == "es_ES":
		if name == "BotaoEspanha":
			self.pressed = true
	if TranslationServer.get_locale() == "en_GB":
		if name == "BotaoInglaterra":
			self.pressed = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func atualizandoIcones():
	if name != "Hospital" and name != "Escola" and name != "Delegacia" and name != "Internet" and name != "BotaoBrasil" and name != "BotaoEspanha" and name != "BotaoInglaterra" and name != "BotaoSair" and name != "BotaoAceitar" and name != "BotaoRecusar": 
		$ConteinerHorizontal/Icone.visible = false
		$ConteinerHorizontal.alignment = BoxContainer.ALIGN_CENTER
	if name == "BotaoHospital":
		$ConteinerHorizontal/Icone.visible = true
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Icones/Maleta.svg")
		self_modulate = Color(0.0, 0.8, 1, 1)
	if name == "BotaoEscola":
		$ConteinerHorizontal/Icone.visible = true
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Icones/Livro.png")
		self_modulate = Color(1, 1, 0, 1)
	if name == "BotaoInternet":
		$ConteinerHorizontal/Icone.visible = true
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Icones/Arroba.svg")
		self_modulate = Color(0, 0.9, 0, 1)
	if name == "BotaoDelegacia":
		$ConteinerHorizontal/Icone.visible = true
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Icones/Sirene.svg")
		self_modulate = Color(1, 0.3, 0.3, 1)
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
	if name == "Menino":
		self_modulate = Color(0, 0.9, 0.9, 1)
	if name == "Menina":
		self_modulate = Color(0, 0.9, 0.9, 1)
	if name == "BotaoBrasil":
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Bandeiras/Brasil.svg")
		self_modulate = Color(0, 0.9, 0.9, 1)
	if name == "BotaoEspanha":
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Bandeiras/Espanha.svg")
		self_modulate = Color(0, 0.9, 0.9, 1)
	if name == "BotaoInglaterra":
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Bandeiras/Inglaterra.png")
		self_modulate = Color(0, 0.9, 0.9, 1)
	if name == "BotaoSair":
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Icones/Sair.svg")
		self_modulate = Color(0, 0.9, 0.9, 1)
	if name == "BotaoAceitar":
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Icones/Mao.svg")
		self_modulate = Color(0, 0.9, 0, 1)
	if name == "BotaoRecusar":
		$ConteinerHorizontal/Icone.texture = load("res://Elementos/Visuais/Icones/Mao.svg")
		$ConteinerHorizontal/Icone.flip_v = true
		self_modulate = Color(1, 0.3, 0.3, 1)
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
	$Som.play()
	$ConteinerHorizontal.modulate = Color(0.5, 0.5, 0.5, 1)
	$ConteinerHorizontal.rect_position.y = $ConteinerHorizontal.rect_position.y + 15
	if name == "Menino":
		Configuracoes.salvar.Genero = "Menino"
	if name == "Menina":
		Configuracoes.salvar.Genero = "Menina"
	pass # Replace with function body.


func _on_BotaoHorizontal_Solto():
	print("Botao ", name, " solto!")
	$ConteinerHorizontal.modulate  = Color(1, 1, 1, 1)
	$ConteinerHorizontal.rect_position.y = $ConteinerHorizontal.rect_position.y - 15
	pass # Replace with function body.


func _on_BotaoHorizontal_Comando():
	print("Realizando acao do botao: ", name)
	if name == "BotaoSair":
		Configuracoes.salvar.Cena = ""
		Configuracoes.salvar.Musica = ""
		Configuracoes.salvar.Identificador = ""
		if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
			print("Saindo, muito obrigado por jogar!")
		get_tree().change_scene("res://Cenas/TelaCarregamento.tscn")
		get_node("/root/Configuracoes/CantoSuperiorDireito/BotaoConfiguracoes").pressed = false
#		get_tree().quit()
	if TrocarCena:
		if get_parent().get_node_or_null("Tutorial") != null:
			if not get_parent().get_node("Tutorial").pressed:
				if get_tree().change_scene(Tutorial) == OK:
					Configuracoes.salvar.Cena = Tutorial
					Configuracoes.salvar.NomeMusica = TocarMusica
					Configuracoes.gerenciarMusicas()
					if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
						print("Cena salva: ", Tutorial)
			else:
				get_node("/root/Configuracoes/CantoSuperiorDireito/BotaoConfiguracoes").pressed = false
				Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarJogadores.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&tela="+ProximaCena)
				if get_tree().change_scene(ProximaCena) == OK:
					Configuracoes.salvar.Cena = ProximaCena
					Configuracoes.salvar.NomeMusica = TocarMusica
					Configuracoes.gerenciarMusicas()
					if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
						print("Cena salva: ", ProximaCena)
		else:
			get_node("/root/Configuracoes/CantoSuperiorDireito/BotaoConfiguracoes").pressed = false
			Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarJogadores.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&tela="+ProximaCena)
			if get_tree().change_scene(ProximaCena) == OK:
				Configuracoes.salvar.Cena = ProximaCena
				Configuracoes.salvar.NomeMusica = TocarMusica
				Configuracoes.gerenciarMusicas()
				if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
					print("Cena salva: ", ProximaCena)
	else:
		print("Cena nao encontrada")
		if get_tree().get_current_scene().get_name() == "TelaCadastro":
			get_tree().get_current_scene().get_node("Personagem").texture = load("res://Elementos/Visuais/Personagens/Menino/Menino-10.svg")
			get_tree().get_current_scene().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto").bbcode_text = tr("TelaCadastro_2")
			get_tree().get_current_scene().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto").percent_visible = 0
			get_tree().get_current_scene().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto").taxaExposicao = 0
			get_tree().get_current_scene().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto").set_process(true)
			get_tree().get_current_scene().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz").stream = load(str("res://Elementos/Sonoros/Vozes/TelaCadastro_2.mp3"))
			get_tree().get_current_scene().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz").play()
			get_tree().get_current_scene().get_node("CaixaDialogo/Margem/Elementos/BotaoEsquerda").pressed = true
			pass
#	if name == "Escola":
#		get_tree().change_scene("res://Cenas/TelaSecundaria.tscn")
	

	pass # Replace with function body.





func _on_BotaoHorizontal_estado(estado):
	if self.pressed:
		if name == "BotaoBrasil":
			TranslationServer.set_locale("pt_BR")
#			get_parent().get_node("BotaoBrasil").pressed = true
			get_parent().get_node("BotaoEspanha").pressed = false
			get_parent().get_node("BotaoInglaterra").pressed = false
		if name == "BotaoEspanha":
			TranslationServer.set_locale("es_ES")
			get_parent().get_node("BotaoBrasil").pressed = false
#			get_parent().get_node("BotaoEspanha").pressed = true
			get_parent().get_node("BotaoInglaterra").pressed = false
		if name == "BotaoInglaterra":
			TranslationServer.set_locale("en_GB")
#			get_parent().get_node("BotaoInglaterra").pressed = true
			get_parent().get_node("BotaoEspanha").pressed = false
			get_parent().get_node("BotaoBrasil").pressed = false
#	print("MUHAHAHHAHAHAHAHHAHAHAHHAHAHAHHAHA ",name)
	var condicao = true
	if name == "BotaoRecusar":
		condicao = false
#	if name == "BotaoAceitar":
#		print("okkkkkk")
	if get_tree().current_scene.name == "TelaInternetFase2":
		if get_tree().current_scene.verificarResposta() == condicao:
			print("Acertou")
			get_tree().current_scene.acertouResposta()
		else:
			print("Errou")
			modulate = Color(0.3, 0.3, 0.3, 1)
			toggle_mode = false
			pressed = false
			disabled = true
			get_tree().current_scene.errouResposta()
	if get_tree().current_scene.name == "TelaInternetFase3":
		if get_tree().current_scene.verificarResposta() == condicao:
			print("Acertou")
			get_tree().current_scene.acertouResposta()
		else:
			print("Errou")
			modulate = Color(0.3, 0.3, 0.3, 1)
			toggle_mode = false
			pressed = false
			disabled = true
			get_tree().current_scene.errouResposta()
	pass # Replace with function body.
