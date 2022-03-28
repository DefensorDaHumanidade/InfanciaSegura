extends Control

const CenaPeca = preload("res://Cenas/Objetos/CorpoHumanoPeca.tscn")
var ElementosAprender = 5
var Indice = 0
var ErrosCometidos = 0
var tempoInicial
var tempoFinal
var Timestamp

func _ready():
	if not Carregar.FaseAtual: #VERIFICADOR DE INCONSISTENCIAS
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalHospital.tscn", self)
	else:
		VisualServer.set_default_clear_color(Color("#72bcc8"))
		
		tempoInicial = OS.get_unix_time()
		configuracaoGenero()
		AtualizarPeca()
	pass

func AtualizarPeca():
	Timestamp = OS.get_unix_time()
	Indice += 1
	if Indice > ElementosAprender:
		yield(get_tree().create_timer(1.5), "timeout")
		terminarJogo()
		return
	
	var Peca = CenaPeca.instance()
	Peca.rect_position = Vector2(-130, -150)
	Peca.Movimentar = true
	Peca.PartePrivada = true
	Peca.get_node("Texto").visible = false
	Peca.self_modulate = Color(1.0, 1.0, 1.0, 0.0)
	Peca.get_node("Contorno").border_color = Color(1.0, 0.0, 0.0, 1.0)
	
	get_node("ZonaNascimento").add_child(Peca)
	get_node("Painel").atualizarPainel(Indice, ElementosAprender)
	pass

func configuracaoGenero():
	get_node("Mural/ElementosFrente/CorpoHumanoFrente").texture = load("res://Elementos/Fases/Hospital/CorpoHumano/"+Carregar.Dados.Genero+"Frente.png")
	get_node("Mural/ElementosCostas/CorpoHumanoCostas").texture = load("res://Elementos/Fases/Hospital/CorpoHumano/"+Carregar.Dados.Genero+"Costas.png")
	get_node("Mural/ElementosFrente/CorpoHumanoFrente").flip_h = true
	pass

func _deslizarTela(valor):
	$Mural.rect_position.y = valor*10
	pass

func _viraDesvira(estado):
	if estado:
		get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Icone").texture = load("res://Elementos/Visuais/Icones/Desinverter.png")
		get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Texto").text = "BotaoFrente"
		get_node("Mural/ElementosCostas").visible = true
		get_node("Mural/ElementosFrente").visible = false
	else: 
		get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Icone").texture = load("res://Elementos/Visuais/Icones/Inverter.png")
		get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Texto").text = "BotaoTras"
		get_node("Mural/ElementosCostas").visible = false
		get_node("Mural/ElementosFrente").visible = true
	pass

func terminarJogo():
	tempoFinal = OS.get_unix_time()
	Carregar.atualizarPontuacao(Carregar.FaseAtual, tempoFinal-tempoInicial, ErrosCometidos)
	Carregar.Dados.Cena = "res://Cenas/Telas/TelaEncerramento.tscn"
	Carregar.salvarDados(Carregar.Dados)
	Carregar.trocarCena("res://Cenas/Telas/TelaEncerramento.tscn", self)

func enviarBancoDados(AcertoErro: String, Descricao: String):
	Carregar.comunicarBancoRespostas("ArmazenarRespostas.php", "PartePrivada", AcertoErro, str(Timestamp), Descricao)
	pass
