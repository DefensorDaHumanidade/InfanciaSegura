extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if name == "TelaEscolaEncerramentoFase1":
		Configuracoes.salvar.EscolaTempo1 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		
		if Configuracoes.salvar.EscolaTempo1 < Configuracoes.salvar.EscolaMenorTempo1 or Configuracoes.salvar.EscolaMenorTempo1 <= 0: 
			Configuracoes.salvar.EscolaMenorTempo1 = Configuracoes.salvar.EscolaTempo1
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = false
		
		if Configuracoes.salvar.EscolaErro1 < Configuracoes.salvar.EscolaMenorErro1 or Configuracoes.salvar.EscolaErro1 == 999:
			Configuracoes.salvar.EscolaMenorErro1 = Configuracoes.salvar.EscolaErro1
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = false
		
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Coluna/Valor.text = str(Configuracoes.salvar.EscolaErro1)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/ColunaMenor/Valor.text = str(Configuracoes.salvar.EscolaMenorErro1)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Coluna/Valor.text = str(Configuracoes.salvar.EscolaTempo1, " s")
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/ColunaMenor/Valor.text = str(Configuracoes.salvar.EscolaMenorTempo1, " s")
		Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(125)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"tempo= "+str(Configuracoes.salvar.EscolaTempo1)+ " | erros= "+str(Configuracoes.salvar.EscolaErro1))
	
	if name == "TelaEscolaEncerramentoFase2":
		Configuracoes.salvar.EscolaTempo2 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		
		if Configuracoes.salvar.EscolaTempo2 < Configuracoes.salvar.EscolaMenorTempo2 or Configuracoes.salvar.EscolaMenorTempo2 <= 0: 
			Configuracoes.salvar.EscolaMenorTempo2 = Configuracoes.salvar.EscolaTempo2
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = false
		
		if Configuracoes.salvar.EscolaErro2 < Configuracoes.salvar.EscolaMenorErro2 or Configuracoes.salvar.EscolaErro2 == 999:
			Configuracoes.salvar.EscolaMenorErro2 = Configuracoes.salvar.EscolaErro2
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = false
		
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Coluna/Valor.text = str(Configuracoes.salvar.EscolaErro2)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/ColunaMenor/Valor.text = str(Configuracoes.salvar.EscolaMenorErro2)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Coluna/Valor.text = str(Configuracoes.salvar.EscolaTempo2, " s")
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/ColunaMenor/Valor.text = str(Configuracoes.salvar.EscolaMenorTempo2, " s")
		Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(126)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"tempo= "+str(Configuracoes.salvar.EscolaTempo2)+ " | erros= "+str(Configuracoes.salvar.EscolaErro2))
	
	if name == "TelaEscolaEncerramentoFase3":
		Configuracoes.salvar.EscolaTempo3 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		
		if Configuracoes.salvar.EscolaTempo3 < Configuracoes.salvar.EscolaMenorTempo3 or Configuracoes.salvar.EscolaMenorTempo3 <= 0: 
			Configuracoes.salvar.EscolaMenorTempo3 = Configuracoes.salvar.EscolaTempo3
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = false
		
		if Configuracoes.salvar.EscolaErro3 < Configuracoes.salvar.EscolaMenorErro3 or Configuracoes.salvar.EscolaErro3 == 999:
			Configuracoes.salvar.EscolaMenorErro3 = Configuracoes.salvar.EscolaErro3
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = false
		
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Coluna/Valor.text = str(Configuracoes.salvar.EscolaErro3)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/ColunaMenor/Valor.text = str(Configuracoes.salvar.EscolaMenorErro3)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Coluna/Valor.text = str(Configuracoes.salvar.EscolaTempo3, " s")
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/ColunaMenor/Valor.text = str(Configuracoes.salvar.EscolaMenorTempo3, " s")
		Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(127)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"tempo= "+str(Configuracoes.salvar.EscolaTempo3)+ " | erros= "+str(Configuracoes.salvar.EscolaErro3))
	if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
		print("Dados salvos!")
		
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
