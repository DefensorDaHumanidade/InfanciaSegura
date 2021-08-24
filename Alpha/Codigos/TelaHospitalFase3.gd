extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Toques			= [	"Bom_01", 
						"Ruim_01",
						"Bom_02",
						"Ruim_02",
						"Bom_03",
						"Ruim_03",
						"Bom_04",
						"Ruim_04",
						"Bom_05",
						"Ruim_05", ]
						

var Auxiliar			= [	"Bom_01", 
						"Ruim_01",
						"Bom_02",
						"Ruim_02",
						"Bom_03",
						"Ruim_03",
						"Bom_04",
						"Ruim_04",
						"Bom_05",
						"Ruim_05", ]

var arrastar = false
var estado = null

export (int) var indiceToque


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	indiceToque = 0
	Toques.shuffle()
	atualizarImagem()
	print("Ordem dos toques: ", Toques)
	
	Configuracoes.salvar.TempoAuxiliar = OS.get_unix_time()
	Configuracoes.salvar.HospitalErro3 = 0
	
	$Painel/Colunas/Pontuacao/Texto.text = "Figura"
	$Painel/Colunas/Pontuacao/Numero.text = str(indiceToque+1)+"/"+str(10)
	pass # Replace with function body.


func atualizarImagem():
	$Meio/Centro/Toque.texture = load("res://Elementos/Visuais/HospitalFase3/" + Toques[indiceToque] + str(".png"))
	#HospitalFase3_ToqueBom_01
	#EscolaFase1_Pergunta_01
#	Toque_01-Bom
	$Meio/Centro/Toque.scale = Vector2(1, 1)
	$Meio/Centro/Toque.position = Vector2(0, 0)
	
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr(str("HospitalFase3_Toque") + Toques[indiceToque])
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/HospitalFase3_Toque" + Toques[indiceToque] + ".mp3"))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	
	$Painel/Colunas/Pontuacao/Numero.text = str(indiceToque+1)+"/"+str(10)
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Toque_pressionado():
	$Meio/Centro/Toque.scale = Vector2(0.9, 0.9)
	pass # Replace with function body.


#func _on_Contorno_selecionado(event):
#	if event is InputEventScreenDrag or event is InputEventScreenTouch:
##	if event is InputEventScreenTouch:
##		$Meio/Centro/Toque.scale = Vector2(0.9, 0.9)
#		$Meio/Centro/Toque.global_position = event.position  + Vector2(500, 250)
#	else:
#		$Meio/Centro/Toque.scale = Vector2(1, 1)
#	pass # Replace with function body.

#
#func _input(clique):
#	if clique is InputEventScreenTouch && clique.pressed:
#		$Meio/Centro/Toque.scale = Vector2(0.9, 0.9)
#		$Meio/Centro/Toque.global_position = clique.position
		#blabla
#	if clique is InputEventMouseButton or clique is InputEventScreenTouch:
#		if clique is InputEventMouseMotion or clique is InputEventScreenDrag:
#			$Meio/Centro/Toque.scale = Vector2(0.9, 0.9)
#			$Meio/Centro/Toque.global_position = clique.position
#		else: 
#			print(clique)
#			$Meio/Centro/Toque.scale = Vector2(1, 1)
	
	pass



#var result = Configuracoes.get_node("BancoDados").request(Configuracoes.get_node("BancoDados").METHOD_POST, "https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", headers, query_string)
#header("Content-Length:". Filesize($cache_file));

func _on_Area_SelecionarImagem(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if arrastar:
			arrastar = false
			if estado == null:
				$Meio/Centro/Toque.scale = Vector2(1, 1)
				$Meio/Centro/Toque.position = Vector2(0, 0)
			else:
				if estado:
					$AudioAcerto.play()
#					var client = HTTPClient.new()
#					var fields = {"jogador" : Configuracoes.salvar.Identificador, "pergunta" : str(Auxiliar.find(Toques[indiceToque])+115), "veredito" : "2", "TI" : "0", "TF" : "0", "resposta" : "imagem certaa"}
#					var query_string = client.query_string_from_dict(fields)
#					var headers = ["Content-Type: application/x-www-form-urlencoded", "Content-Length: " + str(query_string.length())]
#					Configuracoes.get_node("BancoDados").request(HTTPClient.METHOD_POST, "https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", headers, query_string)


					var headers = ["Content-Type: application/json"]
					Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(Auxiliar.find(Toques[indiceToque])+115)+"&veredito="+"1"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"imagem certa")
#					Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(Auxiliar.find(Toques[indiceToque])+115)+"&veredito="+"1"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"imagem certa")
					indiceToque += 1
					if indiceToque < Toques.size():
						atualizarImagem()
					else:
						$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.text = ""
						get_node("Meio/Centro/Toque").queue_free()
						yield(get_tree().create_timer(1.0), "timeout")
						print("Acabaram as perguntas")
						Configuracoes.salvar.Cena = "res://Cenas/TelaHospitalEncerramentoFase3.tscn"
						if get_tree().change_scene("res://Cenas/TelaHospitalEncerramentoFase3.tscn") == OK:
							if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
								print("Cena salva!")
						else:
							get_tree().change_scene("res://Cenas/TelaHospital.tscn")
				else:
					$Meio/Centro/Toque.scale = Vector2(1, 1)
					$Meio/Centro/Toque.position = Vector2(0, 0)
					$AudioErro.play()
					$Camera/Animar.play("Tremer")
					Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(Auxiliar.find(Toques[indiceToque])+115)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"imagem errada")
					Configuracoes.salvar.HospitalErro3 += 1
		else:
			arrastar = true
			$Meio/Centro/Toque.scale = Vector2(0.9, 0.9)
		print(arrastar)
	if event is InputEventMouseMotion and arrastar:
		$Meio/Centro/Toque.global_position = event.position
	
	
	
	
	
	

#	if selecaoImagem:
#		$Meio/Centro/Toque.scale = Vector2(0.9, 0.9)
#		$Meio/Centro/Toque.global_position = event.position
		
#	if event is InputEventScreenTouch && event.pressed:
#		$Meio/Centro/Toque.scale = Vector2(0.9, 0.9)
#		$Meio/Centro/Toque.global_position = event.position
#	if event is InputEventScreenDrag and event.pressed:
#		$Meio/Centro/Toque.scale = Vector2(0.9, 0.9)
#		$Meio/Centro/Toque.global_position = event.position
#	else:
#		print(event)
#	lerp($Meio/Centro/Toque.global_position, event.position, 15)
	pass # Replace with function body.



func _on_ToqueBom_entrou(area):
	print(area)
	if Toques[indiceToque][0] == "B":
		print("Toque no lugar certo")
		estado = true
	else:
		print("Toque no lugar errado")
		estado = false
	pass # Replace with function body.


func _on_ToqueBom_saiu(area):
	estado = null
	pass # Replace with function body.


func _on_ToqueRuim_entrou(area):
	if Toques[indiceToque][0] == "R":
		print("Toque no lugar certo")
		estado = true
	else:
		print("Toque no lugar errado")
		estado = false
	pass # Replace with function body.


func _on_ToqueRuim_saiu(area):
	estado = null
	pass # Replace with function body.
