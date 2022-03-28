extends RichTextLabel

export (String) var CarregarTexto

func _ready():
	self.bbcode_text = tr(CarregarTexto)
	pass
