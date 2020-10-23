extends Node2D

var giro = Vector2()
var vel = 500
var dir = preload("res://Main.tscn")

func _ready():
	set_process(true)
	pass

func _process(delta):
	
	pass

func _tiro(delta):
	
	set_position (get_position()+ Vector2() * vel * delta )

