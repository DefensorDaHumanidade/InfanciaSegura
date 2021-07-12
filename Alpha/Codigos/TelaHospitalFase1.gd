extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Partes			= [	"Parte1", 
						"Parte2",
						"Parte3",
						"Parte4",
						"Parte5",
						"Parte6",
						"Parte7",
						"Parte8",
						"Parte9",
						"Parte10", ]

var arrastar = false
var estado = null


export (int) var indicePartes

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	indicePartes = 0
	Partes.shuffle()
	for indice in range(0, Partes.size()/2):
		get_node("Centro/Cena").get_node(Partes[indice]).get_node("Texto").visible = false
#	$Centro/Cena/Parte1/Texto.visible = false
#	atualizarParte()
	pass # Replace with function body.


func atualizarParte():
#	$CentroNascimento/PecaMural.position = $CentroNascimento.rect_pivot_offset
#	print($PecaMural.position)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ControleDeslizanteVertical_trocar(valor):
	print(valor)
	$Centro/Cena.position.y =  -valor
	pass # Replace with function body.


func _on_Area_arrastarParte(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if arrastar:
			arrastar = false
#			if estado == null:
#				$Meio/Centro/Toque.scale = Vector2(1, 1)
#				$Meio/Centro/Toque.position = Vector2(0, 0)
#			else:
#				if estado:
#					$AudioAcerto.play()
#					indiceToque += 1
#					if indiceToque < Toques.size():
#						atualizarImagem()
#					else:
#						$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.text = "cabooooooo"
#						get_node("Meio/Centro/Toque").queue_free()
#						yield(get_tree().create_timer(1.0), "timeout")
#						print("Acabaram as perguntas")
#						Configuracoes.salvar.Cena = "res://Cenas/TelaHospital.tscn"
#						if get_tree().change_scene("res://Cenas/TelaHospital.tscn") == OK:
#							if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
#								print("Cena salva!")
#						get_tree().change_scene("res://Cenas/TelaHospital.tscn")
#				else:
#					$Meio/Centro/Toque.scale = Vector2(1, 1)
#					$Meio/Centro/Toque.position = Vector2(0, 0)
#					$AudioErro.play()
#					$Camera/Animar.play("Tremer")
		else:
			arrastar = true
		print(arrastar)
	if event is InputEventMouseMotion and arrastar:
		$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(0.9, 0.9)
#		$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.global_position = event.position
	pass # Replace with function body.
