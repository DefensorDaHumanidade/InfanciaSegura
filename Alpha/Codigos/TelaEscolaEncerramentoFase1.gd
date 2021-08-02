extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if name == "TelaEscolaEncerramentoFase1":
		Configuracoes.salvar.EscolaTempo1 = OS.get_unix_time() - Configuracoes.salvar.TempoAuxiliar
		
		if Configuracoes.salvar.EscolaTempo1 < Configuracoes.salvar.EscolaMenorTempo1 or Configuracoes.salvar.EscolaMenorTempo1 == 0: 
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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
