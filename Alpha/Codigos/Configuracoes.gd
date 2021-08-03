extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (Resource) var salvar

var animacaoPrincipal = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():

	
	carregarTela()
	gerenciarMusicas()
	verificarConsistenciaArquivo()
	$CantoSuperiorDireito/BotaoConfiguracoes/Icone.texture = load("res://Elementos/Visuais/Icones/Engrenagem.svg")
	$CantoSuperiorDireito/BotaoConfiguracoes/Icone.self_modulate = Color(0, 0.9, 0.9, 1)
	$Musica.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func verificarConsistenciaArquivo():
	if 40 > salvar.Texto or salvar.Texto > 70:
		print("Falha ao carregar variavel Texto: ", salvar.Texto)
		print("Alterando seu valor base para o padrao: ", 60)
		salvar.Texto = 60
	if -40 > salvar.Audio or salvar.Audio > 10:
		print("Falha ao carregar variavel Audio: ", salvar.Audio)
		print("Alterando seu valor base para o padrao: ", 10)
		salvar.Audio = 10
	if -40 > salvar.Voz or salvar.Voz > 10:
		print("Falha ao carregar variavel Voz: ", salvar.Voz)
		print("Alterando seu valor base para o padrao: ", 10)
		salvar.Voz = 10
	if -40 > salvar.Musica or salvar.Musica > 10:
		print("Falha ao carregar variavel Musica: ", salvar.Musica)
		print("Alterando seu valor base para o padrao: ", 10)
		salvar.Musica = 10
	if ResourceSaver.save("res://Dados.tres", salvar) == OK:
		print("Salvando dados no arquivo!")
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("CanalMusica"), salvar.Musica)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("CanalVoz"), salvar.Voz)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), salvar.Audio)
	pass


func carregarTela():
	if not salvar.Identificador:
		if get_tree().change_scene("res://Cenas/TelaCarregamento.tscn") == OK:
			print("Jogador nao encontrado, indo para tela de carregamento!")
	else:
		if get_tree().change_scene(salvar.Cena) == OK:
			print("Cena carregada com sucesso!")
	pass
	
func gerenciarMusicas():
	if not salvar.NomeMusica:
		salvar.NomeMusica = "res://Elementos/Sonoros/Musiscas/Abertura.wav"
		$Musica.stream = load(salvar.NomeMusica)
		$Musica.play()
	else:
		if $Musica.stream.resource_path != salvar.NomeMusica: #verificando se a musica eh diferente, se a musica for igual entao na faz nada
			$Musica.stream = load(salvar.NomeMusica)
			$Musica.play()
	pass


func _on_BancoDados_requisicao(result, response_code, headers, body):
	if result == HTTPRequest.RESULT_SUCCESS:
		print(body.get_string_from_utf8())
	else:
		print("Não foi possível se comunicar com o banco de dados!")
	pass # Replace with function body.
