extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()

var tocar = false

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	if rng.randi_range(0,1):
		self.texture = load("res://Elementos/Visuais/DelegaciaFase3/Arvore2.png")
	if rng.randi_range(0,1):
		self.flip_h = true
	self.get_material().set_shader_param("velocidade", rng.randf_range(1, 3.0))
	self.get_material().set_shader_param("amplitude", rng.randf_range(20, 50.0))
	pass # Replace with function body.

#MeshInstance>Mesh>Make unique

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Contorno_torcarArvore(event):
	if event is InputEventScreenTouch:
		if tocar:
			tocar = false
		else:
			tocar = true
			$Animar.play("Folhas")
			$Som.play()
			$Contorno.mouse_filter = 2
	pass # Replace with function body.
