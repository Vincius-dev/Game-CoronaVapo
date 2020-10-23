extends Node2D

var giro = Vector2()
var vel = 500
var dir = 0

func _ready():
	
 set_process(true)
pass

func _process(delta):
	
	set_position (get_position()+ Vector2(0,0) * vel * delta )
	
	
