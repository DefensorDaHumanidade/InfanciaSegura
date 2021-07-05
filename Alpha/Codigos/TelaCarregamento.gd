extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Configuracoes/CantoSuperiorDireito/BotaoConfiguracoes").visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TelaCarregamento_Destravar(evento):
	if evento is InputEventScreenTouch:
		if get_tree().change_scene("res://Cenas/TelaCadastro.tscn") == OK:
			Configuracoes.salvar.Cena = "res://Cenas/TelaCadastro.tscn"
			if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
				print("Salvado")
		get_node("/root/Configuracoes/CantoSuperiorDireito/BotaoConfiguracoes").visible = true
	pass # Replace with function body.
