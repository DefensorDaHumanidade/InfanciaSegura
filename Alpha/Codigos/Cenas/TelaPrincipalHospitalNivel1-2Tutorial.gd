extends Control

const CenaTutorial = preload("res://Cenas/Objetos/AvisoFimTutorial.tscn")

var Elementos = []
var Indice = 0
var ErrosCometidos = 0
var tempoInicial
var tempoFinal
var verificador = true

func _ready():
	if not Carregar.FaseAtual: #VERIFICADOR DE INCONSISTENCIAS
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalHospital.tscn", self)
	else:
		configuracaoGenero()
		get_node("Painel").atualizarPainel(1, 1)
	pass

func configuracaoGenero():
	get_node("Mural/ElementosFrente/CorpoHumanoFrente").texture = load("res://Elementos/Fases/Hospital/CorpoHumano/"+Carregar.Dados.Genero+"Frente.png")
	get_node("Mural/ElementosCostas/CorpoHumanoCostas").texture = load("res://Elementos/Fases/Hospital/CorpoHumano/"+Carregar.Dados.Genero+"Costas.png")
	get_node("Mural/ElementosFrente/CorpoHumanoFrente").flip_h = true
	pass

func _deslizarTela(valor):
	$Mural.rect_position.y = valor*10
	if valor >= -10 and verificador:
		get_node("ZonaNascimento").visible = true
	else:
		get_node("ZonaNascimento").visible = false
	pass

func _viraDesvira(estado):
	
	if estado:
		get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Icone").texture = load("res://Elementos/Visuais/Icones/Desinverter.png")
		get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Texto").text = "BotaoFrente"
		get_node("Mural/ElementosCostas").visible = true
		get_node("Mural/ElementosFrente").visible = false
		get_node("ZonaNascimento").visible = false
		verificador = false
	else: 
		get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Icone").texture = load("res://Elementos/Visuais/Icones/Inverter.png")
		get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Texto").text = "BotaoTras"
		get_node("Mural/ElementosCostas").visible = false
		get_node("Mural/ElementosFrente").visible = true
		get_node("ZonaNascimento").visible = true
		verificador = true
	pass

func terminarTutorial():
	var Tutorial = CenaTutorial.instance()
	self.add_child(Tutorial)
	get_node("AvisoFimTutorial/CamadaSuperior/Fundo/Linha/Botao").TrocarTela = "TelaPrincipalHospitalNivel"+Carregar.FaseAtual.substr(12)
	get_node("ZonaNascimento").visible = false
	get_node("AnimarTutorial").queue_free()
	pass
