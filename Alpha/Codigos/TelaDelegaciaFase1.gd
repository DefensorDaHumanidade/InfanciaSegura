extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export (int) var contador = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	var numero = RandomNumberGenerator.new()
	numero.randomize()
	get_node("ColunaLogos").move_child($ColunaLogos/Logo1, 7)
#	var cordinha = preload("res://Cenas/Corda.tscn").instance()
#	cordinha.position = Vector2(140, 230)
#	cordinha.endPin = false
#	get_node("ColunaLogos/Logo1").add_child(cordinha)
	
	get_node("ColunaNumeros").move_child($ColunaNumeros/Logo1, numero.randi_range(0, 7))
	get_node("ColunaNumeros").move_child($ColunaNumeros/Logo2, numero.randi_range(0, 7))
	get_node("ColunaNumeros").move_child($ColunaNumeros/Logo3, numero.randi_range(0, 7))
	get_node("ColunaNumeros").move_child($ColunaNumeros/Logo4, numero.randi_range(0, 7))
	get_node("ColunaNumeros").move_child($ColunaNumeros/Logo5, numero.randi_range(0, 7))
	get_node("ColunaNumeros").move_child($ColunaNumeros/Logo6, numero.randi_range(0, 7))
	get_node("ColunaNumeros").move_child($ColunaNumeros/Logo7, numero.randi_range(0, 7))
#	print(get_node("ColunaLogos").children.size())

	
	
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr("DelegaciaFase1_Inicio")
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/DelegaciaFase1_Inicio.mp3"))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	Configuracoes.salvar.TempoAuxiliar = OS.get_unix_time()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
