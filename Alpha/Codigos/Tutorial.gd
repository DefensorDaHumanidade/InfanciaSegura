extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().current_scene.name == "TelaEscola":
		if get_parent().name == "Coluna1":
			self.pressed = Configuracoes.salvar.EscolaTutorial1
		if get_parent().name == "Coluna2":
			self.pressed = Configuracoes.salvar.EscolaTutorial2
		if get_parent().name == "Coluna3":
			self.pressed = Configuracoes.salvar.EscolaTutorial3
#		if Configuracoes.salvar.EscolaTutorial1 and self.name == "Tutorial1":
#			self.pressed = false
#			self.modulate = Color(0.8, 0, 0, 1)
#		else:
#			self.pressed = true
#		if Configuracoes.salvar.EscolaTutorial2 and self.name == "Tutorial2":
#			self.pressed = false
#			self.modulate = Color(0, 0.8, 0, 1)
#		else:
#			self.pressed = true
#		if Configuracoes.salvar.EscolaTutorial3 and self.name == "Tutorial3":
#			self.pressed = false
#			self.modulate = Color(1.8, 1.8, 1.8, 1)
#		else:
#			self.pressed = true
	if get_tree().current_scene.name == "TelaHospital":
		if  get_parent().name == "Coluna1":
			self.pressed = Configuracoes.salvar.HospitalTutorial1
		if get_parent().name == "Coluna2":
			self.pressed = Configuracoes.salvar.HospitalTutorial2
		if get_parent().name == "Coluna3":
			self.pressed = Configuracoes.salvar.HospitalTutorial3
	if get_tree().current_scene.name == "TelaDelegacia":
		if  get_parent().name == "Coluna1":
			self.pressed = Configuracoes.salvar.DelegaciaTutorial1
		if get_parent().name == "Coluna2":
			self.pressed = Configuracoes.salvar.DelegaciaTutorial2
		if get_parent().name == "Coluna3":
			self.pressed = Configuracoes.salvar.DelegaciaTutorial3
	if get_tree().current_scene.name == "TelaInternet":
		if  get_parent().name == "Coluna1":
			self.pressed = Configuracoes.salvar.InternetTutorial1
		if get_parent().name == "Coluna2":
			self.pressed = Configuracoes.salvar.InternetTutorial2
		if get_parent().name == "Coluna3":
			self.pressed = Configuracoes.salvar.InternetTutorial3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tutorial_pressed():
	pass # Replace with function body.


func _on_Tutorial_toggled(button_pressed):
	$Som.play()
	if get_tree().current_scene.name == "TelaEscola" and get_parent().name == "Coluna1":
		Configuracoes.salvar.EscolaTutorial1 = button_pressed
	if get_tree().current_scene.name == "TelaEscola" and get_parent().name == "Coluna2":
		Configuracoes.salvar.EscolaTutorial2 = button_pressed
	if get_tree().current_scene.name == "TelaEscola" and get_parent().name == "Coluna3":
		Configuracoes.salvar.EscolaTutorial3 = button_pressed
		
	if get_tree().current_scene.name == "TelaDelegacia" and get_parent().name == "Coluna1":
		Configuracoes.salvar.DelegaciaTutorial1 = button_pressed
	if get_tree().current_scene.name == "TelaDelegacia" and get_parent().name == "Coluna2":
		Configuracoes.salvar.DelegaciaTutorial2 = button_pressed
	if get_tree().current_scene.name == "TelaDelegacia" and get_parent().name == "Coluna3":
		Configuracoes.salvar.DelegaciaTutorial3 = button_pressed
		
	if get_tree().current_scene.name == "TelaHospital" and get_parent().name == "Coluna1":
		Configuracoes.salvar.HospitalTutorial1 = button_pressed
	if get_tree().current_scene.name == "TelaHospital" and get_parent().name == "Coluna2":
		Configuracoes.salvar.HospitalTutorial2 = button_pressed
	if get_tree().current_scene.name == "TelaHospital" and get_parent().name == "Coluna3":
		Configuracoes.salvar.HospitalTutorial3 = button_pressed
		
	if get_tree().current_scene.name == "TelaInternet" and get_parent().name == "Coluna1":
		Configuracoes.salvar.InternetTutorial1 = button_pressed
	if get_tree().current_scene.name == "TelaInternet" and get_parent().name == "Coluna2":
		Configuracoes.salvar.InternetTutorial2 = button_pressed
	if get_tree().current_scene.name == "TelaInternet" and get_parent().name == "Coluna3":
		Configuracoes.salvar.InternetTutorial3 = button_pressed
	pass # Replace with function body.
