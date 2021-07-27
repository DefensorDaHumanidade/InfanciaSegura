extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	print("oieeee: 1", Configuracoes.animacaoPrincipal)
#	print("current_animation_position: ", self.name)
#	seek(10.5, true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Animar_animation_comecou(anim_name):
	self.seek(Configuracoes.animacaoPrincipal, false)
	pass # Replace with function body.


func _on_Animar_tree_saindo():
	print("Tempo da animacao: ", self.current_animation_position)
	Configuracoes.animacaoPrincipal = self.current_animation_position
	pass # Replace with function body.
