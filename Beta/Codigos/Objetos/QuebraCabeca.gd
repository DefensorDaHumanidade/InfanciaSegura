extends Sprite

const CenaTutorial = preload("res://Cenas/Objetos/AvisoFimTutorial.tscn")

export (bool) var Movimentar
export (int) var NumeroPecas

var posicaoInicial = Vector2.ZERO
var arrastar = false
var resposta = null
var nomeResposta

func _ready():
	if not NumeroPecas:
		NumeroPecas = 4
	self.hframes = NumeroPecas
	self.vframes = NumeroPecas
	$Area.position = $Transparencia.rect_size/2
	$Area/Contato.shape.extents = $Transparencia.rect_size/5
	pass


func _arrastarQuebraCabeca(evento):
	if not Movimentar:
		return
	if evento is InputEventScreenTouch:
		if arrastar:
			arrastar = false
			self.scale = Vector2(0.18, 0.18)
			verificarRespostas()
		else:
			arrastar = true
			$Som.play()
			self.scale = Vector2(0.175, 0.175)
			posicaoInicial = evento.position
	if evento is InputEventMouseMotion and arrastar:
		self.set_global_position(evento.global_position-posicaoInicial/5)
	pass


func verificarRespostas():
	if resposta == true:
		self.visible = false
		nomeResposta.get_parent().get_node("Area").queue_free()
		nomeResposta.get_parent().get_node("Transparencia").color = Color(1.0, 1.0, 1.0, 0.0)
		if get_node_or_null("/root/TelaDelegaciaFase2"):
			get_node("/root/TelaDelegaciaFase2").Indice += 1
			if get_node("/root/TelaDelegaciaFase2").Indice >= NumeroPecas*NumeroPecas:
				yield(get_tree().create_timer(1.5), "timeout")
				get_node("/root/TelaDelegaciaFase2").terminarJogo()
			self.queue_free()
		else:
			terminarTutorial()
	if resposta == false:
		pass
	pass

func _AreaEntrou(area):
	if not Movimentar:
		return
	if self.frame == area.get_parent().frame:
		nomeResposta = area
		resposta = true
	else:
		nomeResposta = area
		resposta = false
	pass

func _AreaSaiu(_area):
	if not Movimentar:
		return
	resposta = null
	pass

func terminarTutorial():
	var Tutorial = CenaTutorial.instance()
	self.add_child(Tutorial)
	get_node("AvisoFimTutorial/CamadaSuperior/Fundo/Linha/Botao").TrocarTela = "TelaPrincipalDelegaciaNivel2"
	get_node("/root/TelaDelegaciaFase2Tutorial/ZonaMontagem/Mao").visible = false
	get_node("/root/TelaDelegaciaFase2Tutorial/ZonaMontagem/QuebraCabecaTransparente").visible = false
	get_node("/root/TelaDelegaciaFase2Tutorial/AnimarTutorial").queue_free()
	pass
