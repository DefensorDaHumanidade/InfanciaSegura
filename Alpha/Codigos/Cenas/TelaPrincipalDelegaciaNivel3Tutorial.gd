extends Control

const CenaTutorial = preload("res://Cenas/Objetos/AvisoFimTutorial.tscn")

func _ready():
	pass

func terminarTutorial():
	var Tutorial = CenaTutorial.instance()
	self.add_child(Tutorial)
	get_node("AvisoFimTutorial/CamadaSuperior/Fundo/Linha/Botao").TrocarTela = "TelaPrincipalDelegaciaNivel3"
	get_node("Cidade/Tutorial/Mao").visible = false
	get_node("AnimarTutorial").queue_free()
	yield(get_tree().create_timer(3.5), "timeout")
	Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalDelegaciaNivel3.tscn", get_tree().get_current_scene())
	pass

func _selecionarTutorial(evento):
	if evento is InputEventMouseButton or evento is InputEventScreenTouch:
		terminarTutorial()
	pass
