extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var arrastar = false
var posicaoInicial = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	$Cidade/Elemento_01.modulate = Color(1, 1, 1, 0)
	$Cidade/Elemento_02.modulate = Color(1, 1, 1, 0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ControleDeslizanteVertical_Zoom(valor):
#	$Cidade.rect_position.y = -valor
	$Cidade.rect_scale = Vector2(valor, valor)
	pass # Replace with function body.


func _on_Cidade_deslocarCidade(event):
	if event is InputEventScreenTouch:
		if arrastar:
			arrastar = false
		else:
			posicaoInicial = event.position*$Cidade.rect_scale.x
			arrastar = true
	if event is InputEventMouseMotion and arrastar:
#		$Cidade.rect_global_position = event.global_position
#		$Cidade.rect_pivot_offset = event.global_position
		$Cidade.rect_position = event.global_position*$Cidade.rect_scale.x - posicaoInicial
#		print(event.position, $Cidade.rect_position)
	pass # Replace with function body.


func _on_Area_encontrouElemento01(viewport, event, shape_idx):
	print(event)
	pass # Replace with function body.


func _on_Elemento_01_achou(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		$AudioAcerto.play()
		$Cidade/Elemento_01.mouse_filter = MOUSE_FILTER_IGNORE
		$Cidade/Elemento_01.modulate = Color(1, 1, 1, 1)
		print("Achouu")
	pass # Replace with function body.

func _on_Elemento_02_achou(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		$AudioAcerto.play()
		$Cidade/Elemento_02.mouse_filter = MOUSE_FILTER_IGNORE
		$Cidade/Elemento_02.modulate = Color(1, 1, 1, 1)
		print("Achouu")
	pass # Replace with function body.
