extends TextureRect

var NomeArquivo = []

func _ready():
	pass

func _selecionarPessoa(evento):
	if evento is InputEventMouseButton or evento is InputEventScreenTouch:
		if not evento.pressed and not evento.is_echo():
			NomeArquivo = self.texture.get_path()
			self.mouse_filter = 2
			$Som.play()
			if int(NomeArquivo[52])==0:
				if int(NomeArquivo[53])<=5:
					self.modulate = Color(0.4, 1.0, 0.4, 1.0)
#					get_parent().mouse_filter = 2   #Eu gostaria de ter feito dessa forma ao inves dos FORs de baixo
					if get_node_or_null("/root/TelaInternetFase1"):
						for i in get_parent().get_node("/root/TelaInternetFase1/Centro/Painel/Lista/Cima").get_children():
							i.mouse_filter = 2
						for i in get_parent().get_node("/root/TelaInternetFase1/Centro/Painel/Lista/Baixo").get_children():
							i.mouse_filter = 2
					if get_node_or_null("/root/TelaInternetFase1"):
						get_node("/root/TelaInternetFase1").enviarBancoDados("1", NomeArquivo.substr(52).rstrip(".png"))
						get_node("/root/TelaInternetFase1").RespostaCerta() #Infelizmente nao parece existir uma metodo na GODOT para verificar se uma funcao existe antes de chama-la
					else:
						get_node("/root/TelaInternetFase1Tutorial").terminarTutorial()
					return
			self.modulate = Color(1.0, 0.4, 0.4, 1.0)
			if get_node_or_null("/root/TelaInternetFase1"):
				get_node("/root/TelaInternetFase1").enviarBancoDados("0", NomeArquivo.substr(52).rstrip(".png"))
				get_node("/root/TelaInternetFase1").RespostaErrada()
	#			get_tree().current_scene.RespostaErrada() #Nao sei porque desse jeito nao esta funcionando (so do jeito de cima)
	pass
