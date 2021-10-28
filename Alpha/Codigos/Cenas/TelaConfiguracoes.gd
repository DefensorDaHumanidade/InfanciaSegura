extends Control


func _ready():
	get_node("Menu/Tabelas/ConfigurarJogador/Margem/Lista/Cima/CampoTexto").text = Carregar.Dados.Identificador
	carregarSom()
	carregarIdioma()
	pass

func carregarIdioma():
	if Carregar.Dados.Idioma:
		get_node("Menu/Tabelas/ConfigurarAjustes/Margem/Lista/Idioma/"+Carregar.Dados.Idioma).pressed = true
	pass

func carregarSom():
	get_node("Menu/Tabelas/ConfigurarAjustes/Margem/Lista/Som/ControleDeslizante").value = Carregar.Dados.volumeSom
	get_node("Menu/Tabelas/ConfigurarAjustes/Margem/Lista/Musica/ControleDeslizante").value = Carregar.Dados.volumeMusica
	get_node("Menu/Tabelas/ConfigurarAjustes/Margem/Lista/Voz/ControleDeslizante").value = Carregar.Dados.volumeVoz
	pass

func _volumeSom(valor):
	Carregar.Dados.volumeSom = valor
	if valor == -40:
		valor = -72
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), valor)
#	Carregar.salvarDados(Carregar.Dados)
	pass

func _volumeMusica(valor):
	Carregar.Dados.volumeMusica = valor
	if valor == -40:
		valor = -72
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("CanalMusica"), valor)
#	Carregar.salvarDados(Carregar.Dados)
	pass

func _volumeVoz(valor):
	Carregar.Dados.volumeVoz = valor
	if valor == -40:
		valor = -72
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("CanalVoz"), valor)
#	Carregar.salvarDados(Carregar.Dados)
	pass

func _acaoSair():
	Carregar.salvarDados(Carregar.Dados)
	get_node("/root/Carregar/Botao").pressed = false
	get_node("/root/Configuracoes").queue_free()
	pass

func _selecionarFase():
	get_node("/root/Carregar/Botao").pressed = false
	get_node("/root/Configuracoes").queue_free()
	pass

func _botaoSair():
	print("Saindo do Jogo")
	if OS.get_name() == "HTML5":
		JavaScript.eval("window.close()")
	get_tree().quit()
	pass

func _BotaoApagar():
	print("Apagando dandos em: ")
	for i in range (1, 5):
		yield(get_tree().create_timer(1.0), "timeout")
		print(5-i, " segundos... (Solte para cancelar)")
		if not get_node("Menu/Tabelas/ConfigurarJogador/Margem/Lista/Baixo/BotaoApagar").pressed:
			print("Operacao Cancelada")
			return
	print("Operacao Concluida: Dados Apagados!")
	Carregar.zerarDados()
	if OS.get_name() == "HTML5":
		JavaScript.eval("window.close()")
	get_tree().quit()
	pass
