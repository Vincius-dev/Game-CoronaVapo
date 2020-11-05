extends Node

signal StartWave

func _ready():
	pass 
	
func SwitchWave():
	
	emit_signal("StartWave")
	pass
