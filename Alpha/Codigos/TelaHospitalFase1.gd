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
	print(Partes)
	for indice in range(0, Partes.size()/2):
		get_node("Centro/Cena").get_node(Partes[indice]).get_node("Texto").visible = false
#	$Centro/Cena/Parte1/Texto.visible = false
	atualizarParte()
#	$CaixaDialogo/Margem/Elementos/BotaoDireita/ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/Frente.svg")
	pass # Replace with function body.


func atualizarParte():
#	$CentroNascimento/PecaMural.position = $CentroNascimento.rect_pivot_offset
#	print($PecaMural.position)
#	$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto.text = str(Partes[indicePartes])
	$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto.text = get_node("Centro/Cena").get_node(Partes[indicePartes]).get_node("Texto").text
	$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(1, 1)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.position = Vector2(740, 150)
	
#	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr(str("HospitalFase1_") + Partes[indicePartes])
#	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
#	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(false)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/HospitalFase1_" + Partes[indicePartes] + ".mp3"))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ControleDeslizanteVertical_trocar(valor):
	print(valor)
	$Centro/Cena.position.y =  -valor
	$Centro/Tras.position.y =  -valor
	pass # Replace with function body.


func _on_Area_arrastarParte(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if arrastar:
			arrastar = false
			if estado == null:
				$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(1, 1)
				$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.position = Vector2(740, 150)
			else:
				if estado:
					$AudioAcerto.play()
					get_node("Centro/Cena").get_node(Partes[indicePartes]).get_node("Texto").visible = true
					indicePartes += 1
					if indicePartes < Partes.size()/2:
						atualizarParte()
					else:
						$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.text = "cabooooooo"
						$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.queue_free()
						yield(get_tree().create_timer(1.0), "timeout")
						print("Acabaram as perguntas")
						Configuracoes.salvar.Cena = "res://Cenas/TelaHospital.tscn"
						if get_tree().change_scene("res://Cenas/TelaHospital.tscn") == OK:
							if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
								print("Cena salva!")
						get_tree().change_scene("res://Cenas/TelaHospital.tscn")
				else:
					$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(1, 1)
					$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.position =Vector2(740, 150)
					$AudioErro.play()
					$Camera/Animar.play("Tremer")
		else:
			arrastar = true
			$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Audio.play()
			$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(0.9, 0.9)
		print(arrastar)
	if event is InputEventMouseMotion and arrastar:		
		$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.global_position = event.position
	pass # Replace with function body.


