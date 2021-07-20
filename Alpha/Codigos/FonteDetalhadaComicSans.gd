extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var taxaExposicao


# Called when the node enters the scene tree for the first time.
func _ready():
#	print(get_tree().get_current_scene().get_name())
#	get("./custom_fonts/normal_font").size = 40
#	get("./custom_fonts/normal_font/size") = 20
#	get_node(".").set("custom_fonts:size", 20)
#	get_node(".").set("custom_fonts/normal_font/settings/size", 60)
#	set("custom_fonts/normal_font/settings/size", 160)
	if get_tree().get_current_scene().get_name() == "TelaCadastro" and name != "Descricao":
		bbcode_text = tr("TelaCadastro_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaCadastro_1.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
	if get_tree().get_current_scene().get_name() == "TelaPrincipal" and name != "Descricao":
		bbcode_text = tr("TelaCadastro_3")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaCadastro_3.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
	if get_tree().get_current_scene().get_name() == "TelaEscola" and name != "Descricao":
		bbcode_text = tr("TelaSecundariaEscola_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaSecundariaEscola_1.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
	if get_tree().get_current_scene().get_name() == "TelaHospital" and name != "Descricao":
		bbcode_text = tr("TelaHospital_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaHospital_1.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaDelegacia" and name != "Descricao":
		bbcode_text = tr("TelaDelegacia_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaDelegacia_1.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaInternet" and name != "Descricao":
		bbcode_text = tr("TelaInternet_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaInternet_1.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	percent_visible = 0.0
	if text == "Descricao":
		bbcode_text = tr("Descricao")
		percent_visible = 1.0
		visible_characters = get_text().length()
	pass # Replace with function body.

func alterarTamanhoFonte():
	set_size(Vector2(2,2), true)
#	size = Configuracoes.salvar.Texto
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible_characters < get_text().length():
		visible_characters = taxaExposicao
		taxaExposicao += 20*delta
	else:
		set_process(false)
		print("Fim da impressao do texto! Total de caracteres imprimidos: ", get_text().length())
	pass

func _on_Voz_Finalizado():
	get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = false
	pass # Replace with function body.




