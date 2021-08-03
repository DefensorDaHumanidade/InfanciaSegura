extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if name == "TelaHospitalEncerramentoFase1":
		Configuracoes.salvar.HospitalTempo1 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		if Configuracoes.salvar.HospitalTempo1 < Configuracoes.salvar.HospitalMenorTempo1 or Configuracoes.salvar.HospitalMenorTempo1 <= 0: 
			Configuracoes.salvar.HospitalMenorTempo1 = Configuracoes.salvar.HospitalTempo1
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = false
		
		if Configuracoes.salvar.HospitalErro1 < Configuracoes.salvar.HospitalMenorErro1 or Configuracoes.salvar.HospitalErro1 == 999:
			Configuracoes.salvar.HospitalMenorErro1 = Configuracoes.salvar.HospitalErro1
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = false
		
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Coluna/Valor.text = str(Configuracoes.salvar.HospitalErro1)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/ColunaMenor/Valor.text = str(Configuracoes.salvar.HospitalMenorErro1)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Coluna/Valor.text = str(Configuracoes.salvar.HospitalTempo1, " s")
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/ColunaMenor/Valor.text = str(Configuracoes.salvar.HospitalMenorTempo1, " s")
	
	if name == "TelaHospitalEncerramentoFase2":
		Configuracoes.salvar.HospitalTempo2 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		
		if Configuracoes.salvar.HospitalTempo2 < Configuracoes.salvar.HospitalMenorTempo2 or Configuracoes.salvar.HospitalMenorTempo2 <= 0: 
			Configuracoes.salvar.HospitalMenorTempo2 = Configuracoes.salvar.HospitalTempo2
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = false
		
		if Configuracoes.salvar.HospitalErro2 < Configuracoes.salvar.HospitalMenorErro2 or Configuracoes.salvar.HospitalErro2 == 999:
			Configuracoes.salvar.HospitalMenorErro2 = Configuracoes.salvar.HospitalErro2
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = false
		
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Coluna/Valor.text = str(Configuracoes.salvar.HospitalErro2)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/ColunaMenor/Valor.text = str(Configuracoes.salvar.HospitalMenorErro2)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Coluna/Valor.text = str(Configuracoes.salvar.HospitalTempo2, " s")
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/ColunaMenor/Valor.text = str(Configuracoes.salvar.HospitalMenorTempo2, " s")
	
	if name == "TelaHospitalEncerramentoFase3":
		Configuracoes.salvar.HospitalTempo3 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		
		if Configuracoes.salvar.HospitalTempo3 < Configuracoes.salvar.HospitalMenorTempo3 or Configuracoes.salvar.HospitalMenorTempo3 <= 0: 
			Configuracoes.salvar.HospitalMenorTempo3 = Configuracoes.salvar.HospitalTempo3
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = false
		
		if Configuracoes.salvar.HospitalErro3 < Configuracoes.salvar.HospitalMenorErro3 or Configuracoes.salvar.HospitalErro3 == 999:
			Configuracoes.salvar.HospitalMenorErro3 = Configuracoes.salvar.HospitalErro3
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = false
		
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Coluna/Valor.text = str(Configuracoes.salvar.HospitalErro3)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/ColunaMenor/Valor.text = str(Configuracoes.salvar.HospitalMenorErro3)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Coluna/Valor.text = str(Configuracoes.salvar.HospitalTempo3, " s")
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/ColunaMenor/Valor.text = str(Configuracoes.salvar.HospitalMenorTempo3, " s")
	if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
		print("Dados salvos!")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass