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
	
	Configuracoes.salvar.TempoAuxiliar = OS.get_unix_time()
	Configuracoes.salvar.HospitalErro2 = 0
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
#					print("huhuehuhuhuhuhuhu  ", ultimaParte)
					Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(114)+"&veredito="+"1"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"acertou "+get_node("Centro/").get_node(ultimaParte).get_node("Texto").text)

					get_node("Centro/").get_node(ultimaParte).get_node("Contorno").border_color = Color(1, 0, 0, 1)
					quantiadePartesPrivadads += 1
					if quantiadePartesPrivadads < 4:
						$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(1, 1)
						$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.position = Vector2(740, 150)
					else:
						$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.text = "Fim"
						$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.queue_free()
						yield(get_tree().create_timer(1.0), "timeout")
						print("Acabaram as perguntas")
						Configuracoes.salvar.Cena = "res://Cenas/TelaHospitalEncerramentoFase2.tscn"
						if get_tree().change_scene("res://Cenas/TelaHospitalEncerramentoFase2.tscn") == OK:
							if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
								print("Cena salva!")
						else:
							get_tree().change_scene("res://Cenas/TelaHospital.tscn")
				else:
					$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale  = Vector2(1, 1)
					$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.position  = Vector2(740, 150)
					$AudioErro.play()
					$Camera/Animar.play("Tremer")
					Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(114)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"errou "+get_node("Centro/").get_node(ultimaParte).get_node("Texto").text)
					Configuracoes.salvar.HospitalErro2 += 1
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
			area.get_parent().get_node("Texto").text == "PartePenis" or \
			area.get_parent().get_node("Texto").text == "ParteBoca":
				ultimaParte = str("Cena/"+area.get_parent().name)
				estado = true
			else:
				ultimaParte = str("Tras/"+area.get_parent().name)
				estado = true
		else:
			print("Parte Pública: ", area.get_parent().get_node("Texto").text)
			ultimaParte = str(area.get_parent().get_parent().name+"/"+area.get_parent().name)
			estado = false
	pass # Replace with function body.

func _on_ControleDeslizanteVertical_trocar(valor):
	print(valor)
	$Centro/Cena.position.y =  -valor
	$Centro/Tras.position.y =  -valor
	pass # Replace with function body.
