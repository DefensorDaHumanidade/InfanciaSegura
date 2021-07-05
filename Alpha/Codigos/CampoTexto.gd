extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Configuracoes.salvar.Identificador:
		text = Configuracoes.salvar.Identificador
		get_node("/root/TelaCadastro/Conteiner/Lista/Jogar").TrocarCena = true
	if not text:
		get_node("/root/TelaCadastro/Conteiner/Lista/Jogar").TrocarCena = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CampoTexto_TextoFinal():
	print("Identificador do jogador: ", text)
	Configuracoes.salvar.Identificador = text
	if ResourceSaver.save("res://Dados.tres", Configuracoes.salvar) == OK:
		print("Identificador do jogador salvo: ", text)
	if text:
		get_node("/root/TelaCadastro/Conteiner/Lista/Jogar").TrocarCena = true
	if not text:
		get_node("/root/TelaCadastro/Conteiner/Lista/Jogar").TrocarCena = false
	pass # Replace with function body.
