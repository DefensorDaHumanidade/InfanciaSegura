extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	$Meliante.rect_position = get_node("Meliante"+str(rng.randi_range(1,5))).position
	$Malfeitora.rect_position = get_node("Malfeitora"+str(rng.randi_range(1,5))).position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Meliante_gui_input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		$AudioAcerto.play()
		$Meliante.mouse_filter = 2
		$Meliante/Acerto.visible = true
	pass # Replace with function body.


func _on_Malfeitora_gui_input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		$AudioAcerto.play()
		$Malfeitora.mouse_filter = 2
		$Malfeitora/Acerto.visible = true
	pass # Replace with function body.
