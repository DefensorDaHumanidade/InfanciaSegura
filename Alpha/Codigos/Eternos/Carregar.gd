extends Node

export var dadosLimite = 500
export var tempoLimite = 10000
export (String) var local = "user://arquivo.tres"
export (String) var sitio = "https://infanciasegura.000webhostapp.com/"
export (Resource) var Dados

export (Dictionary) var Pontos = {"TempoMenor": null, "TempoAtual": null, "ErrosMenor": null, "ErrosAtual": null, "RecordeTempo": null, "RecordeErro": null}
export (String) var FaseAtual

#export (Resource) var Dados = preload("res://Codigos/Eternos/Dados.gd")
#var Dados := preload("res://Codigos/Eternos/Dados.gd")
#export var Dados = Registros.new()

func _ready():
	OS.set_window_always_on_top(true) #Da para configurar isso no PROJETO
	Dados = Registros.new()
	var diretorio = Directory.new()
	randomize()
	
	if not diretorio.file_exists(local):
		printerr("Arquivo nao encontrado.")
	else:
#		Essa funcao faz com que os dados registrados sejam sempre carregados na memoria do jogo logo no inicio
		Dados = load(local)
		carregandoVolume()
		carregarIdioma()
	pass

func carregandoVolume():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), Dados.volumeSom)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("CanalVoz"), Dados.volumeVoz)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("CanalMusica"), Dados.volumeMusica)
	if Dados.volumeSom == -40:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -72)
	if Dados.volumeVoz == -40:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("CanalVoz"), -72)
	if Dados.volumeMusica == -40:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("CanalMusica"), -72)
	pass

func carregarIdioma():
	if not Dados.Idioma:
		Dados.Idioma = "pt_BR"
	TranslationServer.set_locale(Dados.Idioma)
	pass

func salvarDados(variaveis):
	if ResourceSaver.save(local, variaveis) == OK:
		print_debug("Dados salvos!")
	pass

func zerarDados():
	var Zerar = Registros.new()
	if ResourceSaver.save(local, Zerar) == OK:
		print("Dados apagados!")
	pass

func trocarCena(novaCena, velhaCena):
	VisualServer.set_default_clear_color(Color("#fffb9b"))
	var carregarCena = ResourceLoader.load_interactive(novaCena)
	
	if carregarCena == null:
		printerr("Cena nao encontrada!")
		return
	if velhaCena == null:
#		printerr("Cena antiga nao encontrada!")
		push_warning("Cena antiga nao encontrada!")
#		velhaCena = get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1) #Isso serve para apagar a ULTIMA CENA na arvore
		velhaCena = get_tree().get_root().get_child(1)
	
	var barra = load("res://Cenas/Objetos/BarraCarregamento.tscn").instance()
	get_tree().get_root().call_deferred('add_child', barra)
	
	var tempoInicial = OS.get_ticks_msec()
	
	while OS.get_ticks_msec() - tempoInicial < tempoLimite:
		var erro = carregarCena.poll()
		if erro == ERR_FILE_EOF:
			var recurso = carregarCena.get_resource()
			get_tree().get_root().call_deferred('add_child', recurso.instance())
			velhaCena.queue_free()
			barra.queue_free()
			break
		elif erro == OK:
			var progresso = float(carregarCena.get_stage())/carregarCena.get_stage_count()
			barra.value = progresso * 100
		else:
			printerr("Erro ao carregar recursos!")
			break
		yield(get_tree(), "idle_frame")
	pass

func atualizarPontuacao(Nivel: String, TempoAtual: int, PontosAtual: int):
	if Nivel in Carregar.Dados.Fase:
		if Carregar.Dados.Fase[Nivel]["TempoMenor"] > TempoAtual:
			Pontos["TempoMenor"] = TempoAtual
			Pontos["TempoAtual"] = TempoAtual
			Pontos["RecordeTempo"] = true
		else: 
			Pontos["TempoMenor"] = Carregar.Dados.Fase[Nivel]["TempoMenor"]
			Pontos["TempoAtual"] = TempoAtual
			Pontos["RecordeTempo"] = false
		if Carregar.Dados.Fase[Nivel]["ErrosMenor"] > PontosAtual:
			Pontos["ErrosMenor"] = PontosAtual
			Pontos["ErrosAtual"] = PontosAtual
			Pontos["RecordeErro"] = true
		else:
			Pontos["ErrosMenor"] = Carregar.Dados.Fase[Nivel]["ErrosMenor"]
			Pontos["ErrosAtual"] = PontosAtual
			Pontos["RecordeErro"] = false
	else:
		Pontos["TempoMenor"] = TempoAtual
		Pontos["TempoAtual"] = TempoAtual
		Pontos["ErrosMenor"] = PontosAtual
		Pontos["ErrosAtual"] = PontosAtual
	Carregar.Dados.Fase[Nivel] = Pontos
	salvarDados(Carregar.Dados)
	pass

func atualizarResposta(IndicePergunta: String, AcertoErrro: String, TempoInicial: String, Descricao: String):
#	if Carregar.Dados.Arquivo.size()+1 > dadosLimite:
#		Carregar.Dados.Arquivo.clear()
#		Carregar.Dados.Arquivo["0"] = {"Conteudo": "Perdido"}
	Carregar.Dados.Arquivo[Carregar.Dados.Arquivo.size()+1] = {"Jogador": Dados.Identificador, "Pergunta": IndicePergunta, "Veredito": AcertoErrro, "TI": TempoInicial, "TF": OS.get_unix_time(), "Resposta": Descricao}
	salvarDados(Carregar.Dados)
	pass

func atualizarTutorial(Nivel: String, Estado: bool):
	Carregar.Dados.Tutorial[Nivel] = Estado
	salvarDados(Carregar.Dados)
	pass

func _acao(estado):
	if estado:
		print_debug("Tela de Configuracoes [ABERTA]")
		get_node("/root/").add_child(load("res://Cenas/Telas/TelaConfiguracoes.tscn").instance())
	else:
		salvarDados(Dados)
		print_debug("Tela de Configuracoes [FECHADA]")
		get_node("/root/Configuracoes").queue_free()
	pass

func comunicarBancoJogador(PHP: String):
	get_node("BancoDados").request(sitio+PHP, ["Content-Type: application/x-www-form-urlencoded"], false, HTTPClient.METHOD_POST,"jogador="+Dados.Identificador+"&genero="+Dados.Genero)

func comunicarBancoRespostas(PHP: String, IndicePergunta: String, AcertoErro: String, TempoInicial: String, Descricao: String):
	atualizarResposta(IndicePergunta, AcertoErro, TempoInicial, Descricao)
	get_node("BancoDados").request(sitio+PHP, ["Content-Type: application/x-www-form-urlencoded"], false, HTTPClient.METHOD_POST,"jogador="+Dados.Identificador+"&pergunta="+IndicePergunta+"&veredito="+AcertoErro+"&TI="+TempoInicial+"&TF="+str(0)+"&resposta="+Descricao)

func _BancoDados(resultado, _codigo, _cabecalho, corpo):
	match resultado:
		HTTPRequest.RESULT_SUCCESS:
			printraw(corpo.get_string_from_utf8())
		HTTPRequest.RESULT_NO_RESPONSE:
			print("Não foi possível se comunicar com o banco de dados!")
		HTTPRequest.RESULT_NO_RESPONSE:
			print("Não foi possível se comunicar com o banco de dados!")
		_:
			print("Não foi possível se comunicar com o banco de dados!")
	pass
