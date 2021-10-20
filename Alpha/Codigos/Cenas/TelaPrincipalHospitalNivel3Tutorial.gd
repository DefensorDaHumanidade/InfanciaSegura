extends Control

const CenaTutorial = preload("res://Cenas/Objetos/AvisoFimTutorial.tscn")

var arrastar = false
var resposta = null

func _ready():
	if not Carregar.FaseAtual: #VERIFICADOR DE INCONSISTENCIAS
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalHospital.tscn", self)
	else:
		get_node("Painel").atualizarPainel(1, 1)
	pass

func _arrastarImagem(evento):
	if evento is InputEventScreenTouch:
		if arrastar:
			arrastar = false
			get_node("ZonaNascimento/Toque").rect_scale = Vector2(1, 1)
			get_node("ZonaNascimento/Toque").rect_position = Vector2(-200, 80)
			verificarRespostas()
		else:
			arrastar = true
			get_node("ZonaNascimento/Toque/Som").play()
			get_node("ZonaNascimento/Toque").rect_scale = Vector2(0.9, 0.9)
			get_node("ZonaNascimento/Toque").rect_pivot_offset = evento.position
	if evento is InputEventMouseMotion and arrastar:
		get_node("ZonaNascimento/Toque").set_global_position(evento.global_position-Vector2(get_node("ZonaNascimento/Toque").rect_pivot_offset))
	pass

func verificarRespostas():
	if resposta == true:
		$AudioAcerto.play()
		terminarTutorial()
		pass
	if resposta == false:
		$AudioErro.play()
		get_node("/root/TelaHospitalFase3Tutorial/Camera/Animar").play("TemerCamera")
		pass
	pass

func terminarTutorial():
	var Tutorial = CenaTutorial.instance()
	self.add_child(Tutorial)
	get_node("AvisoFimTutorial/CamadaSuperior/Fundo/Linha/Botao").TrocarTela = "TelaPrincipalHospitalNivel"+Carregar.FaseAtual.substr(12)
	get_node("ZonaNascimento").visible = false
	get_node("AnimarTutorial").queue_free()
	pass

func _AreaEntrou(area):
	
	if get_node("ZonaNascimento/Toque").texture.get_path().find("Bom") > 0 and area.get_parent().name.find("ToquesBons") == 0:
		resposta = true
	if get_node("ZonaNascimento/Toque").texture.get_path().find("Ruim") > 0 and area.get_parent().name.find("ToquesRuins") == 0:
		resposta = true
	
	if get_node("ZonaNascimento/Toque").texture.get_path().find("Bom") > 0 and area.get_parent().name.find("ToquesBons") != 0:
		resposta = false
	if get_node("ZonaNascimento/Toque").texture.get_path().find("Ruim") > 0 and area.get_parent().name.find("ToquesRuins") != 0:
		resposta = false
	pass


func _AreaSaiu(_area):
	resposta = null
	pass
