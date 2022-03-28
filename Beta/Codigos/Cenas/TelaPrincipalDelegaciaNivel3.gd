extends Control


const CenaPopulacao = preload("res://Cenas/Objetos/PopulacaoCidade.tscn")
var FatorAleatorio = RandomNumberGenerator.new()
var Elementos = [1, 2, 3, 4, 5]
var Indice = 0
var tempoInicial
var tempoFinal

var posicaoCidade = Vector2.ZERO
var posicaoClique = Vector2.ZERO
var limites = Vector2.ZERO
var arrastar = false

func _ready():
	if not Carregar.FaseAtual: #VERIFICADOR DE INCONSISTENCIAS
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalDelegacia.tscn", self)
	else:
		VisualServer.set_default_clear_color(Color("#609F51"))
		tempoInicial = OS.get_unix_time()
		preencherProcurados()
		preencherPopulacao()
		Elementos.shuffle()
		CarregarElementos(Carregar.FaseAtual+"_Pessoa"+str(Elementos[Indice]))
	pass

func RespostaCerta():
	get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Icone").self_modulate = Color("#00e5e5")
	get_node("Dialogo/Margem/Vertical/BotaoComando").self_modulate = Color("#96ffeb")
	
	get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Icone").texture = load("res://Elementos/Visuais/Icones/Seta.png")
	get_node("Dialogo/Margem/Vertical/BotaoComando").disabled = false
	
	CarregarElementos(Carregar.FaseAtual+"_Acertou_"+str(Elementos[Indice]))
	pass

func preencherProcurados():
	for procurado in range(1, 6):
		var Pessoa = CenaPopulacao.instance()
		
		Pessoa.texture = load("res://Elementos/Fases/Delegacia/DelegaciaFase3/Procurado"+str(procurado)+".png")
		Pessoa.rect_pivot_offset = Vector2(Pessoa.texture.get_width()/2,Pessoa.texture.get_height())
		
		if FatorAleatorio.randi_range(0,1):
			Pessoa.flip_h = true
		else: 
			Pessoa.flip_h = false
		
		get_node("Cidade/Procurados/Procurado"+str(procurado)+"/Local"+str(FatorAleatorio.randi_range(1, 5))).add_child(Pessoa)
#		get_node("Cidade/Procurados/Procurado"+str(procurado)+"/Local"+str(5)).add_child(Pessoa)
	pass

func preencherPopulacao():
	for procurado in range(1, 8):
		for repetir in range(1, 9):
			var Pessoa = CenaPopulacao.instance()
			
			Pessoa.texture = load("res://Elementos/Fases/Delegacia/DelegaciaFase3/Pessoa"+str(procurado)+".png")
			Pessoa.rect_pivot_offset = Vector2(Pessoa.texture.get_width()/2,Pessoa.texture.get_height())
			Pessoa.mouse_filter = Control.MOUSE_FILTER_IGNORE
			
			if FatorAleatorio.randi_range(0,1):
				Pessoa.flip_h = true
			else: 
				Pessoa.flip_h = false
			
			get_node("Cidade/Populacao/Pessoa"+str(procurado)+"/Local"+str(repetir)).add_child(Pessoa)
	pass



func _arrastarCidade(evento):
	if evento is InputEventScreenTouch:
		if arrastar:
			arrastar = false
		else:
			arrastar = true
			posicaoClique = evento.position
			posicaoCidade = get_node("Cidade").rect_position
	if evento is InputEventMouseMotion and arrastar:
		get_node("Cidade").set_global_position(posicaoCidade+evento.position-posicaoClique)
	pass

func _escalaCidade(valor):
	get_node("Cidade").rect_scale = Vector2(valor, valor)
	pass

func CarregarElementos(Atributos: String):
	if get_node_or_null("Dialogo/Margem/Vertical/Caixa/Margem/Texto"):
		
		if Atributos.substr(21, 23).is_valid_integer():
			get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Icone").texture = load("res://Elementos/Fases/Delegacia/DelegaciaFase3/Procurado"+Atributos.substr(21, 23)+".png")
			get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Icone").self_modulate = Color(1.0, 1.0, 1.0, 1.0)
			get_node("Dialogo/Margem/Vertical/BotaoComando").self_modulate = Color(1.0, 1.0, 1.0, 1.0)
		
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

func _BotaoProximoProcurado():
	get_node("Dialogo/Margem/Vertical/BotaoComando").disabled = true
	Indice += 1
	if Indice >= Elementos.size():
		terminarJogo()
	else:
		CarregarElementos(Carregar.FaseAtual+"_Pessoa"+str(Elementos[Indice]))
	pass
