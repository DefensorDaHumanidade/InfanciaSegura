extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var arrastar = false
var posicaoInicial = Vector2.ZERO

var procurados = [1, 2, 3, 4, 5]
var contador = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$Cidade/Elemento_01.modulate = Color(1, 1, 1, 0)
	$Cidade/Elemento_02.modulate = Color(1, 1, 1, 0)
	
	

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func procurado():
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr("DelegaciaFase3_Pessoa"+str(1))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/DelegaciaFase3_Pessoa"+str(1)+".mp3"))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	pass


func _on_ControleDeslizanteVertical_Zoom(valor):
#	$Cidade.rect_position.y = -valor
	$Cidade.rect_scale = Vector2(valor, valor)
#	$ViewportContainer/Viewport/Camera2D.set_offset($ViewportContainer/Viewport/Camera2D.get_offset() - event.relative*_current_zoom_level)
	$ViewportContainer/Viewport/CameraMapa.zoom = Vector2(valor, valor)
	pass # Replace with function body.


func _on_Cidade_deslocarCidade(event):
#	if event is InputEventScreenTouch:
#		print($Cidade.rect_pivot_offset, event.position)
#		$Cidade.rect_pivot_offset = event.position.normalized()
		
	if event is InputEventScreenTouch:
		$Cidade.rect_pivot_offset = event.position
		if arrastar:
			arrastar = false
		else:
#			posicaoInicial = event.position
			arrastar = true
	if event is InputEventMouseMotion and arrastar:
		$Cidade.rect_global_position = event.global_position.normalized() - $Cidade.rect_pivot_offset.normalized()
		print($Cidade.rect_pivot_offset, $Cidade.rect_global_position)


	
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
