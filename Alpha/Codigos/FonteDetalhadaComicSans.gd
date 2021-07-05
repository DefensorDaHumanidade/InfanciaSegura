extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	print(get_tree().get_current_scene().get_name())
	if get_tree().get_current_scene().get_name() == "TelaCadastro":
		bbcode_text = tr("TelaCadastro_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/Teste1.mp3")
		$Voz.play()
	if get_tree().get_current_scene().get_name() == "TelaPrincipal":
		bbcode_text = tr("TelaCadastro_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/Teste2.mp3")
		$Voz.play()
	if get_tree().get_current_scene().get_name() == "TelaSecundaria":
		bbcode_text = tr("TelaSecundariaEscola_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/Teste3.mp3")
		$Voz.play()
	if get_tree().get_current_scene().get_name() == "TelaHospital":
		bbcode_text = tr("TelaHospital_1")
		$Voz.stream = load("res://Elementos/Sonoros/Vozes/Teste3.mp3")
		$Voz.play()
		pass
	percent_visible = 0.0
	pass # Replace with function body.

var contador = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if percent_visible < 1.0:
		percent_visible += delta*0.3
	else:
		set_process(false)
		print("Fim da impressao do texto!")
	pass

func _on_Voz_Finalizado():
	print("fim")
	pass # Replace with function body.
