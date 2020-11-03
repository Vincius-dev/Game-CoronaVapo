extends Node2D

var inicialpos = position
func _ready():
	pass

func changePositionLeft():
	position = get_node("../").position * 2 - inicialpos
	pass

func changePositionRight():
	position = inicialpos
	pass
