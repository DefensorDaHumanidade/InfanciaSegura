extends CheckButton


func _ready():
	pass


func _Tutorial(estado):
	$Som.play()
	if estado:
		$Animar.play("Com")
	else:
		$Animar.play("Sem")
	pass
