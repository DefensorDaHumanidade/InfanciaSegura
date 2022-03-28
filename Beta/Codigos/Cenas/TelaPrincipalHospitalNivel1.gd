extends Control

const CenaPeca = preload("res://Cenas/Objetos/CorpoHumanoPeca.tscn")
export (int, 0, 28) var QuantidadeElementosAprender  
var FatorAleatorio = RandomNumberGenerator.new()
var Elementos = []
var Indice = 0
var ErrosCometidos = 0
var tempoInicial
var tempoFinal
var Timestamp

func _ready():
	if not Carregar.FaseAtual: #VERIFICADOR DE INCONSISTENCIAS
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalHospital.tscn", self)
	else:
		VisualServer.set_default_clear_color(Color("#72bcc8"))
		
		tempoInicial = OS.get_unix_time()
		configuracaoInicial()
		configuracaoGenero()
		AtualizarPeca()
	pass

func AtualizarPeca():
	Timestamp = OS.get_unix_time()
	Indice += 1
	if Indice > QuantidadeElementosAprender:
		yield(get_tree().create_timer(1.5), "timeout")
		terminarJogo()
		return
	
	var Nome = Elementos[Indice-1][1]
	var Peca = CenaPeca.instance()
	
	if Nome == "CorpoHumanoPecaPrivada":
		if Carregar.Dados.Genero == "Menina":
			Nome = "CorpoHumanoPecaVulva"
		else:
			Nome = "CorpoHumanoPecaPenis"
	
	Peca.rect_position = Vector2(-130, -150)
	Peca.Movimentar = true
#	get_node("ZonaNascimento/CorpoHumanoPeca/Texto").text = Nome.lstrip("CorpoHumanoPeca").insert(0,"Parte")
#	Peca.Nome = Nome.lstrip("CorpoHumanoPeca").insert(0,"Parte")
#	Peca.Nome = Nome.erase(0, 15).insert(0,"Parte")
	Peca.Nome = Nome.replace("CorpoHumanoPeca", "Parte") #Nao sei porque as funcao de cima nao funcionaram (seja uma ou a outra)
	
	get_node("Dialogo/Margem/Vertical/BotaoVoz").set_pressed(false)
	get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto/Voz").stream = load("res://Elementos/Sonoros/Vozes/"+Peca.Nome+".mp3")
	get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto/Voz").play()
	get_node("Dialogo/Margem/Vertical/BotaoVoz").pressed = true
	
	get_node("ZonaNascimento").add_child(Peca)
	get_node("Painel").atualizarPainel(Indice, QuantidadeElementosAprender)
	pass

func configuracaoInicial():
	var Auxiliar = 0
	if not QuantidadeElementosAprender:
		QuantidadeElementosAprender = 5
	
	for filhos in get_node("Mural/ElementosFrente/Partes").get_children():
		Elementos.append([])
		Elementos[Auxiliar].append("Mural/ElementosFrente/Partes/"+filhos.name)
		Elementos[Auxiliar].append(filhos.name)
		Auxiliar += 1
	
	for filhos in get_node("Mural/ElementosCostas/Partes").get_children():
		Elementos.append([])
		Elementos[Auxiliar].append("Mural/ElementosCostas/Partes/"+filhos.name)
		Elementos[Auxiliar].append(filhos.name)
		Auxiliar += 1
	
#	print("Elementos existentes: ", Elementos)
	Elementos.shuffle()
	
	for aprender in QuantidadeElementosAprender:
		get_node(Elementos[aprender][0]+"/Texto").visible = false
	pass

func configuracaoGenero():
	get_node("Mural/ElementosFrente/CorpoHumanoFrente").texture = load("res://Elementos/Fases/Hospital/CorpoHumano/"+Carregar.Dados.Genero+"Frente.png")
	get_node("Mural/ElementosCostas/CorpoHumanoCostas").texture = load("res://Elementos/Fases/Hospital/CorpoHumano/"+Carregar.Dados.Genero+"Costas.png")
	get_node("Mural/ElementosFrente/CorpoHumanoFrente").flip_h = true
	pass

func _deslizarTela(valor):
	$Mural.rect_position.y = valor*10
	pass

func _viraDesvira(estado):
	if estado:
		get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Icone").texture = load("res://Elementos/Visuais/Icones/Desinverter.png")
		get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Texto").text = "BotaoFrente"
		get_node("Mural/ElementosCostas").visible = true
		get_node("Mural/ElementosFrente").visible = false
	else: 
		get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Icone").texture = load("res://Elementos/Visuais/Icones/Inverter.png")
		get_node("Dialogo/Margem/Vertical/BotaoComando/Vertical/Texto").text = "BotaoTras"
		get_node("Mural/ElementosCostas").visible = false
		get_node("Mural/ElementosFrente").visible = true
	pass

func terminarJogo():
	tempoFinal = OS.get_unix_time()
	Carregar.atualizarPontuacao(Carregar.FaseAtual, tempoFinal-tempoInicial, ErrosCometidos)
	Carregar.Dados.Cena = "res://Cenas/Telas/TelaEncerramento.tscn"
	Carregar.salvarDados(Carregar.Dados)
	Carregar.trocarCena("res://Cenas/Telas/TelaEncerramento.tscn", self)

func enviarBancoDados(AcertoErro: String, Descricao: String):
	Carregar.comunicarBancoRespostas("ArmazenarRespostas.php",  Elementos[Indice-1][1].replace("CorpoHumanoPeca", "Parte"), AcertoErro, str(Timestamp), Descricao)
	pass
