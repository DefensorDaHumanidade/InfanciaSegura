extends Control

const CenaPessoa = preload("res://Cenas/Objetos/Pessoa.tscn")
var FatorAleatorio = RandomNumberGenerator.new()
var ElementosErrados = ["06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
var ElementosCertos = ["01", "02", "03", "04", "05"]
var Indice = 0
var IndiceElementos = 0
var ErrosCometidos = 0
var tempoInicial
var tempoFinal
var Timestamp

func _ready():
	if not Carregar.FaseAtual: #VERIFICADOR DE INCONSISTENCIAS
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalInternet.tscn", self)
	else:
		VisualServer.set_default_clear_color(Color("#74ca8f"))
		
		tempoInicial = OS.get_unix_time()
		FatorAleatorio.randomize()
		ElementosErrados.shuffle()
		ElementosCertos.shuffle()
		Atualizar()
	pass

func Atualizar():
	Timestamp = OS.get_unix_time()
	get_node("Transicao/Animar").play("TransicaoSaida")
	CarregarElementos("InternetFase1_Pergunta_"+ElementosCertos[Indice])
	
	get_node("Dialogo/Margem/Vertical/BotaoComando").disabled = true
	get_node("Dialogo/Margem/Vertical/BotaoComando").modulate = Color(0.3, 0.3, 0.3, 1.0)
	
	removerPessoas("Cima")
	removerPessoas("Baixo")
	yield(get_tree().create_timer(0.1), "timeout") #Gostaria de fazer isso de outra forma
	preencherPessoas("Cima", 4)
	preencherPessoas("Baixo", 4)
	inserirPessoaValida(ElementosCertos[Indice])
	
	get_node("Painel").atualizarPainel(Indice+1, ElementosCertos.size())
	pass

func preencherPessoas(Local: String, Quantidade: int):
	IndiceElementos += Quantidade
	for i in range(IndiceElementos-Quantidade, IndiceElementos-Quantidade+Quantidade):
		gerarPessoas(Local, ElementosErrados[i])
	pass

func gerarPessoas(Local: String, Elemento):
	var pessoa = CenaPessoa.instance()
	pessoa.texture = load("res://Elementos/Fases/Internet/InternetFase1/Pessoa-" + str(Elemento) + ".png")
	ElementosErrados.append(pessoa)
	get_node("Centro/Painel/Lista/" + Local).add_child(pessoa)
	pass

func inserirPessoaValida(Elemento: String):
	var aleatorio = int(rand_range(0,get_node("Centro/Painel/Lista/Cima").get_child_count()))
	if int(rand_range(0,2)) % 2:
		get_node("Centro/Painel/Lista/Cima").get_child(aleatorio).texture = load("res://Elementos/Fases/Internet/InternetFase1/Pessoa-" + str(Elemento) + ".png")
	else:
		get_node("Centro/Painel/Lista/Baixo").get_child(aleatorio).texture = load("res://Elementos/Fases/Internet/InternetFase1/Pessoa-" + str(Elemento) + ".png")
	pass

func removerPessoas(Local: String):
	for i in get_node("Centro/Painel/Lista/" + Local).get_children():
		i.queue_free()
	pass

func CarregarElementos(Atributos: String):
	if get_node_or_null("Dialogo/Margem/Vertical/Caixa/Margem/Texto"):
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto").CarregarTexto = tr(Atributos)
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto").CarregarVoz = Atributos
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto")._ready()
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto/Imprimir").start()
	pass

func RespostaCerta():
	get_node("Dialogo/Margem/Vertical/BotaoComando").modulate = Color(1.0, 1.0, 1.0, 1.0)
	get_node("Dialogo/Margem/Vertical/BotaoComando").disabled = false
	CarregarElementos("InternetFase1_RespostaCerta_"+ElementosCertos[Indice])
	
	Indice += 1
	get_node("Centro/Painel/Lista/Texto").text = "Senha ("+str(Indice)+" de 5)"
	pass

func RespostaErrada():
	ErrosCometidos += 1
	CarregarElementos("InternetFase1_RespostaErrada_"+ElementosCertos[Indice])
	pass

func _BotaoProximaPergunta():
	if Indice < ElementosCertos.size():
		get_node("Transicao/Animar").play("TransicaoEntrada")
		Atualizar()
	else:
		tempoFinal = OS.get_unix_time()
		Carregar.atualizarPontuacao(Carregar.FaseAtual, tempoFinal-tempoInicial, ErrosCometidos)
		Carregar.Dados.Cena = "res://Cenas/Telas/TelaEncerramento.tscn"
		Carregar.salvarDados(Carregar.Dados)
		Carregar.trocarCena("res://Cenas/Telas/TelaEncerramento.tscn", self)
	pass

func enviarBancoDados(AcertoErro: String, Descricao: String):
	Carregar.comunicarBancoRespostas("ArmazenarRespostas.php", Carregar.FaseAtual+"_Pergunta_"+ElementosCertos[Indice], AcertoErro, str(Timestamp), Descricao)
	pass
