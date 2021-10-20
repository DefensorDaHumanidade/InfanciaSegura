extends Control

export (int) var QuantidadePecas #NOTA: O codigo nao trabalha com valor maiores que 20, pois foi esse o tamanho maximo defino na cena QuebraCabeca (eu nao soube como deixar generico)

const CenaPeca = preload("res://Cenas/Objetos/QuebraCabeca.tscn")
var FatorAleatorio = RandomNumberGenerator.new()
var Indice = 0
var tempoInicial
var tempoFinal
var MontarImagem

func _ready():
	if not QuantidadePecas:
		QuantidadePecas = 4
	
	if not Carregar.FaseAtual: #VERIFICADOR DE INCONSISTENCIAS
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalDelegacia.tscn", self)
	else:
		VisualServer.set_default_clear_color(Color("#c87a7a"))
		
		tempoInicial = OS.get_unix_time()
		imagemAleatoria()
		zonaMontagem()
		zonaNascimento()
	pass

func imagemAleatoria():
	MontarImagem = load("res://Elementos/Fases/Delegacia/DelegaciaFase2/QuebraCabeca_0"+str(FatorAleatorio.randi_range(1,2))+".png")
	pass

func zonaMontagem():
	var FrameAtual = 0
	for coluna in range(0, QuantidadePecas):
		for linha in range(0, QuantidadePecas):
			var Peca = CenaPeca.instance()
			Peca.NumeroPecas = QuantidadePecas
			Peca.texture = MontarImagem
			Peca.Movimentar = false
			
			Peca.get_node("Contorno").visible = false
			Peca.get_node("Transparencia").color = Color(1.0, 1.0, 1.0, 0.8)
			Peca.position = Vector2(linha*(Peca.texture.get_width()/QuantidadePecas)*Peca.scale.x, coluna*(Peca.texture.get_height()/QuantidadePecas)*Peca.scale.y) - Vector2(ProjectSettings.get_setting("display/window/size/width")/4,0)
			Peca.frame = FrameAtual
			
			get_node("ZonaMontagem").add_child(Peca)
			FrameAtual += 1
	pass


func zonaNascimento():
	var FrameAtual = 0
	for _coluna in range(0, QuantidadePecas):
		for _linha in range(0, QuantidadePecas):
			var Peca = CenaPeca.instance()
			Peca.NumeroPecas = QuantidadePecas
			Peca.texture = MontarImagem
			Peca.Movimentar = true
			
			Peca.get_node("Contorno").visible = true
			Peca.get_node("Transparencia").color = Color(0.0, 0.0, 0.0, 0.8)
			Peca.position = Vector2(Vector2(FatorAleatorio.randi_range(15, 980), FatorAleatorio.randi_range(10, 140)))
			Peca.frame = FrameAtual
			
			get_node("ZonaNascimento").add_child(Peca)
			FrameAtual += 1
	pass

func terminarJogo():
	tempoFinal = OS.get_unix_time()
	Carregar.atualizarPontuacao(Carregar.FaseAtual, tempoFinal-tempoInicial, 0)
	Carregar.Dados.Cena = "res://Cenas/Telas/TelaEncerramento.tscn"
	Carregar.salvarDados(Carregar.Dados)
	Carregar.trocarCena("res://Cenas/Telas/TelaEncerramento.tscn", self)
