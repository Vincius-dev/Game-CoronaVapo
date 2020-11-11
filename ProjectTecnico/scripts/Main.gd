extends Node

var wave0 = load("res://scenes/Wave.tscn")
var base0 = load("res://scenes/Base.tscn")
var numberWave = 1

func _ready():
	var wave1 = wave0.instance()
	add_child(wave1)
	wave1.waveNumber = 1
	wave1.connect("passarWave", self, "passar_wave")
	pass

func passar_wave():
	numberWave = +1
	var base1 = base0.instance()
	add_child(base1)
	base1.connect("sairBase",self,"sair_base")
	pass

func sair_base():
	numberWave += 1
	var wave2 = wave0.instance()
	add_child(wave2)
	wave2.waveNumber = numberWave
	wave2.connect("passarWave", self, "passar_wave")
	pass


