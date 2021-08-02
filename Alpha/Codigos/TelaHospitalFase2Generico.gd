extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var arrastar = false
var estado = null

var ultimaParte : String

var quantiadePartesPrivadads = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print(Configuracoes.salvar.Genero)
	if Configuracoes.salvar.Genero == "Menina":
		$Centro/Cena/CorpoHumano.texture = load("res://Elementos/Visuais/HospitalFase1/MeninaFrente.png")
		$Centro/Tras/CorpoHumano.texture = load("res://Elementos/Visuais/HospitalFase1/MeninaCostas.png")
#		$Centro/Tras/CorpoHumano.flip_h = true
		$Centro/Cena/CorpoHumano.flip_h = true
		$Centro/Cena/CorpoHumano.position = Vector2(30, 0)
		$Centro/Cena/Parte3/Texto.text = "ParteVulva"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Contorno_arrastarParte(event):
	if event is InputEventScreenTouch:
		if arrastar:
			arrastar = false
			if estado == null:
				$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(1, 1)
				$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.position = Vector2(740, 150)
			else:
				if estado:
					$AudioAcerto.play()
					print("huhuehuhuhuhuhuhu  ", ultimaParte)
					get_node("Centro/").get_node(ultimaParte).get_node("Contorno").border_color = Color(1, 0, 0, 1)
					quantiadePartesPrivadads += 1
					if quantiadePartesPrivadads < 4:
						$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(1, 1)
						$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.position = Vector2(740, 150)
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
					$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale  = Vector2(1, 1)
					$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.position  = Vector2(740, 150)
					$AudioErro.play()
					$Camera/Animar.play("Tremer")
		else:
			arrastar = true
			$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Audio.play()
			$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(0.9, 0.9)
	if event is InputEventMouseMotion and arrastar:		
		$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.global_position = event.global_position
	pass # Replace with function body.



#func _on_Area_contornoEntrou(area):
#	if area.get_parent().get_parent().visible:
#		if area.get_parent().get_node("Texto").text == "PartePenis" or \
#		area.get_parent().get_node("Texto").text == "ParteNadega" or \
#		area.get_parent().get_node("Texto").text == "ParteVulva" or \
#		area.get_parent().get_node("Texto").text == "ParteBoca" or \
#		area.get_parent().get_node("Texto").text == "ParteAnus" and \
#		area.get_parent().get_parent().visible and area.get_parent().get_node("Contorno").border_color == Color(0, 0, 0, 1):
#			print("Parte Privada: ", area.get_parent().get_node("Texto").text)
#			if area.get_parent().get_node("Texto").text == "ParteVulva" or \
#			area.get_parent().get_node("Texto").text == "ParteBoca":
#				ultimaParte = str("Cena/"+area.get_parent().name)
#				estado = true
#			else:
#				ultimaParte = str("Tras/"+area.get_parent().name)
#				estado = true
#		else:
#			print("Parte Pública: ", area.get_parent().get_node("Texto").text)
#			estado = false
#	pass # Replace with function body.


func _on_Area_contornoSaiu(area):
	ultimaParte = ""
	estado = null
	pass # Replace with function body.



func _on_Area_ParteEntrou(area):
	if area.get_parent().get_parent().visible and area.get_parent().get_node("Contorno").border_color != Color(1, 0, 0, 1):
		if area.get_parent().get_node("Texto").text == "PartePenis" or \
		area.get_parent().get_node("Texto").text == "ParteNadega" or \
		area.get_parent().get_node("Texto").text == "ParteVulva" or \
		area.get_parent().get_node("Texto").text == "ParteBoca" or \
		area.get_parent().get_node("Texto").text == "ParteAnus" and \
		area.get_parent().get_parent().visible and area.get_parent().get_node("Contorno").border_color == Color(0, 0, 0, 1):
			print("Parte Privada: ", area.get_parent().get_node("Texto").text)
			if area.get_parent().get_node("Texto").text == "ParteVulva" or \
			area.get_parent().get_node("Texto").text == "ParteBoca":
				ultimaParte = str("Cena/"+area.get_parent().name)
				estado = true
			else:
				ultimaParte = str("Tras/"+area.get_parent().name)
				estado = true
		else:
			print("Parte Pública: ", area.get_parent().get_node("Texto").text)
			estado = false
	pass # Replace with function body.

func _on_ControleDeslizanteVertical_trocar(valor):
	print(valor)
	$Centro/Cena.position.y =  -valor
	$Centro/Tras.position.y =  -valor
	pass # Replace with function body.
