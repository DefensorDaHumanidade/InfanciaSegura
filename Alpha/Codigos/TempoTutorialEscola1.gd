extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TempoTutorialEscola1_timeout():
	if get_tree().current_scene.name == "TelaEscolaTutorialFase1":
		get_tree().change_scene("res://Cenas/TelaEscolaFase1.tscn")
	if get_tree().current_scene.name == "TelaEscolaTutorialFase2":
		get_tree().change_scene("res://Cenas/TelaEscolaFase2.tscn")
	if get_tree().current_scene.name == "TelaEscolaTutorialFase3":
		get_tree().change_scene("res://Cenas/TelaEscolaFase3.tscn")
	if get_tree().current_scene.name == "TelaHospitalTutorialFase1":
		get_tree().change_scene("res://Cenas/TelaHospitalFase1Generico.tscn")
	if get_tree().current_scene.name == "TelaHospitalTutorialFase2":
		get_tree().change_scene("res://Cenas/TelaHospitalFase2Generico.tscn")
	if get_tree().current_scene.name == "TelaHospitalTutorialFase3":
		get_tree().change_scene("res://Cenas/TelaHospitalFase3.tscn")
	if get_tree().current_scene.name == "TelaDelegaciaTutorialFase1":
		get_tree().change_scene("res://Cenas/TelaDelegaciaFase1.tscn")
	if get_tree().current_scene.name == "TelaDelegaciaTutorialFase2":
		get_tree().change_scene("res://Cenas/TelaDelegaciaFase2.tscn")
	if get_tree().current_scene.name == "TelaDelegaciaTutorialFase3":
		get_tree().change_scene("res://Cenas/TelaDelegaciaFase3.tscn")
	if get_tree().current_scene.name == "TelaInternetTutorialFase1":
		get_tree().change_scene("res://Cenas/TelaInternetFase1.tscn")
	if get_tree().current_scene.name == "TelaInternetTutorialFase2":
		get_tree().change_scene("res://Cenas/TelaInternetFase2.tscn")
	if get_tree().current_scene.name == "TelaInternetTutorialFase3":
		get_tree().change_scene("res://Cenas/TelaInternetFase3.tscn")
	pass # Replace with function body.
