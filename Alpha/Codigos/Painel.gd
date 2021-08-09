extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var tempo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Colunas/Tempo/Numero.text = str(tempo)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Contador_UmSegundo():
	tempo += 1
	$Colunas/Tempo/Numero.text = str(tempo)
	pass # Replace with function body.
