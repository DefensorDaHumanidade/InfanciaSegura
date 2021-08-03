extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var Partes			= [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,25,26,27,28]

var arrastar = false
var estado = null

var nomePeca

var tempo


export (int) var indicePartes

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
		
	
	randomize()
	indicePartes = 0
	Partes.shuffle()
	for indice in range(0, Partes.size()/2):
		if Partes[indice] < 17:
			get_node("Centro/Cena/").get_node("Parte"+str(Partes[indice])).get_node("Texto").visible = false
			get_node("Centro/Cena/").get_node("Parte"+str(Partes[indice])).get_node("Auxiliar").text = "1"
		else:
			get_node("Centro/Tras/").get_node("Parte"+str(Partes[indice])).get_node("Texto").visible = false
			get_node("Centro/Tras/").get_node("Parte"+str(Partes[indice])).get_node("Auxiliar").text = "1"


	atualizarParte()
	
	Configuracoes.salvar.TempoAuxiliar = OS.get_unix_time()
	Configuracoes.salvar.HospitalErro1 = 0
	pass # Replace with function body.



func atualizarParte():
#	$CentroNascimento/PecaMural.position = $CentroNascimento.rect_pivot_offset
#	print($PecaMural.position)
#	$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto.text = str(Partes[indicePartes])
	if Partes[indicePartes] < 17: 
		$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto.text = get_node("Centro/Cena").get_node("Parte"+str(Partes[indicePartes])).get_node("Texto").text
		$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(1, 1)
		$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.position = Vector2(740, 150)
		
	#	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr(str("HospitalFase1_") + Partes[indicePartes])
	#	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	#	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	else:
		$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto.text = get_node("Centro/Tras").get_node("Parte"+str(Partes[indicePartes])).get_node("Texto").text
		$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(1, 1)
		$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.position = Vector2(740, 150)

	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(false)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/HospitalFase1_Parte" + str(Partes[indicePartes]) + ".mp3"))
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
					if Partes[indicePartes] < 17: 
						get_node("Centro/Cena").get_node("Parte"+str(Partes[indicePartes])).get_node("Texto").visible = true
					else:
						get_node("Centro/Tras").get_node("Parte"+str(Partes[indicePartes])).get_node("Texto").visible = true
					indicePartes += 1
#					Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(1)+"&veredito="+"1"+"&TI="+str(tempo)+"&TF="+"0"+"&resposta="+$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto.text+"colocado no"+nomePeca)
					if indicePartes < Partes.size()/2:
						atualizarParte()
					else:
						$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.text = "cabooooooo"
						$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.queue_free()
						yield(get_tree().create_timer(1.0), "timeout")
						print("Acabaram as perguntas")
						Configuracoes.salvar.Cena = "res://Cenas/TelaHospitalEncerramentoFase1.tscn"
						if get_tree().change_scene("res://Cenas/TelaHospitalEncerramentoFase1.tscn") == OK:
							if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
								print("Cena salva!")
						else:
							get_tree().change_scene("res://Cenas/TelaHospital.tscn")
				else:
					$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(1, 1)
					$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.position =Vector2(740, 150)
					
					$AudioErro.play()
					$Camera/Animar.play("Tremer")
					Configuracoes.salvar.HospitalErro1 += 1
		else:
			arrastar = true
			$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Audio.play()
			$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(0.9, 0.9)
	if event is InputEventMouseMotion and arrastar:		
		$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.global_position = event.global_position
	pass # Replace with function body.


func _on_Area_entrou(area):
	if area.get_parent().get_parent().visible: 
		print("Entrou: ", area.get_parent().get_node("Texto").text)
		if get_node("CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto").text == area.get_parent().get_node("Texto").text:
			estado = true
		else:
			if area.get_parent().get_node("Texto").visible == false:
				estado = false
			else:
				estado = null
	pass # Replace with function body.


func _on_Area_saiu(area):
	if area.get_parent().get_parent().visible: 
		print("Saiu: ", area.get_parent().get_node("Texto").text)
		estado = null
	pass # Replace with function body.
