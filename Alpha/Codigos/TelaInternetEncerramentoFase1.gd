extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if name == "TelaInternetEncerramentoFase1":
		Configuracoes.salvar.InternetTempo1 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		if Configuracoes.salvar.InternetTempo1 < Configuracoes.salvar.InternetMenorTempo1 or Configuracoes.salvar.InternetMenorTempo1 <= 0: 
			Configuracoes.salvar.InternetMenorTempo1 = Configuracoes.salvar.InternetTempo1
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = false
		
		if Configuracoes.salvar.InternetErro1 < Configuracoes.salvar.InternetMenorErro1 or Configuracoes.salvar.InternetErro1 == 999:
			Configuracoes.salvar.InternetMenorErro1 = Configuracoes.salvar.InternetErro1
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = false
		
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Coluna/Valor.text = str(Configuracoes.salvar.InternetErro1)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/ColunaMenor/Valor.text = str(Configuracoes.salvar.InternetMenorErro1)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Coluna/Valor.text = str(Configuracoes.salvar.InternetTempo1, " s")
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/ColunaMenor/Valor.text = str(Configuracoes.salvar.InternetMenorTempo1, " s")
		Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(131)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"tempo= "+str(Configuracoes.salvar.InternetTempo1)+ " | erros= "+str(Configuracoes.salvar.InternetErro1))

		
		
	if name == "TelaInternetEncerramentoFase2":
		Configuracoes.salvar.InternetTempo2 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		
		if Configuracoes.salvar.InternetTempo2 < Configuracoes.salvar.InternetMenorTempo2 or Configuracoes.salvar.InternetMenorTempo2 <= 0: 
			Configuracoes.salvar.InternetMenorTempo2 = Configuracoes.salvar.InternetTempo2
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = false
		
		if Configuracoes.salvar.InternetErro2 < Configuracoes.salvar.InternetMenorErro2 or Configuracoes.salvar.InternetErro2 == 999:
			Configuracoes.salvar.InternetMenorErro2 = Configuracoes.salvar.InternetErro2
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = false
		
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Coluna/Valor.text = str(Configuracoes.salvar.InternetErro2)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/ColunaMenor/Valor.text = str(Configuracoes.salvar.InternetMenorErro2)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Coluna/Valor.text = str(Configuracoes.salvar.InternetTempo2, " s")
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/ColunaMenor/Valor.text = str(Configuracoes.salvar.InternetMenorTempo2, " s")
		Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(132)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"tempo= "+str(Configuracoes.salvar.InternetTempo2)+ " | erros= "+str(Configuracoes.salvar.InternetErro2))
		
		
	if name == "TelaInternetEncerramentoFase3":
		Configuracoes.salvar.InternetTempo3 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		
		if Configuracoes.salvar.InternetTempo3 < Configuracoes.salvar.InternetMenorTempo3 or Configuracoes.salvar.InternetMenorTempo3 <= 0: 
			Configuracoes.salvar.InternetMenorTempo3 = Configuracoes.salvar.InternetTempo3
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = false
		
		if Configuracoes.salvar.InternetErro3 < Configuracoes.salvar.InternetMenorErro3 or Configuracoes.salvar.InternetErro3 == 999:
			Configuracoes.salvar.InternetMenorErro3 = Configuracoes.salvar.InternetErro3
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = false
		
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Coluna/Valor.text = str(Configuracoes.salvar.InternetErro3)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/ColunaMenor/Valor.text = str(Configuracoes.salvar.InternetMenorErro3)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Coluna/Valor.text = str(Configuracoes.salvar.InternetTempo3, " s")
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/ColunaMenor/Valor.text = str(Configuracoes.salvar.InternetMenorTempo3, " s")
		Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(133)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"tempo= "+str(Configuracoes.salvar.InternetTempo3)+ " | erros= "+str(Configuracoes.salvar.InternetErro3))
	
	if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
		print("Dados salvos!")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
