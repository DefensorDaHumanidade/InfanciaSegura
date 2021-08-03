extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var taxaExposicao


# Called when the node enters the scene tree for the first time.
func _ready():
	if name == "Recorde":
		bbcode_text = tr("TextoRecorde")
		percent_visible = 1.0
		visible_characters = get_text().length()
		return
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
	if get_tree().get_current_scene().get_name() == "TelaGenero" and name != "Descricao":
		bbcode_text = tr("TelaCadastro_2")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaCadastro_2.mp3")
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
	if get_tree().get_current_scene().get_name() == "TelaEscolaTutorialFase1" and name != "Descricao":
		bbcode_text = tr("TelaEscolaFase1_Tutorial")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaEscolaFase1_Tutorial.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaEscolaEncerramentoFase1" and name != "Descricao":
		bbcode_text = tr("TelaEscolaFase1_Encerramento")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaEscolaFase1_Encerramento.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaEscolaTutorialFase2" and name != "Descricao":
		bbcode_text = tr("TelaEscolaFase2_Tutorial")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaEscolaFase2_Tutorial.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaEscolaEncerramentoFase2" and name != "Descricao":
		bbcode_text = tr("TelaEscolaFase2_Encerramento")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaEscolaFase2_Encerramento.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaEscolaEncerramentoFase3" and name != "Descricao":
		bbcode_text = tr("TelaEscolaFase3_Encerramento")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaEscolaFase3_Encerramento.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaEscolaTutorialFase3" and name != "Descricao":
		bbcode_text = tr("TelaEscolaFase3_Tutorial")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaEscolaFase3_Tutorial.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaHospitalTutorialFase1" and name != "Descricao":
		bbcode_text = tr("TelaHospitalFase1_Tutorial")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaHospitalFase1_Tutorial.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaHospitalEncerramentoFase1" and name != "Descricao":
		bbcode_text = tr("TelaHospitalFase1_Encerramento")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaHospitalFase1_Encerramento.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaHospitalTutorialFase2" and name != "Descricao":
		bbcode_text = tr("TelaHospitalFase2_Tutorial")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaHospitalFase2_Tutorial.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaHospitalEncerramentoFase2" and name != "Descricao":
		bbcode_text = tr("TelaHospitalFase2_Encerramento")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaHospitalFase2_Encerramento.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaHospitalTutorialFase3" and name != "Descricao":
		bbcode_text = tr("TelaHospitalFase3_Tutorial")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaHospitalFase3_Tutorial.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaHospitalEncerramentoFase3" and name != "Descricao":
		bbcode_text = tr("TelaHospitalFase3_Encerramento")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaHospitalFase3_Encerramento.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaInternetTutorialFase1" and name != "Descricao":
		bbcode_text = tr("TelaInternetFase1_Tutorial")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaInternetFase1_Tutorial.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaInternetEncerramentoFase1" and name != "Descricao":
		bbcode_text = tr("TelaInternetFase1_Encerramento")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaInternetFase1_Encerramento.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaInternetTutorialFase2" and name != "Descricao":
		bbcode_text = tr("TelaInternetFase2_Tutorial")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaInternetFase2_Tutorial.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaInternetEncerramentoFase2" and name != "Descricao":
		bbcode_text = tr("TelaInternetFase2_Encerramento")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaInternetFase2_Encerramento.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaInternetTutorialFase3" and name != "Descricao":
		bbcode_text = tr("TelaInternetFase3_Tutorial")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaInternetFase3_Tutorial.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaInternetEncerramentoFase3" and name != "Descricao":
		bbcode_text = tr("TelaInternetFase3_Encerramento")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaInternetFase3_Encerramento.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaDelegaciaTutorialFase1" and name != "Descricao":
		bbcode_text = tr("TelaDelegaciaFase1_Tutorial")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaDelegaciaFase1_Tutorial.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaDelegaciaEncerramentoFase1" and name != "Descricao":
		bbcode_text = tr("TelaDelegaciaFase1_Encerramento")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaDelegaciaFase1_Encerramento.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaDelegaciaTutorialFase2" and name != "Descricao":
		bbcode_text = tr("TelaDelegaciaFase2_Tutorial")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaDelegaciaFase2_Tutorial.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaDelegaciaEncerramentoFase2" and name != "Descricao":
		bbcode_text = tr("TelaDelegaciaFase2_Encerramento")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaDelegaciaFase2_Encerramento.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaDelegaciaTutorialFase3" and name != "Descricao":
		bbcode_text = tr("TelaDelegaciaFase3_Tutorial")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaDelegaciaFase3_Tutorial.mp3")
		$Voz.play()
		get_parent().get_parent().get_parent().get_node("BotaoEsquerda").pressed = true
		pass
	if get_tree().get_current_scene().get_name() == "TelaDelegaciaEncerramentoFase3" and name != "Descricao":
		bbcode_text = tr("TelaDelegaciaFase3_Encerramento")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/TelaDelegaciaFase3_Encerramento.mp3")
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




