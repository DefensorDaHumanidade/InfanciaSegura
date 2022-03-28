extends TextureRect

var Tempo = 0

func _ready():
	get_node("Elementos/Tempo/Numero").text = str(Tempo)
	pass

func _UmSegundo():
	Tempo += 1
	get_node("Elementos/Tempo/Numero").text = str(Tempo)
	pass

func atualizarPainel(PerguntasRespondidas: int, PerguntasTotais: int):
	get_node("Elementos/Pontuacao/Numero").text = str(PerguntasRespondidas)+"/"+str(PerguntasTotais)
	pass

func _TocarPainel(evento):
	if evento is InputEventScreenTouch:
		if evento.pressed:
			if get_node("Elementos/Tempo").visible:
				get_node("Elementos/Tempo").visible = false
				get_node("Elementos/Separador").visible = false
			else:
				get_node("Elementos/Tempo").visible = true
				get_node("Elementos/Separador").visible = true
	pass
