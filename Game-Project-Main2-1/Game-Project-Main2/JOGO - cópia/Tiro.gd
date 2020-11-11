extends Node2D

var giro = Vector2()
var vel = 500

func _ready():
	set_process(true)
	
	pass

func _process(delta):
	_tiro(delta)
	pass

func _tiro(delta):
	
	set_position (get_position()+ Vector2() * vel * delta )

