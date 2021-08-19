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
		Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(134)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"tempo= "+str(Configuracoes.salvar.HospitalTempo1)+ " | erros= "+str(Configuracoes.salvar.HospitalErro1))
		
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
		Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(135)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"tempo= "+str(Configuracoes.salvar.HospitalTempo2)+ " | erros= "+str(Configuracoes.salvar.HospitalErro2))
		
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
		Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(136)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"tempo= "+str(Configuracoes.salvar.HospitalTempo3)+ " | erros= "+str(Configuracoes.salvar.HospitalErro3))
	
	if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
		print("Dados salvos!")
	pass # Replace with function body.

#var fields = {"username" : "user", "password" : "pass"}
#var query_string = Configuracoes.get_node("BancoDados").query_string_from_dict(fields)
#var headers = ["Content-Type: application/x-www-form-urlencoded", "Content-Length: " + str(query_string.length())]
#var result = Configuracoes.get_node("BancoDados").request(Configuracoes.get_node("BancoDados").METHOD_POST, "https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", headers, query_string)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
