extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	value = Configuracoes.salvar.Texto
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ControleDeslizanteHorizontal_trocarValor(valor):
	Configuracoes.salvar.Texto = valor
	if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
		print("Tamanho do Texto salvo: ", valor)
	pass # Replace with function body.
