extends Resource
#class_name Salvar

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (String) var Cena
export (String) var Identificador
export (String) var Idioma
export (String) var NomeMusica
export (String) var Genero
#export (int, 0, 20) var Musica
#export (int, 0, 20) var Voz
#export (int, 0, 20) var Audio
#export (int, 39, 70) var Texto
export var Musica : int
export var Voz : int
export var Audio : int
export var Texto : int
export var EscolaFase1 : Array

export (bool) var EscolaTutorial1 := false
export (bool) var EscolaTutorial2 := false
export (bool) var EscolaTutorial3 := false

export (bool) var HospitalTutorial1 := false
export (bool) var HospitalTutorial2 := false
export (bool) var HospitalTutorial3 := false

export (bool) var DelegaciaTutorial1 := false
export (bool) var DelegaciaTutorial2 := false
export (bool) var DelegaciaTutorial3 := false

export (bool) var InternetTutorial1 := false
export (bool) var InternetTutorial2 := false
export (bool) var InternetTutorial3 := false

export var TempoAuxiliar : int

export var EscolaTempo1 : int
export var EscolaTempo2 : int
export var EscolaTempo3 : int

export var EscolaMenorTempo1 : int
export var EscolaMenorTempo2 : int
export var EscolaMenorTempo3 : int

export var EscolaErro1 : int
export var EscolaErro2 : int
export var EscolaErro3 : int

export var EscolaMenorErro1 := 999
export var EscolaMenorErro2 := 999
export var EscolaMenorErro3 := 999



export var HospitalTempo1 : int
export var HospitalTempo2 : int
export var HospitalTempo3 : int

export var HospitalMenorTempo1 : int
export var HospitalMenorTempo2 : int
export var HospitalMenorTempo3 : int

export var HospitalErro1 : int
export var HospitalErro2 : int
export var HospitalErro3 : int

export var HospitalMenorErro1 := 999
export var HospitalMenorErro2 := 999
export var HospitalMenorErro3 := 999


export var DelegaciaTempo1 : int
export var DelegaciaTempo2 : int
export var DelegaciaTempo3 : int

export var DelegaciaMenorTempo1 : int
export var DelegaciaMenorTempo2 : int
export var DelegaciaMenorTempo3 : int

export var DelegaciaErro1 : int
export var DelegaciaErro2 : int
export var DelegaciaErro3 : int

export var DelegaciaMenorErro1 := 999
export var DelegaciaMenorErro2 := 999
export var DelegaciaMenorErro3 := 999


export var InternetTempo1 : int
export var InternetTempo2 : int
export var InternetTempo3 : int

export var InternetMenorTempo1 : int
export var InternetMenorTempo2 : int
export var InternetMenorTempo3 : int

export var InternetErro1 : int
export var InternetErro2 : int
export var InternetErro3 : int

export var InternetMenorErro1 := 999
export var InternetMenorErro2 := 999
export var InternetMenorErro3 := 999



# Called when the node enters the scene tree for the first time.
func _ready():
#	ResourceSaver.save("res://Dados.tres", self)
	pass # Replace with function body.

func criarArquivo():
	ResourceSaver.save("res://Dados.tres", self)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
