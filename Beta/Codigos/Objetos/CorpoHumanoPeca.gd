extends ColorRect

export (bool) var PartePrivada
export (bool) var Movimentar
export (String) var Nome

var posicaoInicial = Vector2.ZERO
var arrastar = false
var resposta = null
var nomeResposta

func _ready():
	posicaoInicial = self.rect_position
	if not Nome:
		if Carregar.Dados.Genero == "Menina":
			Nome = "ParteVulva"
		else:
			Nome = "PartePenis"
	$Texto.text = Nome
	
	if PartePrivada and Carregar.FaseAtual == "HospitalFase1":
		$Contorno.border_color = Color(1.0, 0.0, 0.0, 1.0)
	
	pass

func _arrastarPeca(evento):
	if not Movimentar:
		return
	if evento is InputEventScreenTouch:
		if arrastar:
			arrastar = false
			self.rect_scale = Vector2(1, 1)
			self.rect_position = posicaoInicial
			verificarRespostas()
		else:
			arrastar = true
			$Som.play()
			self.rect_scale = Vector2(0.9, 0.9)
			self.rect_pivot_offset = evento.position
	if evento is InputEventMouseMotion and arrastar:
		self.set_global_position(evento.global_position-Vector2(self.rect_pivot_offset))
	pass

func verificarRespostas():

	if Carregar.FaseAtual == "HospitalFase1" and not get_node_or_null("/root/TelaHospitalFase1Tutorial"):
		if resposta == false:
			$AudioErro.play()
			get_node("/root/TelaHospitalFase1").ErrosCometidos += 1
			get_node("/root/TelaHospitalFase1/Camera/Animar").play("TemerCamera")
			get_node("/root/TelaHospitalFase1").enviarBancoDados("0", "Errou: "+nomeResposta.get_parent().get_node("Texto").text)
		if resposta == true:
			$AudioAcerto.play()
			self.visible = false
			get_node("/root/TelaHospitalFase1").enviarBancoDados("1", "Acertou: "+nomeResposta.get_parent().get_node("Texto").text)
			nomeResposta.get_parent().get_node("Texto").visible = true
			get_node("/root/TelaHospitalFase1").AtualizarPeca()
			yield($AudioAcerto, "finished") 
			self.queue_free()
	if Carregar.FaseAtual == "HospitalFase1" and get_node_or_null("/root/TelaHospitalFase1Tutorial"):
		if resposta == false:
			$AudioErro.play()
			get_node("/root/TelaHospitalFase1Tutorial").ErrosCometidos += 1
			get_node("/root/TelaHospitalFase1Tutorial/Camera/Animar").play("TemerCamera")
		if resposta == true:
			$AudioAcerto.play()
			self.visible = false
			nomeResposta.get_parent().get_node("Texto").visible = true
			get_node("/root/TelaHospitalFase1Tutorial").terminarTutorial()
			yield($AudioAcerto, "finished")
		pass
	
	if Carregar.FaseAtual == "HospitalFase2" and not get_node_or_null("/root/TelaHospitalFase2Tutorial"):
		if resposta == false:
			$AudioErro.play()
			get_node("/root/TelaHospitalFase2").ErrosCometidos += 1
			get_node("/root/TelaHospitalFase2/Camera/Animar").play("TemerCamera")
			get_node("/root/TelaHospitalFase2").enviarBancoDados("0", "Errou: "+nomeResposta.get_parent().get_node("Texto").text)
		if resposta == true:
			nomeResposta.get_parent().get_node("Contorno").border_color = Color(1.0, 0.0, 0.0, 1.0)
			nomeResposta.get_parent().PartePrivada = false
			$AudioAcerto.play()
			self.visible = false
			get_node("/root/TelaHospitalFase2").enviarBancoDados("1", "Acertou: "+nomeResposta.get_parent().get_node("Texto").text)
			get_node("/root/TelaHospitalFase2").AtualizarPeca()
			yield($AudioAcerto, "finished") 
			self.queue_free()
	if Carregar.FaseAtual == "HospitalFase2" and get_node_or_null("/root/TelaHospitalFase2Tutorial"):
		if resposta == false:
			$AudioErro.play()
			get_node("/root/TelaHospitalFase2Tutorial").ErrosCometidos += 1
			get_node("/root/TelaHospitalFase2Tutorial/Camera/Animar").play("TemerCamera")
		if resposta == true:
			nomeResposta.get_parent().get_node("Contorno").border_color = Color(1.0, 0.0, 0.0, 1.0)
			nomeResposta.get_parent().PartePrivada = false
			$AudioAcerto.play()
			self.visible = false
			get_node("/root/TelaHospitalFase2Tutorial").terminarTutorial()
			yield($AudioAcerto, "finished") 
			self.queue_free()
		pass
	
	
		pass
	pass

func _AreaEntrou(area):
	
	if (area.get_parent().get_parent().get_parent().visible) \
	and (area.get_parent().get_node("Texto").text != self.get_node("Texto").text) and \
	not (area.get_parent().get_node("Texto").visible) \
	and self.get_parent().name == "ZonaNascimento":
		nomeResposta = area
		resposta = false
	
	if (area.get_parent().get_parent().get_parent().visible) \
	and (area.get_parent().get_node("Texto").text == self.get_node("Texto").text) \
	and self.get_parent().name == "ZonaNascimento":
		nomeResposta = area
		resposta = true
	
	if (area.get_parent().get_parent().get_parent().visible) \
	and Carregar.FaseAtual == "HospitalFase2" and area.get_parent().PartePrivada and self.PartePrivada \
	and self.get_parent().name == "ZonaNascimento":
		nomeResposta = area
		resposta = true
	
	if (area.get_parent().get_parent().get_parent().visible) \
	and Carregar.FaseAtual == "HospitalFase2" and not area.get_parent().PartePrivada and self.PartePrivada \
	and self.get_parent().name == "ZonaNascimento":
		nomeResposta = area
		resposta = false
	pass

func _AreaSaiu(area):
	if area.get_parent().get_parent().get_parent().visible and \
	self.get_parent().name == "ZonaNascimento":
		resposta = null
	pass
	
