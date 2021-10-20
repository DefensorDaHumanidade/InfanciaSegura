extends Control

func _ready():
	pass

func _generoMenino():
	Carregar.Dados.Genero = "Menino"
	pass

func _generoMenina():
	Carregar.Dados.Genero = "Menina"
	pass

func _trocarCena():
	Carregar.Dados.Cena = "res://Cenas/Telas/TelaPrincipal.tscn"
	Carregar.salvarDados(Carregar.Dados)
	Carregar.comunicarBancoJogador("ArmazenarJogadores.php")
	Carregar.trocarCena(Carregar.Dados.Cena, get_tree().get_current_scene())
	pass



