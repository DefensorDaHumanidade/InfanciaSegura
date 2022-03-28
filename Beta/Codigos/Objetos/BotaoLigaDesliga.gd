extends CheckButton

func _ready():
	if get_parent().get_child(0).name in Carregar.Dados.Tutorial:
		self.pressed = Carregar.Dados.Tutorial[get_parent().get_child(0).name]
	else:
		Carregar.FaseAtual = get_parent().get_child(0).name
		Carregar.atualizarTutorial(Carregar.FaseAtual, true)
	pass

func _interruptor(estado):
	Carregar.FaseAtual = get_parent().get_child(0).name
	Carregar.atualizarTutorial(Carregar.FaseAtual, estado)
	pass
