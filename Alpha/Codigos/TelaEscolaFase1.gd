extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var PerguntasFase1 = [	"EscolaFase1_Pergunta_01", 
						"EscolaFase1_Pergunta_02",
						"EscolaFase1_Pergunta_03",
						"EscolaFase1_Pergunta_04",
						"EscolaFase1_Pergunta_05",
						"EscolaFase1_Pergunta_06",
						"EscolaFase1_Pergunta_07",
						"EscolaFase1_Pergunta_08",
						"EscolaFase1_Pergunta_09",
						"EscolaFase1_Pergunta_10", ]

var moeda = false


# Called when the node enters the scene tree for the first time.
func _ready():
#	Configuracoes.salvar.EscolaFase1.size()
	randomize()
	
	if randi() % 2:
		moeda = true
	else:
		moeda = false
	PerguntasFase1.shuffle()
	atualizarPergunta(PerguntasFase1[0])
	print("Ordem das perguntas: ", PerguntasFase1)
	
	$CaixaDialogo/Margem/Elementos/BotaoDireita.modulate = Color(1, 1, 1, 0.5)
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func atualizarPergunta(indice):
	if moeda:
		$Certo.rect_position = $LadoDireito/Centro/Imagem.global_position
		$Errado.rect_position = $LadoEsquerdo/Centro/Imagem.global_position
	else:
		$Errado.rect_position = $LadoDireito/Centro/Imagem.global_position
		$Certo.rect_position = $LadoEsquerdo/Centro/Imagem.global_position
#	$Certo.position = $LadoDireito/Centro/Imagem.global_position
#	$LadoEsquerdo/Certo.normal = load("res://Elementos/Visuais/EscolaFase1/Pergunta_01-Certo.png")
#	$LadoDireito/Errado.normal = load("res://Elementos/Visuais/EscolaFase1/Pergunta_01-Errado.png")
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr(indice)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/" + indice + ".mp3"))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	pass




func _on_TelaEscolaFase1_Redimensionar(): #Isso aqui esta dando problema na hora de redimensionar ele troca as imagens de lugar
#	$Certo.rect_position = $LadoDireito/Centro/Imagem.global_position
#	$Errado.rect_position = $LadoEsquerdo/Centro/Imagem.global_position
	pass # Replace with function body.


func _on_Certo_Estado(estado_botao):
	$Certo/Acerto.visible = true
	$Certo/AudioAcerto.play()
	$Certo.disabled = true
	$Errado.disabled = true
	$Errado.self_modulate = Color(0.3, 0.3, 0.3, 1)
	habitlitarBotao()
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.free()
	get_node("CaixaDialogo/Margem/Elementos/Campo/Margem").add_child(load("res://Cenas/FonteDetalhadaComicSans.tscn").instance())
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr("EscolaFase1_RespostaCerta_01")
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load("res://Elementos/Sonoros/Vozes/Teste1.mp3")
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
#	get_tree().reload_current_scene()
#	if estado_botao:
#		$Certo/Contorno.editor_only = false
#		$Errado/Contorno.editor_only = true
#		$Certo.pressed = true
#		$Errado.pressed = false
#	else: 
#		$Certo/Contorno.editor_only = true
	pass # Replace with function body.


func _on_Errado_Estado(estado_botao):
	$Errado.self_modulate = Color(0.3, 0.3, 0.3, 1)
	$Errado/Erro.visible = true
	$Errado/AudioErro.play()
	$Errado.disabled = true
#	if estado_botao:
#		$Errado/Contorno.editor_only = false
#		$Certo/Contorno.editor_only = true
#		$Certo.pressed = false
#		$Errado.pressed = true
#	else: 
#		$Errado/Contorno.editor_only = true
	pass # Replace with function body.


func habitlitarBotao():
	$CaixaDialogo/Margem/Elementos/BotaoDireita.modulate = Color(1, 1, 1, 1)
#	if $Errado/Contorno.editor_only and $Certo/Contorno.editor_only:
#		$CaixaDialogo/Margem/Elementos/BotaoDireita.modulate = Color(1, 1, 1, 0.5)
#	else: 
#
#		$CaixaDialogo/Margem/Elementos/BotaoDireita.modulate = Color(1, 1, 1, 1)
	pass
