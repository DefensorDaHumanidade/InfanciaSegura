extends Control

func _ready():
	if not Carregar.FaseAtual: #VERIFICADOR DE INCONSISTENCIAS
		Carregar.trocarCena("res://Cenas/Telas/TelaPrincipal.tscn", self)
	else:
		get_node("Fundo").texture = load("res://Elementos/Visuais/Fundo/"+Carregar.FaseAtual.left(4)+".jpg")
		CarregarElementos("Tela"+Carregar.FaseAtual+"_Encerramento")
		definirAparencia(Carregar.FaseAtual.left(4))
		mostrarPontuacao()
		Carregar.FaseAtual = null
	pass

func mostrarPontuacao():
	if get_node_or_null("Centro/PainelGeral/Lista/Coluna/Erro"):
		get_node("Centro/PainelGeral/Lista/Coluna/Erro/Atual/Valor").text = str(Carregar.Dados.Fase[Carregar.FaseAtual]["ErrosAtual"])
		get_node("Centro/PainelGeral/Lista/Coluna/Erro/Menor/Valor").text = str(Carregar.Dados.Fase[Carregar.FaseAtual]["ErrosMenor"])
	
	if get_node_or_null("Centro/PainelGeral/Lista/Coluna/Tempo"):
		get_node("Centro/PainelGeral/Lista/Coluna/Tempo/Atual/Valor").text = str(Carregar.Dados.Fase[Carregar.FaseAtual]["TempoAtual"])
		get_node("Centro/PainelGeral/Lista/Coluna/Tempo/Menor/Valor").text = str(Carregar.Dados.Fase[Carregar.FaseAtual]["TempoMenor"])
	
	if Carregar.Dados.Fase[Carregar.FaseAtual]["RecordeTempo"]:
		get_node("Centro/PainelGeral/Lista/Coluna/Tempo/Recorde").visible = true
	else:
		get_node("Centro/PainelGeral/Lista/Coluna/Tempo/Recorde").visible = false
	
	if Carregar.Dados.Fase[Carregar.FaseAtual]["RecordeErro"]:
		get_node("Centro/PainelGeral/Lista/Coluna/Erro/Recorde").visible = true
	else:
		get_node("Centro/PainelGeral/Lista/Coluna/Erro/Recorde").visible = false
	pass

func definirAparencia(Tela: String):
	match Tela:
		"Dele":
			carregarLetreiro(preload("res://Cenas/Fontes/FonteAgencyFB.tscn").instance())
			
			get_node("Personagem").texture = load("res://Elementos/Visuais/Personagens/Delegado/Delegado-1.png")
			get_node("Centro/PainelGeral/Lista/Texto").set("custom_colors/font_color", Color("#ff123e"))
			get_node("Centro/PainelGeral/Lista/Coluna/Separador").visible = false
			get_node("Centro/PainelGeral/Lista/Coluna/Erro").visible = false
			get_node("Fundo").self_modulate = Color("#c87a7a")
		"Esco":
			carregarLetreiro(preload("res://Cenas/Fontes/CurzlsMT.tscn").instance())
			
			get_node("Personagem").texture = load("res://Elementos/Visuais/Personagens/Professora/Professora-2.png")
			get_node("Centro/PainelGeral/Lista/Texto").set("custom_colors/font_color", Color("#ff3d3d"))
			get_node("Fundo").self_modulate = Color("#b4b46e")
		"Hosp":
			carregarLetreiro(preload("res://Cenas/Fontes/FonteArial.tscn").instance())
			
			get_node("Personagem").texture = load("res://Elementos/Visuais/Personagens/Medico/Medico-1.png")
			get_node("Centro/PainelGeral/Lista/Texto").set("custom_colors/font_color", Color("#335fbc"))
			get_node("Fundo").self_modulate = Color("#72bcc8")
		"Inte":
			carregarLetreiro(preload("res://Cenas/Fontes/FonteLucidaConsole.tscn").instance())
			
			get_node("Personagem").texture = load("res://Elementos/Visuais/Personagens/Robo/Robo-1.png")
			get_node("Personagem").flip_h = false
			get_node("Centro/PainelGeral/Lista/Texto").set("custom_colors/font_color", Color("#025500"))
			get_node("Fundo").self_modulate = Color("#74ca8f")
		_:
			push_warning("Tela final nao encontrada!")
			Carregar.trocarCena("res://Cenas/Telas/TelaPrincipal.tscn", get_tree().get_current_scene())
	pass

func CarregarElementos(Atributos: String):
	if get_node_or_null("Dialogo/Margem/Vertical/Caixa/Margem/Texto"):
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto").CarregarTexto = tr(Atributos)
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto").CarregarVoz = Atributos
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto")._ready()
		get_node("Dialogo/Margem/Vertical/Caixa/Margem/Texto/Imprimir").start()
	pass

func carregarLetreiro(letreiro):
	letreiro.text = "Parabéns"
	letreiro.align = Label.ALIGN_CENTER
	letreiro.valign = Label.ALIGN_CENTER
	letreiro.rect_min_size.y = 150
	letreiro.get_font("font").size = 100
	get_node("Centro/PainelGeral/Lista").add_child(letreiro)
	get_node("Centro/PainelGeral/Lista").move_child(get_node("Centro/PainelGeral/Lista/Texto"), 0)
	pass
