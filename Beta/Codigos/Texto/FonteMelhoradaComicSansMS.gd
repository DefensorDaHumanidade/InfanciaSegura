extends RichTextLabel

export (String) var CarregarTexto
export (String) var CarregarVoz

func _ready():
	self.visible_characters = 0
	
	if CarregarTexto:
		self.bbcode_text = tr(CarregarTexto)
	
	if CarregarVoz:
		controleVoz()
	pass

#func _process(delta):
#	pass

func _Imprimir():
	visible_characters += 1
	if visible_characters > get_text().length():
		print("Fim da impressão do texto! Total de caracteres imprimidos: ", get_text().length())
		$Imprimir.stop()
	pass

func controleVoz():
	$Voz.stream = load("res://Elementos/Sonoros/Vozes/"+CarregarVoz+".mp3")
	self.get_parent().get_parent().get_parent().get_node_or_null("BotaoVoz").set_pressed(false)
#	$Voz.play() #O comando de baixo ja preciona o botao automaticamente via codigo, dando 'play' no botao de voz
	
	if self.get_parent().get_parent().get_parent().get_node_or_null("BotaoVoz"):
		self.get_parent().get_parent().get_parent().get_node_or_null("BotaoVoz").pressed = true
		pass
	pass

func _vozFinalizada():
	if self.get_parent().get_parent().get_parent().get_node_or_null("BotaoVoz"):
		self.get_parent().get_parent().get_parent().get_node_or_null("BotaoVoz").pressed = false
	pass
