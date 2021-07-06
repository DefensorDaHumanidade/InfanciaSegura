extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("AQUIII: ", Configuracoes.salvar.Testa)
	if Configuracoes.salvar.Testa == 0:
		value = 40
		Configuracoes.salvar.Testa = 40
		if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
			print("Tamanho do Texto salvo:")
	else:
		value = Configuracoes.salvar.Testa
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ControleDeslizanteHorizontal_trocarValor(valor):
	Configuracoes.salvar.Testa = valor
	if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
		print("Tamanho do Texto salvo: ", valor)
	pass # Replace with function body.
