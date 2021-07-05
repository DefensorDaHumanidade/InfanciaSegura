extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_BotaoQuadrado_Selecionado():
	print("Botao ", name, " pressionado!")
	$Icone.modulate = Color(0.5, 0.5, 0.5, 1)
	$Icone.rect_position.y = $Icone.rect_position.y + 15
	pass # Replace with function body.


func _on_BotaoQuadrado_Solto():
	print("Botao ", name, " solto!")
	$Icone.modulate = Color(1, 1, 1, 1)
	$Icone.rect_position.y = $Icone.rect_position.y - 15
	pass # Replace with function body.


func _on_BotaoQuadrado_Comando():
	print("Realizando acao do botao: ", name)
	pass # Replace with function body.
