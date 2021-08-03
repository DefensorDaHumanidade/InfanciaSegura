extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var arrastar = false
var estado = null

export (String) var PecaAtual

var posicaoX = 1
var posicaoY = 0

var auxilicar = 0

var contador = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var aleatorio = RandomNumberGenerator.new()
	aleatorio.randomize()
	$AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.position = $AreaTrabalho/Centro/Imagem/Fundo.rect_position + Vector2($AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.texture.get_width()*$AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.scale.x/$AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.hframes*(2.5+posicaoX), $AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.texture.get_height()*$AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.scale.y/$AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.hframes*(2.5+posicaoY))
#	print($Peca_01.texture.get_width()*$Peca_01.scale.x, "=====", $Peca_01.texture.get_height()*$Peca_01.scale.x)
	$AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.frame = 0
	$AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.queue_free()
	
	for i  in range(0,4):
		for j in range(0,4):
			var duplicando = $AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.duplicate()
#			duplicando.scale = Vector2(0.25, 0.25)
			duplicando.get_node("Fundo").modulate = Color(1, 1, 1, 0.0)
			duplicando.modulate = Color(1, 1, 1, 0.4)
			duplicando.get_node("Numeracao").text = str(auxilicar)
			duplicando.frame = auxilicar
			duplicando.visible = true
			duplicando.position = $AreaTrabalho/Centro/Imagem/Fundo.rect_position + Vector2($AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.texture.get_width()*$AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.scale.x/$AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.hframes*(2.5+j), $AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.texture.get_height()*$AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.scale.y/$AreaTrabalho/Centro/Imagem/Fundo/PecaBase_01.hframes*(2.5+i))
			get_node("AreaTrabalho/Centro/Imagem/Fundo").add_child(duplicando)
			auxilicar += 1
	
	auxilicar = 0
	
	for i  in range(0,4):
		for j in range(0,4):
#			var peca = $ParteInferior/Peca_01.duplicate()
			var peca = $ParteInferior/QuebraCabecaPeca.duplicate()
			peca.frame = auxilicar
			peca.get_node("Numeracao").text = str(auxilicar)
#			peca.position = Vector2(100,100)*auxilicar
			peca.position = Vector2(aleatorio.randi_range(150, 1800), aleatorio.randi_range(10, 140))
			get_node("ParteInferior").add_child(peca)
			auxilicar += 1
	$ParteInferior/QuebraCabecaPeca.queue_free()


	
#	for i  in range(0,2):
#		for j in range(0,2):
#			var peca = $ParteInferior/QuebraCabecaFragmento.duplicate()
#			peca.get_node("Fragamento").frame = auxilicar
#			peca.get_node("YSort").z_index = auxilicar
#			peca.get_node("Numeracao").text = str(auxilicar)
#			get_node("ParteInferior").add_child(peca)
#			auxilicar += 1
#
	
	verificaSobreposicao()
	Configuracoes.salvar.TempoAuxiliar = OS.get_unix_time()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print("oi")
	pass


func verificaSobreposicao():
	for pecaCima in $ParteInferior.get_children():
		for pecaBaixo in $ParteInferior.get_children():
			if pecaCima.name != pecaBaixo.name:
				if pecaCima.position == pecaBaixo.position:
					print("Sobreposicao: ", pecaCima, pecaBaixo)
					pecaBaixo.position = Vector2(pecaBaixo.position.x - 100, pecaBaixo.position.y - 100)
	pass

func _on_Area_entrou(area):
#	print("Passando em cima da peca: ", int(PecaAtual)) #ELE ESTA FAZENDO ATRASADO
##	print(area.get_parent().get_node("Numeracao").text)
##	print(area.get_parent().frame)
#	if area.get_parent().frame == int(PecaAtual):
#		estado = true
##		print(area.get_parent().name)
##		PecaAtual = area.get_parent().name
##		print("Lugar certo")
#	else:
#		estado = false
	pass # Replace with function body.


