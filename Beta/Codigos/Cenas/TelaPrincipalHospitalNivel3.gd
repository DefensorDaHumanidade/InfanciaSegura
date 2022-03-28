extends Control

var arrastar = false
var FatorAleatorio = RandomNumberGenerator.new()
var Elementos = ["Bom_01", "Bom_02", "Bom_03", "Bom_04", "Bom_05", "Ruim_01", "Ruim_02", "Ruim_03", "Ruim_04", "Ruim_05"]
var Indice = 0
var ErrosCometidos = 0
var tempoInicial
var tempoFinal
var Timestamp
var resposta = null

func _ready():
	if not Carregar.FaseAtual: #VERIFICADOR DE INCONSISTENCIAS
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipalHospital.tscn", self)
	else:
		VisualServer.set_default_clear_color(Color("#72bcc8"))
		
		tempoInicial = OS.get_unix_time()
		FatorAleatorio.randomize()
#		buscarArquivosPasta("res://Elementos/Fases/Hospital/HospitalFase3/")
		Elementos.shuffle()
		Atualizar()
	pass

func Atualizar():
	Timestamp = OS.get_unix_time()
	CarregarElementos(Carregar.FaseAtual+"_Toque"+Elementos[Indice])
	
	get_node("ZonaNascimento/Toque").texture = load("res://Elementos/Fases/Hospital/"+Carregar.FaseAtual+"/"+Elementos[Indice]+".png")
	
	get_node("Painel").atualizarPainel(Indice+1, Elementos.size())
	pass

func buscarArquivosPasta(Caminho: String):
	var Pasta = Directory.new()
	Pasta.open(Caminho)
	Pasta.list_dir_begin(true)

	var Arquivo = Pasta.get_next()
	while Arquivo != '':
		if not Arquivo.ends_with(".import"):
			Elementos += [Arquivo.rstrip(".png")]
		Arquivo = Pasta.get_next()
	Elementos.erase("LivroAzul")
	Elementos.erase("LivroVermelho")
	pass

func CarregarElementos(Atributos: String):
	if get_node_or_null("Dialogo/Margem/Vertical/Caixa/Margem/Texto"):
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto").CarregarTexto = tr(Atributos)
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto").CarregarVoz = Atributos
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto")._ready()
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto/Imprimir").start()
	pass

func terminarJogo():
	tempoFinal = OS.get_unix_time()
	Carregar.atualizarPontuacao(Carregar.FaseAtual, tempoFinal-tempoInicial, ErrosCometidos)
	Carregar.Dados.Cena = "res://Cenas/Telas/TelaEncerramento.tscn"
	Carregar.salvarDados(Carregar.Dados)
	Carregar.trocarCena("res://Cenas/Telas/TelaEncerramento.tscn", self)
	pass


func _arrastarImagem(evento):
	if evento is InputEventScreenTouch:
		if arrastar:
			arrastar = false
			get_node("ZonaNascimento/Toque").rect_scale = Vector2(1, 1)
			get_node("ZonaNascimento/Toque").rect_position = Vector2(-200, 80)
			verificarRespostas()
		else:
			arrastar = true
			get_node("ZonaNascimento/Toque/Som").play()
			get_node("ZonaNascimento/Toque").rect_scale = Vector2(0.9, 0.9)
			get_node("ZonaNascimento/Toque").rect_pivot_offset = evento.position
	if evento is InputEventMouseMotion and arrastar:
		get_node("ZonaNascimento/Toque").set_global_position(evento.global_position-Vector2(get_node("ZonaNascimento/Toque").rect_pivot_offset))
	pass

func verificarRespostas():
	enviarBancoDados(str(int(resposta)), "")
	if resposta == true:
		Indice += 1
		$AudioAcerto.play()
		if Indice < Elementos.size():
			Atualizar()
		else:
			get_node("ZonaNascimento/Toque").visible = false
			yield($AudioAcerto, "finished") 
			terminarJogo()
		pass
	if resposta == false:
		$AudioErro.play()
		ErrosCometidos += 1
		get_node("/root/TelaHospitalFase3/Camera/Animar").play("TemerCamera")
		pass
	pass
	

func _AreaEntrou(area):
	
	if Elementos[Indice].find("Bom") == 0 and area.get_parent().name.find("ToquesBons") == 0:
		resposta = true
	if Elementos[Indice].find("Ruim") == 0 and area.get_parent().name.find("ToquesRuins") == 0:
		resposta = true
	
	if Elementos[Indice].find("Bom") == 0 and area.get_parent().name.find("ToquesBons") != 0:
		resposta = false
	if Elementos[Indice].find("Ruim") == 0 and area.get_parent().name.find("ToquesRuins") != 0:
		resposta = false
	pass


func _AreaSaiu(_area):
	resposta = null
	pass

func enviarBancoDados(AcertoErro: String, Descricao: String):
	Carregar.comunicarBancoRespostas("ArmazenarRespostas.php",  Elementos[Indice], AcertoErro, str(Timestamp), Descricao)
	pass

