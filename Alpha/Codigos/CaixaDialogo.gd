extends ReferenceRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Margem/Elementos/BotaoDireita/ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/SetaHorizontal.svg")
	$Margem/Elementos/BotaoDireita/ConteinerVertical/Icone.modulate = Color(0, 0.9, 0.9, 1)
	$Margem/Elementos/BotaoDireita/ConteinerVertical/Icone.flip_h = true
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

