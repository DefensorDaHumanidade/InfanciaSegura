extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_ParteEntrou(area):
#	print(area.get_parent().get_node("Texto").text)
#	print(get_node("/root/TelaHospitalFase1/CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto").text)
	if area.get_parent().get_node("Texto").text == get_node("/root/TelaHospitalFase1/CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto").text:
		get_node("/root/TelaHospitalFase1/").estado = true
	else:
		get_node("/root/TelaHospitalFase1/").estado = false
#	if area.get_parent().get_node("Texto").text == 
	
	pass # Replace with function body.


func _on_Area_ParteSaiu(area):
	get_node("/root/TelaHospitalFase1/").estado = null
	pass # Replace with function body.
