extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Partes			= [	"Cena/Parte1", 
						"Cena/Parte2",
						"Cena/Parte3",
						"Cena/Parte4",
						"Cena/Parte5",
						"Cena/Parte6",
						"Cena/Parte7",
						"Cena/Parte8",
						"Cena/Parte9",
						"Cena/Parte10",
						"Cena/Parte11",
						"Cena/Parte12",
						"Cena/Parte13",
						"Cena/Parte14",
						"Cena/Parte15",
						"Cena/Parte16",
						"Tras/Parte1",
						"Tras/Parte2",
						"Tras/Parte3",
						"Tras/Parte4",
						"Tras/Parte5",
						"Tras/Parte6",
						"Tras/Parte7",
						"Tras/Parte8",
						"Tras/Parte9",
						"Tras/Parte10",
						"Tras/Parte11",
						"Tras/Parte12" ]

var arrastar = false
var estado = null

var nomePeca

var tempo


export (int) var indicePartes

# Called when the node enters the scene tree for the first time.
func _ready():
	
	randomize()
	indicePartes = 0
	Partes.shuffle()
	print(Partes)
	for indice in range(0, Partes.size()/2):
		get_node("Centro").get_node(Partes[indice]).get_node("Texto").visible = false
#	$Centro/Cena/Parte1/Texto.visible = false
	atualizarParte()
#	$CaixaDialogo/Margem/Elementos/BotaoDireita/ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/Frente.svg")
	pass # Replace with function body.


func atualizarParte():
#	$CentroNascimento/PecaMural.position = $CentroNascimento.rect_pivot_offset
#	print($PecaMural.position)
#	$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto.text = str(Partes[indicePartes])
	$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto.text = get_node("Centro").get_node(Partes[indicePartes]).get_node("Texto").text
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
					get_node("Centro").get_node(Partes[indicePartes]).get_node("Texto").visible = true
					indicePartes += 1
#					Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(1)+"&veredito="+"1"+"&TI="+str(tempo)+"&TF="+"0"+"&resposta="+$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto.text+"colocado no"+nomePeca)
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
#					Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(1)+"&veredito="+"0"+"&TI="+str(tempo)+"&TF="+"0"+"&resposta="+$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Toque/Texto.text+"colocado no"+nomePeca)

		else:
			arrastar = true
			$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural/Audio.play()
			$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(0.9, 0.9)
		print(arrastar)
	if event is InputEventMouseMotion and arrastar:		
		$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.global_position = event.position
	pass # Replace with function body.


