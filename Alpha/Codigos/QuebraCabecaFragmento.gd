extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var arrastar = false
var peca : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_QuebraCabecaFragmento_pressionado():
	print("pressionadoooooooooo")
	pass # Replace with function body.


func _on_QuebraCabecaFragmento_arrastar(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if arrastar:
			arrastar = false
		else:
			arrastar = true
	if event is InputEventMouseMotion and arrastar:
		self.global_position = event.position
	pass # Replace with function body.


func _on_QuebraCabecaFragmento_entrou(area):
	print("Passando em cima da peca: ", area.get_parent().get_node("Numeracao").text, "(", $Numeracao.text, ")")
	get_node("/root/TelaDelegaciaFase2").PecaAtual = area.get_parent().get_node("Numeracao").text
	peca = area.get_parent().name
	if $Numeracao.text == area.get_parent().get_node("Numeracao").text:
		get_node("/root/TelaDelegaciaFase2").estado = true
		print("LOCAL VALIDO")
	else:
		get_node("/root/TelaDelegaciaFase2").estado = false
		print("LOCAL INVALIDO")
	pass # Replace with function body.


func _on_ReferenceRect_arrasta(event):
	if event is InputEventScreenTouch:
		if arrastar:
			arrastar = false
		else:
			arrastar = true
	if event is InputEventMouseMotion and arrastar:
		self.global_position = event.global_position
	pass # Replace with function body.














