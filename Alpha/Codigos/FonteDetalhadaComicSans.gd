extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	print(get_tree().get_current_scene().get_name())
#	get("./custom_fonts/normal_font").size = 40
#	get("./custom_fonts/normal_font/size") = 20
#	get_node(".").set("custom_fonts:size", 20)
#	get_node(".").set("custom_fonts/normal_font/settings/size", 60)
#	set("custom_fonts/normal_font/settings/size", 160)
	if get_tree().get_current_scene().get_name() == "TelaCadastro":
		bbcode_text = tr("TelaCadastro_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/Teste1.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
	if get_tree().get_current_scene().get_name() == "TelaPrincipal":
		bbcode_text = tr("TelaCadastro_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/Teste2.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
	if get_tree().get_current_scene().get_name() == "TelaSecundaria":
		bbcode_text = tr("TelaSecundariaEscola_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/Teste3.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
	if get_tree().get_current_scene().get_name() == "TelaHospital":
		bbcode_text = tr("TelaHospital_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/Teste3.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	percent_visible = 0.0
	pass # Replace with function body.

func alterarTamanhoFonte():
	set_size(Vector2(2,2), true)
#	size = Configuracoes.salvar.Texto
	pass

var letra = 10 #taxa que o texto aparece ao jogador

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print("a")
	if visible_characters < get_text().length():
		visible_characters = letra
		letra += 20*delta
	else:
		set_process(false)
		print("Fim da impressao do texto!", get_text().length())
	pass

func _on_Voz_Finalizado():
	get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = false
	pass # Replace with function body.
