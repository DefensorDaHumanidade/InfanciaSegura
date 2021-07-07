extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	value = Configuracoes.salvar.Voz
	pass # Replace with function body.

func _on_ControleDeslizanteHorizontal_trocarValor(valor):
	Configuracoes.salvar.Voz = valor
	if valor == -40:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("CanalVoz"), -80)
	else: 
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("CanalVoz"), valor)
	if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
		print("Tamanho da Voz salvo: ", valor)
	pass # Replace with function body.
