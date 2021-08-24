extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if name == "TelaDelegaciaEncerramentoFase1":
		Configuracoes.salvar.DelegaciaTempo1 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		if Configuracoes.salvar.DelegaciaTempo1 < Configuracoes.salvar.DelegaciaMenorTempo1 or Configuracoes.salvar.DelegaciaMenorTempo1 <= 0: 
			Configuracoes.salvar.DelegaciaMenorTempo1 = Configuracoes.salvar.DelegaciaTempo1
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = false
		
#		if Configuracoes.salvar.DelegaciaErro1 < Configuracoes.salvar.DelegaciaMenorErro1 or Configuracoes.salvar.DelegaciaErro1 == 999:
#			Configuracoes.salvar.DelegaciaMenorErro1 = Configuracoes.salvar.DelegaciaErro1
#			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = true
#		else:
#			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = false
#
#		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Coluna/Valor.text = str(Configuracoes.salvar.DelegaciaErro1)
#		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/ColunaMenor/Valor.text = str(Configuracoes.salvar.DelegaciaMenorErro1)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Coluna/Valor.text = str(Configuracoes.salvar.DelegaciaTempo1, " s")
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/ColunaMenor/Valor.text = str(Configuracoes.salvar.DelegaciaMenorTempo1, " s")
		Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(128)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"tempo= "+str(Configuracoes.salvar.DelegaciaTempo1))

	
	if name == "TelaDelegaciaEncerramentoFase2":
		Configuracoes.salvar.DelegaciaTempo2 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		
		if Configuracoes.salvar.DelegaciaTempo2 < Configuracoes.salvar.DelegaciaMenorTempo2 or Configuracoes.salvar.DelegaciaMenorTempo2 <= 0: 
			Configuracoes.salvar.DelegaciaMenorTempo2 = Configuracoes.salvar.DelegaciaTempo2
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = false
		
#		if Configuracoes.salvar.DelegaciaErro2 < Configuracoes.salvar.DelegaciaMenorErro2 or Configuracoes.salvar.DelegaciaErro2 == 999:
#			Configuracoes.salvar.DelegaciaMenorErro2 = Configuracoes.salvar.DelegaciaErro2
#			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = true
#		else:
#			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = false
#
#		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Coluna/Valor.text = str(Configuracoes.salvar.DelegaciaErro2)
#		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/ColunaMenor/Valor.text = str(Configuracoes.salvar.DelegaciaMenorErro2)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Coluna/Valor.text = str(Configuracoes.salvar.DelegaciaTempo2, " s")
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/ColunaMenor/Valor.text = str(Configuracoes.salvar.DelegaciaMenorTempo2, " s")
		Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(129)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"tempo= "+str(Configuracoes.salvar.DelegaciaTempo2))
	
	if name == "TelaDelegaciaEncerramentoFase3":
		Configuracoes.salvar.DelegaciaTempo3 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		
		if Configuracoes.salvar.DelegaciaTempo3 < Configuracoes.salvar.DelegaciaMenorTempo3 or Configuracoes.salvar.DelegaciaMenorTempo3 <= 0: 
			Configuracoes.salvar.DelegaciaMenorTempo3 = Configuracoes.salvar.DelegaciaTempo3
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = true
		else:
			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Recorde.visible = false
		
#		if Configuracoes.salvar.DelegaciaErro3 < Configuracoes.salvar.DelegaciaMenorErro3 or Configuracoes.salvar.DelegaciaErro3 == 999:
#			Configuracoes.salvar.DelegaciaMenorErro3 = Configuracoes.salvar.DelegaciaErro3
#			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = true
#		else:
#			$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Recorde.visible = false
#
#		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/Coluna/Valor.text = str(Configuracoes.salvar.DelegaciaErro3)
#		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaErro/ColunaMenor/Valor.text = str(Configuracoes.salvar.DelegaciaMenorErro3)
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/Coluna/Valor.text = str(Configuracoes.salvar.DelegaciaTempo3, " s")
		$Tela/Centro/Panel/Lista/MargemSuperior/Coluna/ListaTempo/ColunaMenor/Valor.text = str(Configuracoes.salvar.DelegaciaMenorTempo3, " s")
		Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(130)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"tempo= "+str(Configuracoes.salvar.DelegaciaTempo3))
	
	Configuracoes.salvar.Cena = "res://Cenas/TelaDelegacia.tscn"
	if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
		print("Dados salvos!")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
