extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var PedidosFase3 = [	["InternetFase3_Pergunta_01", "InternetFase3_Dados_01", 1], 
						["InternetFase3_Pergunta_02", "InternetFase3_Dados_02", 2],
						["InternetFase3_Pergunta_03", "InternetFase3_Dados_03", 3],
						["InternetFase3_Pergunta_04", "InternetFase3_Dados_04", 4],
						["InternetFase3_Pergunta_05", "InternetFase3_Dados_05", 5],
						["InternetFase3_Pergunta_06", "InternetFase3_Dados_06", 6],
						["InternetFase3_Pergunta_07", "InternetFase3_Dados_07", 7],
						["InternetFase3_Pergunta_08", "InternetFase3_Dados_08", 8],
						["InternetFase3_Pergunta_09", "InternetFase3_Dados_09", 9],
						["InternetFase3_Pergunta_10", "InternetFase3_Dados_10", 10]]
						



export (int) var indicePerguntar 

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	indicePerguntar = 0
	
	PedidosFase3.shuffle() 
	print(PedidosFase3)
	proximaPergunta()
	
	Configuracoes.salvar.TempoAuxiliar = OS.get_unix_time()
	Configuracoes.salvar.InternetErro3 = 0
#	$Tela/Coluna/ListaInformacoes/Texto.set("custom_fonts/normal_font/settings/font_data", "res://Elementos/Visuais/Fontes/AgencyFB/AGENCYB.TTF")
#	$Tela/Coluna/ListaInformacoes/Texto.set("custom_fonts/normal_font/settings/size", 160)
#	$Tela/Coluna/ListaInformacoes/Texto.visible_characters = $Tela/Coluna/ListaInformacoes/Texto.get_text().length()
#	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	
	$Painel/Colunas/Pontuacao/Texto.text = "Pergunta"
	$Painel/Colunas/Pontuacao/Numero.text = str(indicePerguntar+1)+"/"+str(10)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func proximaPergunta():
	

	
#	print("res://Elementos/Visuais/InternetFase3/Pergunta_" + str(PedidosFase2[indicePerguntar][0][23],PedidosFase2[indicePerguntar][0][24]) + ".png")
	$Tela/Coluna/ListaInformacoes/Imagem.texture = load("res://Elementos/Visuais/InternetFase3/Pergunta_" + str(PedidosFase3[indicePerguntar][0][23],PedidosFase3[indicePerguntar][0][24]) + ".png")
	$Tela/Coluna/ListaInformacoes/Texto.text = tr(PedidosFase3[indicePerguntar][1])
	$Tela/Coluna/ListaInformacoes/Texto.percent_visible = 1.0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr(PedidosFase3[indicePerguntar][0])
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/" + PedidosFase3[indicePerguntar][0] + ".mp3"))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	
	$CaixaDialogo/Margem/Elementos/BotaoDireita.disabled = true
	$CaixaDialogo/Margem/Elementos/BotaoDireita.modulate = Color(1, 1, 1, 0.5)
	
	
	
	$Tela/Coluna/ListaBotoes/BotaoAceitar.modulate = Color(1, 1, 1, 1)
	$Tela/Coluna/ListaBotoes/BotaoAceitar.pressed = false
	$Tela/Coluna/ListaBotoes/BotaoAceitar.disabled = false

	$Tela/Coluna/ListaBotoes/BotaoRecusar.modulate = Color(1, 1, 1, 1)
	$Tela/Coluna/ListaBotoes/BotaoRecusar.pressed = false
	$Tela/Coluna/ListaBotoes/BotaoRecusar.disabled = false
	$Tela/Coluna/ListaBotoes/BotaoRecusar.toggle_mode = true
	$Tela/Coluna/ListaBotoes/BotaoAceitar.toggle_mode = true
	
	$Painel/Colunas/Pontuacao/Numero.text = str(indicePerguntar+1)+"/"+str(10)
	pass



func verificarResposta():
	var perguntinha = true
	if PedidosFase3[indicePerguntar][2] <= 5:
#		print("ERRADO")
		perguntinha = false
#	else:
#		print("CERTO")
	return perguntinha
	pass


func errouResposta():
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr(str("InternetFase3_RespostaErrada_", PedidosFase3[indicePerguntar][0][23], PedidosFase3[indicePerguntar][0][24]))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/InternetFase3_RespostaErrada_" + str(PedidosFase3[indicePerguntar][0][23], PedidosFase3[indicePerguntar][0][24])) + ".mp3")
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	$AudioErro.play()
	$Camera/Animar.play("Tremer")
	
	Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(10*int(PedidosFase3[indicePerguntar][0][23])+int(PedidosFase3[indicePerguntar][0][24])+103)+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"respota errada")

	
	Configuracoes.salvar.InternetErro3 += 1
	pass
	
func acertouResposta():
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr(str("InternetFase3_RespostaCerta_", PedidosFase3[indicePerguntar][0][23], PedidosFase3[indicePerguntar][0][24]))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/InternetFase3_RespostaCerta_" + str(PedidosFase3[indicePerguntar][0][23], PedidosFase3[indicePerguntar][0][24])) + ".mp3")
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	$AudioAcerto.play()
	$Tela/Coluna/ListaBotoes/BotaoAceitar.modulate = Color(0.3, 0.3, 0.3, 1)
	$Tela/Coluna/ListaBotoes/BotaoRecusar.modulate = Color(0.3, 0.3, 0.3, 1)
	$Tela/Coluna/ListaBotoes/BotaoRecusar.toggle_mode = false
	$Tela/Coluna/ListaBotoes/BotaoAceitar.toggle_mode = false
	$Tela/Coluna/ListaBotoes/BotaoAceitar.disabled = true
	$Tela/Coluna/ListaBotoes/BotaoRecusar.disabled = true
	
	Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(10*int(PedidosFase3[indicePerguntar][0][23])+int(PedidosFase3[indicePerguntar][0][24])+103)+"&veredito="+"1"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"respota acertou")

	habitlitarBotaoProximo()
	pass


func habitlitarBotaoProximo():
	$CaixaDialogo/Margem/Elementos/BotaoDireita.modulate = Color(1, 1, 1, 1)
	$CaixaDialogo/Margem/Elementos/BotaoDireita.disabled = false
	
	pass


