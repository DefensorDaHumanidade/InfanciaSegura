extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()

var auxiliar = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	$Pessoa1.rect_position = get_node("Meliante"+str(rng.randi_range(1,5))).position
	$Pessoa2.rect_position = get_node("Malfeitora"+str(rng.randi_range(1,5))).position
	$Pessoa2.rect_scale = Vector2(0.6, 0.6)
	$Pessoa3.rect_position = get_node("Policial"+str(rng.randi_range(1,5))).position
	$Pessoa2.rect_scale = Vector2(0.8, 0.8)
	$Pessoa4.rect_position = get_node("Bandido"+str(rng.randi_range(1,5))).position
	$Pessoa5.rect_position = get_node("Bomzinho"+str(rng.randi_range(1,5))).position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Meliante_gui_input(event):
	if get_tree().current_scene.procurados[auxiliar] == 1:
		if event is InputEventScreenTouch or event is InputEventMouseButton:
			$AudioAcerto.play()
			$Pessoa1.mouse_filter = 2
			$Pessoa1/Acerto.visible = true
			auxiliar += 1
			acerto(1)
			yield(get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz"), "finished")
			get_tree().current_scene.procurado(auxiliar)
	pass # Replace with function body.


func _on_Malfeitora_gui_input(event):
	if get_tree().current_scene.procurados[auxiliar] == 2:
		if event is InputEventScreenTouch or event is InputEventMouseButton:
			$AudioAcerto.play()
			$Pessoa2.mouse_filter = 2
			$Pessoa2/Acerto.visible = true
			auxiliar += 1
			acerto(2)
			yield(get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz"), "finished")
			get_tree().current_scene.procurado(auxiliar)
	pass # Replace with function body.


func _on_Pessoa3_gui_input(event):
	if get_tree().current_scene.procurados[auxiliar] == 3:
		if event is InputEventScreenTouch or event is InputEventMouseButton:
			$AudioAcerto.play()
			$Pessoa3.mouse_filter = 2
			$Pessoa3/Acerto.visible = true
			auxiliar += 1
			acerto(3)
			yield(get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz"), "finished")
			get_tree().current_scene.procurado(auxiliar)
	pass # Replace with function body.


func _on_Pessoa4_gui_input(event):
	if get_tree().current_scene.procurados[auxiliar] == 4:
		if event is InputEventScreenTouch or event is InputEventMouseButton:
			$AudioAcerto.play()
			$Pessoa4.mouse_filter = 2
			$Pessoa4/Acerto.visible = true
			auxiliar += 1
			acerto(4)
			yield(get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz"), "finished")
			get_tree().current_scene.procurado(auxiliar)
	pass # Replace with function body.


func _on_Pessoa5_gui_input(event):
	if get_tree().current_scene.procurados[auxiliar] == 5:
		if event is InputEventScreenTouch or event is InputEventMouseButton:
			$AudioAcerto.play()
			$Pessoa5.mouse_filter = 2
			$Pessoa5/Acerto.visible = true
			acerto(5)
			yield(get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz"), "finished")
			auxiliar += 1
			get_tree().current_scene.procurado(auxiliar)
	pass # Replace with function body.


func acerto(valor):
	
	get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto").bbcode_text = tr("DelegaciaFase3_Acertou_"+str(valor))
	get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto").percent_visible = 0
	get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto").taxaExposicao = 0
	get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto").set_process(true)
	get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz").stream = load(str("res://Elementos/Sonoros/Vozes/DelegaciaFase3_Acertou_"+str(valor)+".mp3"))
	get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz").play()
	get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/BotaoEsquerda").pressed = true
#	yield(get_parent().get_parent().get_parent().get_parent().get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz"), "finished")
#	yield(get_tree().create_timer(5.5), "timeout") 
	pass
