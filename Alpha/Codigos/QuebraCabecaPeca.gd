extends Sprite


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



func _on_Area_arrastarPeca(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if arrastar:
			arrastar = false
			if get_node("/root/TelaDelegaciaFase2").estado == false:
				print("Nao faz nada")
				return
			else:
				if get_node("/root/TelaDelegaciaFase2").estado:
					arrastar = false
					if get_node("/root/TelaDelegaciaFase2/AreaTrabalho/Centro/Imagem/Fundo").has_node(peca):
						get_node("/root/TelaDelegaciaFase2/AreaTrabalho/Centro/Imagem/Fundo").get_node(peca).get_node("Fundo").modulate = Color (1, 1, 1, 0)
						get_node("/root/TelaDelegaciaFase2/AreaTrabalho/Centro/Imagem/Fundo").get_node(peca).modulate = Color (1, 1, 1, 1)
						get_node("/root/TelaDelegaciaFase2").contador += 1
						print(get_node("/root/TelaDelegaciaFase2").contador)
					else:
						print("Deu problema!!!")
#					$Peca_01/Fundo.color = Color(0,0,0,0)
					self.queue_free()
					if get_node("/root/TelaDelegaciaFase2").contador > 15:
						get_node("/root/TelaDelegaciaFase2/AudioAcerto").play()
						yield(get_tree().create_timer(4), "timeout")
						get_tree().change_scene("res://Cenas/TelaDelegacia.tscn")
					
#					get_node("Centro/Cena").get_node(Partes[indicePartes]).get_node("Texto").visible = true
#					indicePartes += 1
#					if indicePartes < Partes.size()/2:
#						atualizarParte()
#					else:
#						$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.text = "cabooooooo"
#						$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.queue_free()
#						yield(get_tree().create_timer(1.0), "timeout")
#						print("Acabaram as perguntas")
#						Configuracoes.salvar.Cena = "res://Cenas/TelaHospital.tscn"
#						if get_tree().change_scene("res://Cenas/TelaHospital.tscn") == OK:
#							if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
#								print("Cena salva!")
#						get_tree().change_scene("res://Cenas/TelaHospital.tscn")
#				else:
#					$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.scale = Vector2(1, 1)
#					$CaixaDialogo/Margem/Elementos/Campo/Margem/PecaMural.position =Vector2(740, 150)
#					$AudioErro.play()
#					$Camera/Animar.play("Tremer")
		else:
			arrastar = true
	if event is InputEventMouseMotion and arrastar:
		self.global_position = event.position
#		print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk: ", self.name)
	pass # Replace with function body.


func _on_Area_achou(area):
#	get_node("/root/TelaDelegaciaFase2").verificaSobreposicao()
	if not area.name == "QuebraCabecaFragmento":
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




func _on_Contorno_arrastar(event):
	if event is InputEventScreenTouch:
		if arrastar:
			arrastar = false
			if get_node("/root/TelaDelegaciaFase2").estado == false:
				print("Nao faz nada")
				return
			else:
				if get_node("/root/TelaDelegaciaFase2").estado:
					$Audio.play()
					yield($Audio, "finished")
					arrastar = false
					if get_node("/root/TelaDelegaciaFase2/AreaTrabalho/Centro/Imagem/Fundo").has_node(peca):
						get_node("/root/TelaDelegaciaFase2/AreaTrabalho/Centro/Imagem/Fundo").get_node(peca).get_node("Fundo").modulate = Color (1, 1, 1, 0)
						get_node("/root/TelaDelegaciaFase2/AreaTrabalho/Centro/Imagem/Fundo").get_node(peca).modulate = Color (1, 1, 1, 1)
						get_node("/root/TelaDelegaciaFase2").contador += 1
						print(get_node("/root/TelaDelegaciaFase2").contador)
						get_node("/root/TelaDelegaciaFase2").estado = false
					else:
						print("Deu problema!!!")
#					$Peca_01/Fundo.color = Color(0,0,0,0)
					self.queue_free()
					if get_node("/root/TelaDelegaciaFase2").contador > 15:
#						get_node("/root/TelaDelegaciaFase2/AudioAcerto").play()
#						yield(get_tree().create_timer(2), "timeout")
						get_tree().change_scene("res://Cenas/TelaDelegaciaEncerramentoFase2.tscn")
					
		else:
			arrastar = true
	if event is InputEventMouseMotion and arrastar:
		self.global_position = event.global_position
	pass # Replace with function body.
