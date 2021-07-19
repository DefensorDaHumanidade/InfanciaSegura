extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var PerguntasFase2 = [	"EscolaFase2_Pergunta_01", 
						"EscolaFase2_Pergunta_02",
						"EscolaFase2_Pergunta_03",
						"EscolaFase2_Pergunta_04",
						"EscolaFase2_Pergunta_05",
						"EscolaFase2_Pergunta_06",
						"EscolaFase2_Pergunta_07",
						"EscolaFase2_Pergunta_08",
						"EscolaFase2_Pergunta_09",
						"EscolaFase2_Pergunta_10", ]

var moeda = false

export (int) var indicePergunta 


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	indicePergunta = 0

	PerguntasFase2.shuffle()
	atualizarPergunta()
	print("Ordem das perguntas: ", PerguntasFase2)
	pass # Replace with function body.


func atualizarPergunta():
	$Transicao/Animar.play("Inicio")
	print("Pergunta atual [", indicePergunta, "]: ", PerguntasFase2[indicePergunta][21],PerguntasFase2[indicePergunta][22])
	$Certo.texture_normal = load("res://Elementos/Visuais/EscolaFase1/Pergunta_" + str(PerguntasFase2[indicePergunta][21],PerguntasFase2[indicePergunta][22]) + "-Certo.png")
	$Errado.texture_normal = load("res://Elementos/Visuais/EscolaFase1/Pergunta_" + str(PerguntasFase2[indicePergunta][21],PerguntasFase2[indicePergunta][22]) + "-Errado.png")
	$CaixaDialogo/Margem/Elementos/BotaoDireita.disabled = true
	$CaixaDialogo/Margem/Elementos/BotaoDireita.modulate = Color(1, 1, 1, 0.5)
	$Certo/Acerto.visible = false
	$Errado/Erro.visible = false
	$Certo.disabled = false
	$Errado.disabled = false
	$Errado.self_modulate = Color(1, 1, 1, 1)
	if randi() % 2:
		moeda = true
	else:
		moeda = false
	if moeda:
		$Certo.rect_position = $LadoDireito/Centro/Imagem.global_position
		$Errado.rect_position = $LadoEsquerdo/Centro/Imagem.global_position
	else:
		$Errado.rect_position = $LadoDireito/Centro/Imagem.global_position
		$Certo.rect_position = $LadoEsquerdo/Centro/Imagem.global_position
#	$Certo.position = $LadoDireito/Centro/Imagem.global_position
#	$LadoEsquerdo/Certo.normal = load("res://Elementos/Visuais/EscolaFase1/Pergunta_01-Certo.png")
#	$LadoDireito/Errado.normal = load("res://Elementos/Visuais/EscolaFase1/Pergunta_01-Errado.png")
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr(PerguntasFase2[indicePergunta])
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/" + PerguntasFase2[indicePergunta] + ".mp3"))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Certo_Estado_2():
	$Certo/Acerto.visible = true
	$Certo/AudioAcerto.play()
	$Certo.disabled = true
	$Errado.disabled = true
	$Errado.self_modulate = Color(0.3, 0.3, 0.3, 1)
#	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.free()
#	get_node("CaixaDialogo/Margem/Elementos/Campo/Margem").add_child(load("res://Cenas/FonteDetalhadaComicSans.tscn").instance())

	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr("EscolaFase2_RespostaCerta_" + str(PerguntasFase2[indicePergunta][21],PerguntasFase2[indicePergunta][22]))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load("res://Elementos/Sonoros/Vozes/Teste1.mp3")
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	habitlitarBotao()
#	get_tree().reload_current_scene()
#	if estado_botao:
#		$Certo/Contorno.editor_only = false
#		$Errado/Contorno.editor_only = true
#		$Certo.pressed = true
#		$Errado.pressed = false
#	else: 
#		$Certo/Contorno.editor_only = true
	pass # Replace with function body.


func _on_Errado_Estado_2():
	$Camera/Animar.play("Tremer")
	$Errado.self_modulate = Color(0.3, 0.3, 0.3, 1)
	$Errado/Erro.visible = true
	$Errado/AudioErro.play()
	$Errado.disabled = true
	
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr("EscolaFase2_RespostaErrada_" + str(PerguntasFase2[indicePergunta][21],PerguntasFase2[indicePergunta][22]))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load("res://Elementos/Sonoros/Vozes/Teste1.mp3")
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	
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
	$CaixaDialogo/Margem/Elementos/BotaoDireita.disabled = false
#	if $Errado/Contorno.editor_only and $Certo/Contorno.editor_only:
#		$CaixaDialogo/Margem/Elementos/BotaoDireita.modulate = Color(1, 1, 1, 0.5)
#	else: 
#
#		$CaixaDialogo/Margem/Elementos/BotaoDireita.modulate = Color(1, 1, 1, 1)
	pass


func _on_Animar_Inicio_Terminiou(nome):
	if nome == "Inicio":
		$Transicao/Animar.play("Final")
	pass # Replace with function body.
