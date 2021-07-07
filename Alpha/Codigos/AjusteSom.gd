extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	value = Configuracoes.salvar.Audio
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ControleDeslizanteHorizontal_trocarValor(valor):
	Configuracoes.salvar.Audio = valor
	if valor == -40:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80)
	else: 
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), valor)
	if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
		print("Tamanho da Som salvo: ", valor)
	pass # Replace with function body.
