extends Control

const CenaIcone = preload("res://Cenas/Objetos/IconeTelefonico.tscn")
const CenaNumero = preload("res://Cenas/Objetos/NumeroTelefonico.tscn")

var FatorAleatorio = RandomNumberGenerator.new()
var ElementosNumeros = ["DisqueLogo1", "DisqueLogo2", "DisqueLogo3", "DisqueLogo4", "DisqueLogo5", "DisqueLogo6", "DisqueLogo7"]
var ElementosIcones = ["IconeLogo1", "IconeLogo2", "IconeLogo3", "IconeLogo4", "IconeLogo5", "IconeLogo6", "IconeLogo7"]
var Indice = 0
var tempoInicial
var tempoFinal
var Timestamp

func _ready():
	if not Carregar.FaseAtual: #VERIFICADOR DE INCONSISTENCIAS
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalDelegacia.tscn", self)
	else:
		VisualServer.set_default_clear_color(Color("#c87a7a"))
		
		tempoInicial = OS.get_unix_time()
		Timestamp = OS.get_unix_time()
		FatorAleatorio.randomize()
#		buscarArquivosPasta("res://Elementos/Fases/Delegacia/DelegaciaFase1/")
		for i in range(0,ElementosIcones.size()):
			gerarNumero("Linha/ColunaInferior", ElementosNumeros[i])
			gerarIcone("Linha/ColunaSuperior", ElementosIcones[i])
		embaralharPosicoes("Linha/ColunaSuperior")
		embaralharPosicoes("Linha/ColunaInferior")
		CarregarElementos(Carregar.FaseAtual+"_Inicio")
	pass

func embaralharPosicoes(Local: String):
	for i in range(0,ElementosIcones.size()):
		get_node(Local).move_child(get_node(Local).get_child(i), FatorAleatorio.randi_range(0,7))
	pass

func respostaCerta(Numero: String):
	Timestamp = OS.get_unix_time()
	Indice += 1
	$ImagemAcerto/Audio.play()
	$ImagemAcerto/Animar.play("Resposta")
	CarregarElementos(Carregar.FaseAtual+"_Logo"+Numero)
	if Indice >= ElementosNumeros.size():
		get_node("Dialogo/Margem/Vertical/BotaoComando").visible = true
	pass

func respostaErrada():
	$Camera/Animar.play("TemerCamera")
	$ImagemErro/Animar.play("Resposta")
	$ImagemErro/Audio.play()
	pass

func gerarIcone(Local: String, Elemento):
	var icone = CenaIcone.instance()
	icone.texture = load("res://Elementos/Fases/Delegacia/DelegaciaFase1/" + str(Elemento) + ".png")
	get_node(Local).add_child(icone)
	pass

func gerarNumero(Local: String, Elemento):
	var numero = CenaNumero.instance()
	numero.texture = load("res://Elementos/Fases/Delegacia/DelegaciaFase1/" + str(Elemento) + ".png")
	get_node(Local).add_child(numero)
	pass

func buscarArquivosPasta(Caminho: String):
	var Pasta = Directory.new()
	Pasta.open(Caminho)
	Pasta.list_dir_begin(true)

	var Arquivo = Pasta.get_next()
	while Arquivo != '':
		if not Arquivo.ends_with(".import"):
			if Arquivo.begins_with("Disque"):
				ElementosNumeros += [Arquivo.rstrip(".png")]
				gerarNumero("Linha/ColunaInferior", Arquivo.rstrip(".png"))
			else:
				ElementosIcones += [Arquivo.rstrip(".png")]
				gerarIcone("Linha/ColunaSuperior", Arquivo.rstrip(".png"))
		Arquivo = Pasta.get_next()
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
	Carregar.atualizarPontuacao(Carregar.FaseAtual, tempoFinal-tempoInicial, 0)
	Carregar.Dados.Cena = "res://Cenas/Telas/TelaEncerramento.tscn"
	Carregar.salvarDados(Carregar.Dados)
	Carregar.trocarCena("res://Cenas/Telas/TelaEncerramento.tscn", self)
	pass

func _terminarNivel():
	terminarJogo()
	pass

func enviarBancoDados(AcertoErro: String, IdentificadorPergunta: String, Descricao: String):
	Carregar.comunicarBancoRespostas("ArmazenarRespostas.php", IdentificadorPergunta, AcertoErro, str(Timestamp), Descricao)
	pass
