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
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalInternet.tscn", self)
	else:
		if Carregar.FaseAtual == "InternetFase2":
			get_node("Centro/Painel/Elementos/Dados/Texto").get("custom_fonts/font").set_size(36)
			get_node("Centro/Painel/Elementos/Botoes/BotaoAceitar/Horizontal/Texto").text = "BotaoAceitar"
			get_node("Centro/Painel/Elementos/Botoes/BotaoRecusar/Horizontal/Texto").text = "BotaoRecusar"
		else:
			get_node("Centro/Painel/Elementos/Dados/Texto").get("custom_fonts/font").set_size(24)
#			get_node("Centro/Painel/Elementos/Dados/Texto").get("custom_fonts/font").set_spacing(0)
			get_node("Centro/Painel/Elementos/Botoes/BotaoAceitar/Horizontal/Texto").text = "BotaoResponder"
			get_node("Centro/Painel/Elementos/Botoes/BotaoRecusar/Horizontal/Texto").text = "BotaoIgnorar"
		if self.name == "TelaInternetFase2-3Tutorial":
			CarregarElementos("Tela"+Carregar.FaseAtual+"_Tutorial")
			get_node("Painel").atualizarPainel(1, 1)
			get_node("Dialogo/Margem/Vertical/BotaoComando").disabled = true
			get_node("Dialogo/Margem/Vertical/BotaoComando").modulate = Color(0.3, 0.3, 0.3, 1.0)
			get_node("Centro/Painel/Elementos/Dados/Imagem").texture = load("res://Elementos/Fases/Internet/"+Carregar.FaseAtual+"/Pergunta_"+Elementos[Indice]+".png")
			get_node("Centro/Painel/Elementos/Dados/Texto").text = Carregar.FaseAtual+"_Dados_"+Elementos[Indice]
			return
		VisualServer.set_default_clear_color(Color("#74ca8f"))
		tempoInicial = OS.get_unix_time()
		FatorAleatorio.randomize()
		Elementos.shuffle()
		Atualizar()
	pass

func Atualizar():
	Timestamp = OS.get_unix_time()
	get_node("Transicao/Animar").play("TransicaoSaida")
	CarregarElementos(Carregar.FaseAtual+"_Pergunta_"+Elementos[Indice])
	
	get_node("Dialogo/Margem/Vertical/BotaoComando").disabled = true
	get_node("Dialogo/Margem/Vertical/BotaoComando").modulate = Color(0.3, 0.3, 0.3, 1.0)
	
	get_node("Centro/Painel/Elementos/Dados/Imagem").texture = load("res://Elementos/Fases/Internet/"+Carregar.FaseAtual+"/Pergunta_"+Elementos[Indice]+".png")
	get_node("Centro/Painel/Elementos/Dados/Texto").text = Carregar.FaseAtual+"_Dados_"+Elementos[Indice]
	
	get_node("Painel").atualizarPainel(Indice+1, Elementos.size())
	pass

func _RespostaAceitar():
	if int(Elementos[Indice]) <= 5:
		get_node("Centro/Painel/Elementos/Botoes/BotaoAceitar").disabled = true
		get_node("Centro/Painel/Elementos/Botoes/BotaoAceitar").modulate = Color(0.3, 0.3, 0.3, 1.0)
		_RespostaErrada()
	else:
		_RespostaCerta()
	pass

func _RespostaRecusar():
	if int(Elementos[Indice]) > 5:
		get_node("Centro/Painel/Elementos/Botoes/BotaoRecusar").disabled = true
		get_node("Centro/Painel/Elementos/Botoes/BotaoRecusar").modulate = Color(0.3, 0.3, 0.3, 1.0)
		_RespostaErrada()
	else:
		_RespostaCerta()
	pass

func _RespostaCerta():
	if self.name == "TelaInternetFase2-3Tutorial":
		get_node("AudioAcerto").play()
		terminarTutorial()
		return
	get_node("Centro/Painel/Elementos/Botoes/BotaoAceitar").disabled = true
	get_node("Centro/Painel/Elementos/Botoes/BotaoRecusar").disabled = true
	CarregarElementos(Carregar.FaseAtual+"_RespostaCerta_"+Elementos[Indice])
	
	get_node("Dialogo/Margem/Vertical/BotaoComando").modulate = Color(1.0, 1.0, 1.0, 1.0)
	get_node("Dialogo/Margem/Vertical/BotaoComando").disabled = false
#
	get_node("AudioAcerto").play()
	get_node("Centro/Painel/Elementos/Botoes/BotaoAceitar").modulate = Color(0.3, 0.3, 0.3, 1.0)
	get_node("Centro/Painel/Elementos/Botoes/BotaoRecusar").modulate = Color(0.3, 0.3, 0.3, 1.0)
	
	
	enviarBancoDados("1", "Acertou")
	Indice += 1
	pass

func _RespostaErrada():
	if self.name == "TelaInternetFase2-3Tutorial":
		get_node("Camera/Animar").play("TemerCamera")
		get_node("AudioErro").play()
		return
	ErrosCometidos += 1
	CarregarElementos(Carregar.FaseAtual+"_RespostaErrada_"+Elementos[Indice])
	
	get_node("Camera/Animar").play("TemerCamera")
	get_node("AudioErro").play()
	
	enviarBancoDados("0", "Errou")
	pass

func _BotaoProximaPergunta():
	if Indice < Elementos.size():
		get_node("Transicao/Animar").play("TransicaoEntrada")
		get_node("Centro/Painel/Elementos/Botoes/BotaoAceitar").disabled = false
		get_node("Centro/Painel/Elementos/Botoes/BotaoRecusar").disabled = false
		get_node("Centro/Painel/Elementos/Botoes/BotaoAceitar").modulate = Color(1.0, 1.0, 1.0, 1.0)
		get_node("Centro/Painel/Elementos/Botoes/BotaoRecusar").modulate = Color(1.0, 1.0, 1.0, 1.0)
		Atualizar()
	else:
		tempoFinal = OS.get_unix_time()
		Carregar.atualizarPontuacao(Carregar.FaseAtual, tempoFinal-tempoInicial, ErrosCometidos)
		Carregar.Dados.Cena = "res://Cenas/Telas/TelaEncerramento.tscn"
		Carregar.salvarDados(Carregar.Dados)
		Carregar.trocarCena("res://Cenas/Telas/TelaEncerramento.tscn", self)
	pass


func CarregarElementos(Atributos: String):
	if get_node_or_null("Dialogo/Margem/Vertical/Caixa/Margem/Texto"):
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto").CarregarTexto = tr(Atributos)
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto").CarregarVoz = Atributos
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto")._ready()
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto/Imprimir").start()
	pass

func terminarTutorial():
	var Tutorial = CenaTutorial.instance()
	self.add_child(Tutorial)
	get_node("AvisoFimTutorial/CamadaSuperior/Fundo/Linha/Botao").TrocarTela = "TelaPrincipalInternetNivel2-3"
	get_node("Centro/Painel/MaoDireita").visible = false
	get_node("Centro/Painel/MaoEsquerda").visible = false
	get_node("AnimarTutorial").queue_free()
	pass

func enviarBancoDados(AcertoErro: String, Descricao: String):
	Carregar.comunicarBancoRespostas("ArmazenarRespostas.php", Carregar.FaseAtual+"_Pergunta_"+Elementos[Indice], AcertoErro, str(Timestamp), Descricao)
	pass


