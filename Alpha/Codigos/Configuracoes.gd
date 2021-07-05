extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (Resource) var salvar


# Called when the node enters the scene tree for the first time.
func _ready():
#	carregarTela()
	$CantoSuperiorDireito/BotaoConfiguracoes/Icone.texture = load("res://Elementos/Visuais/Icones/Engrenagem.svg")
	$CantoSuperiorDireito/BotaoConfiguracoes/Icone.self_modulate = Color(0, 0.9, 0.9, 1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func carregarTela():
	if not salvar.Identificador:
		if get_tree().change_scene("res://Cenas/TelaCarregamento.tscn") == OK:
			print("Jogador nao encontrado, indo para tela de carregamento!")
	else:
		if get_tree().change_scene(salvar.Cena) == OK:
			print("Cena carregada com sucesso!")
	pass
