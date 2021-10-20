extends Control

const CenaTutorial = preload("res://Cenas/Objetos/AvisoFimTutorial.tscn")

var FatorAleatorio = RandomNumberGenerator.new()
var Elementos = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10"]
var Indice = 0
var ErrosCometidos = 0
var tempoInicial
var tempoFinal
var Timestamp

func _ready():
	if not Carregar.FaseAtual: #VERIFICADOR DE INCONSISTENCIAS
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalEscola.tscn", self)
	else:
		print("Tutorial: ", Carregar.Dados.Tutorial[Carregar.FaseAtual])
		VisualServer.set_default_clear_color(Color("#b4b46e"))
		
		tempoInicial = OS.get_unix_time()
		FatorAleatorio.randomize()
		Elementos.shuffle()
		Atualizar()
	pass

func Atualizar():
	Timestamp = OS.get_unix_time()
	get_node("Transicao/Animar").play("TransicaoSaida")
	if self.name == "TelaPrincipalEscolaNivelTutorial":
		CarregarElementos("Tela"+Carregar.FaseAtual+"_Tutorial")
	else:
		CarregarElementos(Carregar.FaseAtual+"_Pergunta_"+Elementos[Indice])
	
	get_node("Dialogo/Margem/Vertical/BotaoComando").disabled = true
	get_node("Dialogo/Margem/Vertical/BotaoComando").modulate = Color(0.3, 0.3, 0.3, 1.0)
	
	get_node("DisposicaoLateral").move_child(get_node("DisposicaoLateral/ImagemCerta"), FatorAleatorio.randi_range(0,1))
	get_node("DisposicaoLateral/ImagemErrada").self_modulate = Color(1.0, 1.0, 1.0, 1.0)
	
	get_node("DisposicaoLateral/ImagemCerta").texture_normal = load("res://Elementos/Fases/Escola/"+Carregar.FaseAtual+"/Pergunta_"+Elementos[Indice]+"-Certo.png")
	get_node("DisposicaoLateral/ImagemErrada").texture_normal = load("res://Elementos/Fases/Escola/"+Carregar.FaseAtual+"/Pergunta_"+Elementos[Indice]+"-Errado.png")
	
	get_node("Painel").atualizarPainel(Indice+1, Elementos.size())
	pass

func _RespostaCerta():
	if self.name == "TelaPrincipalEscolaNivelTutorial":
		get_node("DisposicaoLateral/ImagemCerta/Som").play()
		get_node("DisposicaoLateral/ImagemCerta/Resposta").visible = true
		get_node("DisposicaoLateral/ImagemCerta/Mao").queue_free()
		get_node("AnimarTutorial").queue_free()
		var Tutorial = CenaTutorial.instance()
		self.add_child(Tutorial)
		get_node("AvisoFimTutorial/CamadaSuperior/Fundo/Linha/Botao").TrocarTela = "TelaPrincipalEscolaNivel"
		return
	
	get_node("DisposicaoLateral/ImagemCerta").disabled = true
	get_node("DisposicaoLateral/ImagemErrada").disabled = true
	CarregarElementos(Carregar.FaseAtual+"_RespostaCerta_"+Elementos[Indice])
	
	get_node("Dialogo/Margem/Vertical/BotaoComando").modulate = Color(1.0, 1.0, 1.0, 1.0)
	get_node("Dialogo/Margem/Vertical/BotaoComando").disabled = false
	
	get_node("DisposicaoLateral/ImagemCerta/Som").play()
	get_node("DisposicaoLateral/ImagemCerta/Resposta").visible = true
	
	enviarBancoDados("1", "Acertou")
	Indice += 1
	pass

func _RespostaErrada():
	if self.name == "TelaPrincipalEscolaNivelTutorial":
		get_node("DisposicaoLateral/ImagemErrada").self_modulate = Color(0.3, 0.3, 0.3, 1.0)
		get_node("DisposicaoLateral/ImagemErrada/Resposta").visible = true
		get_node("Camera/Animar").play("TemerCamera")
		get_node("DisposicaoLateral/ImagemErrada/Som").play()
		return
	
	ErrosCometidos += 1
	get_node("DisposicaoLateral/ImagemErrada").disabled = true
	CarregarElementos(Carregar.FaseAtual+"_RespostaErrada_"+Elementos[Indice])
	
	get_node("DisposicaoLateral/ImagemErrada").self_modulate = Color(0.3, 0.3, 0.3, 1.0)
	get_node("DisposicaoLateral/ImagemErrada/Resposta").visible = true
	
	get_node("Camera/Animar").play("TemerCamera")
	get_node("DisposicaoLateral/ImagemErrada/Som").play()
	
	enviarBancoDados("0", "Errou")
	pass

func _BotaoProximaPergunta():
	if self.name == "TelaPrincipalEscolaNivelTutorial":
		return
	if Indice < Elementos.size():
		get_node("Transicao/Animar").play("TransicaoEntrada")
		get_node("DisposicaoLateral/ImagemCerta").disabled = false
		get_node("DisposicaoLateral/ImagemErrada").disabled = false
		get_node("DisposicaoLateral/ImagemCerta/Resposta").visible = false
		get_node("DisposicaoLateral/ImagemErrada/Resposta").visible = false
		Atualizar()
	else:
		terminarJogo()
	pass

func CarregarElementos(Atributos: String):
	if get_node_or_null("Dialogo/Margem/Vertical/Caixa/Margem/Texto"):
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto").CarregarTexto = tr(Atributos)
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto").CarregarVoz = Atributos
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto")._ready()
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto/Imprimir").start()
	pass

func terminarJogo():
	tempoFinal = OS.get_unix_time()
	Carregar.atualizarPontuacao(Carregar.FaseAtual, tempoFinal-tempoInicial, ErrosCometidos)
	Carregar.Dados.Cena = "res://Cenas/Telas/TelaEncerramento.tscn"
	Carregar.salvarDados(Carregar.Dados)
	Carregar.trocarCena("res://Cenas/Telas/TelaEncerramento.tscn", self)
	pass

func _tutorialInicioFim(nome):
	if nome == "TutorialInicio":
		$AnimarTutorial.play("TutorialMeio")
	pass

func enviarBancoDados(AcertoErro: String, Descricao: String):
	Carregar.comunicarBancoRespostas("ArmazenarRespostas.php", Carregar.FaseAtual+"_Pergunta_"+Elementos[Indice], AcertoErro, str(Timestamp), Descricao)
	pass
