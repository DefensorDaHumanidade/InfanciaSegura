extends Node2D

const CenaTutorial = preload("res://Cenas/Objetos/AvisoFimTutorial.tscn")

var arrastar = false
var resposta = null
var nomeResposta

func _ready():
	$Linha.add_point($Inicio.position)
	$Linha.add_point($Fim.position)
#	posicaoInicial = $Fim.position
#	set_process(false)
	pass

func _process(_delta):
	$Linha.points = []
	$Linha.add_point($Inicio.position)
	$Linha.add_point($Fim.position)
	pass


func _arrastarPino(evento):
	if not set_process(true):
		set_process(true)
	if evento is InputEventScreenTouch:
		if arrastar:
			arrastar = false
			$Fim.mode = RigidBody2D.MODE_RIGID
			verificarRespostas()
		else:
			arrastar = true
	if evento is InputEventMouseMotion and arrastar:
		$Fim.global_position = evento.global_position
		$Fim.mode = RigidBody2D.MODE_STATIC
	pass

func verificarRespostas():
	if resposta == true:
		self.get_node("Fim").mode = RigidBody2D.MODE_STATIC
		if get_node_or_null("/root/TelaDelegaciaFase1"):
			get_node("/root/TelaDelegaciaFase1").enviarBancoDados("1", self.get_parent().texture.get_path().substr(56, 1), nomeResposta.texture.get_path().substr(57, 1))
			get_node("/root/TelaDelegaciaFase1").respostaCerta(self.get_parent().texture.get_path().substr(56, 1))
		else:
			terminarTutorial()
	if resposta == false:
		if get_node_or_null("/root/TelaDelegaciaFase1"):
			get_node("/root/TelaDelegaciaFase1").enviarBancoDados("0", self.get_parent().texture.get_path().substr(56, 1), nomeResposta.texture.get_path().substr(57, 1))
			get_node("/root/TelaDelegaciaFase1").respostaErrada()
	pass

func _AreaEntrou(area):
	if area.get_parent().get_parent().name == "Pino":
		return
	if area.get_parent().texture.get_path().substr(57, 1) == self.get_parent().texture.get_path().substr(56, 1):
		nomeResposta = area.get_parent()
		resposta = true
	else:
		nomeResposta = area.get_parent()
		resposta = false
	pass

func _AreaSaiu(_area):
	resposta = null
	pass

func terminarTutorial():
	var Tutorial = CenaTutorial.instance()
	self.add_child(Tutorial)
	get_node("AvisoFimTutorial/CamadaSuperior/Fundo/Linha/Botao").TrocarTela = "TelaPrincipalDelegaciaNivel1"
	get_node("/root/TelaDelegaciaFase1Tutorial/ImagemAcerto/Audio").play()
	get_node("/root/TelaDelegaciaFase1Tutorial/Linha/ColunaSuperior/IconeTelefonico7/Mao").visible = false
	get_node("/root/TelaDelegaciaFase1Tutorial/Linha/ColunaSuperior/IconeTelefonico7/PinoTransparente").visible = false
	get_node("/root/TelaDelegaciaFase1Tutorial/AnimarTutorial").queue_free()
	pass
