extends Resource
#class_name Salvar

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (String) var Cena
export (String) var Identificador
export (String) var Idioma
export (String) var NomeMusica
#export (int, 0, 20) var Musica
#export (int, 0, 20) var Voz
#export (int, 0, 20) var Audio
#export (int, 39, 70) var Texto
export var Musica : int
export var Voz : int
export var Audio : int
export var Texto : int
export var EscolaFase1 : Array


# Called when the node enters the scene tree for the first time.
func _ready():
#	ResourceSaver.save("res://Dados.tres", self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
