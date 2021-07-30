extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	$Pessoa1.rect_position = get_node("Meliante"+str(rng.randi_range(1,5))).position
	$Pessoa2.rect_position = get_node("Malfeitora"+str(rng.randi_range(1,5))).position
	$Pessoa3.rect_position = get_node("Policial"+str(rng.randi_range(1,5))).position
	$Pessoa4.rect_position = get_node("Bandido"+str(rng.randi_range(1,5))).position
	$Pessoa5.rect_position = get_node("Bomzinho"+str(rng.randi_range(1,5))).position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Meliante_gui_input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		$AudioAcerto.play()
		$Pessoa1.mouse_filter = 2
		$Pessoa1/Acerto.visible = true
	pass # Replace with function body.


func _on_Malfeitora_gui_input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		$AudioAcerto.play()
		$Pessoa2.mouse_filter = 2
		$Pessoa2/Acerto.visible = true
	pass # Replace with function body.


func _on_Pessoa3_gui_input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		$AudioAcerto.play()
		$Pessoa3.mouse_filter = 2
		$Pessoa3/Acerto.visible = true
	pass # Replace with function body.


func _on_Pessoa4_gui_input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		$AudioAcerto.play()
		$Pessoa4.mouse_filter = 2
		$Pessoa4/Acerto.visible = true
	pass # Replace with function body.


func _on_Pessoa5_gui_input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		$AudioAcerto.play()
		$Pessoa5.mouse_filter = 2
		$Pessoa5/Acerto.visible = true
	pass # Replace with function body.
