extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


const CenaPessoa = preload("res://Cenas/Pessoa.tscn")

var elementosNumericos = []
var elementosCertos = [ 1, 2, 3 ,4, 5]

var indicePergunta = 0
var indiceListaElementos = 0
const quantidadeElementos = 4

var elementoGerados = []


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for i in range(6, 49):
		elementosNumericos.append(i)
	elementosNumericos.shuffle()
	elementosCertos.shuffle()
	carregarColunas()
	
	
#	yield(get_tree().create_timer(4.5), "timeout")
#	carregarColunas()
#	yield(get_tree().create_timer(4.5), "timeout")
#	carregarColunas()
#	yield(get_tree().create_timer(4.5), "timeout")
#	carregarColunas()
#	yield(get_tree().create_timer(4.5), "timeout")
#	carregarColunas()
	Configuracoes.salvar.TempoAuxiliar = OS.get_unix_time()
	Configuracoes.salvar.InternetErro1 = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func gerarPessoas(local, numeracao):
	var pessoa = CenaPessoa.instance()
	pessoa.get_node("Imagem").texture = load("res://Elementos/Visuais/InternetFase1/Pessoa-" + str(numeracao) + ".png")
	elementoGerados.append(pessoa)
	get_node("Tela/Centro/Panel/Lista/"+local).add_child(pessoa)
	pass

func carregarColunas():
	$CaixaDialogo/Margem/Elementos/BotaoDireita.disabled = true
	$CaixaDialogo/Margem/Elementos/BotaoDireita.modulate = Color(1, 1, 1, 0.5)

	elementoGerados.clear()
	indicePergunta +=1
	matarColunas()
	carregarTexto()
	for i in range(quantidadeElementos*(indiceListaElementos)+1, quantidadeElementos*(indiceListaElementos+1)+1):
		gerarPessoas("MargemSuperior/ColunaCima", elementosNumericos[i])
		pass
	indiceListaElementos += 1
	for i in range(quantidadeElementos*(indiceListaElementos)+1, quantidadeElementos*(indiceListaElementos+1)+1):
		gerarPessoas("MargemInferior/ColunaBaixo", elementosNumericos[i])
		pass
	indiceListaElementos += 1
	var aleatorio = rand_range(0,8)
	elementoGerados[aleatorio].get_node("Imagem").texture = load("res://Elementos/Visuais/InternetFase1/Pessoa-" + str(elementosCertos[indicePergunta-1]) + ".png")
	elementoGerados[aleatorio].get_node("Numeracao").text = "42"
#	print("MUHAHAHAHAA: ", elementoGerados[rand_range(0,8)])
	pass

func matarColunas():
	for i in get_node("Tela/Centro/Panel/Lista/MargemSuperior/ColunaCima").get_children():
		i.queue_free()
	for i in get_node("Tela/Centro/Panel/Lista/MargemInferior/ColunaBaixo").get_children():
		i.queue_free()
	pass
#
#for n in node.get_children():
#        node.remove_child(n)
#	n.queue_free()


func carregarTexto():
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr("InternetFase1_Pergunta_0"+str(elementosCertos[indicePergunta-1]))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/InternetFase1_Pergunta_0"+ str(elementosCertos[indicePergunta-1]) + ".mp3"))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	
	$Tela/Centro/Panel/Lista/Texto.text = "Senha ("+str(indicePergunta-1)+" de 5)"
	pass


func habitlitarBotaoProximo():
	$CaixaDialogo/Margem/Elementos/BotaoDireita.modulate = Color(1, 1, 1, 1)
	$CaixaDialogo/Margem/Elementos/BotaoDireita.disabled = false
	pass


func acertouPessoa():
	habitlitarBotaoProximo()
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr("InternetFase1_RespostaCerta_0"+str(elementosCertos[indicePergunta-1]))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/InternetFase1_RespostaCerta_0"+ str(elementosCertos[indicePergunta-1]) + ".mp3"))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	
	$Tela/Centro/Panel/Lista/Texto.text = "Senha ("+str(indicePergunta)+" de 5)"
	
	Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(58+elementosCertos[indicePergunta-1])+"&veredito="+"1"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"pessoa certa")

	pass
	
func errouPessoa():
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.bbcode_text = tr("InternetFase1_RespostaErrada_0"+str(elementosCertos[indicePergunta-1]))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.percent_visible = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.taxaExposicao = 0
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto.set_process(true)
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.stream = load(str("res://Elementos/Sonoros/Vozes/InternetFase1_RespostaErrada_0"+ str(elementosCertos[indicePergunta-1]) + ".mp3"))
	$CaixaDialogo/Margem/Elementos/Campo/Margem/Texto/Voz.play()
	$CaixaDialogo/Margem/Elementos/BotaoEsquerda.pressed = true
	Configuracoes.salvar.InternetErro1 += 1
	
	Configuracoes.get_node("BancoDados").request("https://infanciasegura.000webhostapp.com/ArmazenarRespostas.php", ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"], false, HTTPClient.METHOD_POST,"jogador="+Configuracoes.salvar.Identificador+"&pergunta="+str(58+elementosCertos[indicePergunta-1])+"&veredito="+"0"+"&TI="+str(0)+"&TF="+"0"+"&resposta="+"pessoa errada")
	pass
