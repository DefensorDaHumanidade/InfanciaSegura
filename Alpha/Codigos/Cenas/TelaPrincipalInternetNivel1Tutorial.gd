extends Control

const CenaTutorial = preload("res://Cenas/Objetos/AvisoFimTutorial.tscn")

func _ready():
	if not Carregar.FaseAtual: #VERIFICADOR DE INCONSISTENCIAS
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalInternet.tscn", self)
	else:
		get_node("Painel").atualizarPainel(1, 1)
	pass

func terminarTutorial():
	var Tutorial = CenaTutorial.instance()
	self.add_child(Tutorial)
	get_node("AvisoFimTutorial/CamadaSuperior/Fundo/Linha/Botao").TrocarTela = "TelaPrincipalInternetNivel"+Carregar.FaseAtual.substr(12)
	get_node("Centro/Painel/Lista/Baixo/Imagem4/Mao").visible = false
	get_node("AnimarTutorial").queue_free()
	pass
