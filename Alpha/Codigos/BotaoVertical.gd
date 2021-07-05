extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (String) var ProximaCena
export (bool) var TrocarCena = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print($ConteinerVertical/Texto.text)
	if $ConteinerVertical/Texto.text == "BotaoVoz":
		$ConteinerVertical/Icone.texture = load("res://Elementos/Visuais/Icones/Voz.svg")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BotaoVertical_Selecionado():
#	if not controle_auxiliar:
	print("Botao ", name, " pressionado!")
	$ConteinerVertical.modulate = Color(0.5, 0.5, 0.5, 1)
	$ConteinerVertical.rect_position.y = $ConteinerVertical.rect_position.y + 15
	pass # Replace with function body.


func _on_BotaoVertical_Solto():
#	if not toggle_mode:
	print("Botao ", name, " solto!")
	$ConteinerVertical.modulate = Color(1, 1, 1, 1)
	$ConteinerVertical.rect_position.y = $ConteinerVertical.rect_position.y - 15
	pass # Replace with function body.


func _on_BotaoVertical_Comando():
	print("Realizando acao do botao: ", name)
	if TrocarCena:
		if get_tree().change_scene(ProximaCena) == OK:
			Configuracoes.salvar.Cena = ProximaCena
			if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
				print("Cena salva: ", ProximaCena)
		else:
			print("Cena nao encontrada")
	pass # Replace with function body.


func _on_BotaoVertical_Modo(estado_botao):
	print("Estado do botao ", name, ": ", estado_botao)
	if estado_botao:
		print("Botao ", name, " pressionado!")
#		$ConteinerVertical.modulate = Color(0.5, 0.5, 0.5, 1)
#		$ConteinerVertical.rect_position.y = $ConteinerVertical.rect_position.y + 15
	else:
		print("Botao ", name, " solto!")
#		$ConteinerVertical.modulate = Color(1, 1, 1, 1)
#		$ConteinerVertical.rect_position.y = $ConteinerVertical.rect_position.y - 15
	pass # Replace with function body.


