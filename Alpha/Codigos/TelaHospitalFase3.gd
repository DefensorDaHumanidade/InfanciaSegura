extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Toque_pressionado():
	$Meio/Centro/Toque.scale = Vector2(0.9, 0.9)
	pass # Replace with function body.


func _on_Contorno_selecionado(event):
	if event is InputEventScreenDrag or event is InputEventScreenTouch:
#	if event is InputEventScreenTouch:
#		$Meio/Centro/Toque.scale = Vector2(0.9, 0.9)
		$Meio/Centro/Toque/Contorno.rect_pivot_offset = event.position - Vector2(250,250)
#	else:
#		$Meio/Centro/Toque.scale = Vector2(1, 1)
	pass # Replace with function body.
