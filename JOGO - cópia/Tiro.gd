extends Node2D

var giro = Vector2()
var vel = 500
var dir = 0

func _ready():
	
 set_process(true)
pass

func _angulo(delta):
	if Input.is_action_pressed("ui_right"):
		giro.x = vel
		
	elif Input.is_action_pressed("ui_left"):
		giro.x = -vel
		
	else:
	 giro.x = 0


	
pass
func _process(delta):
		if Input.is_action_pressed("ui_right"):
			giro.x = vel
		
		elif Input.is_action_pressed("ui_left"):
			giro.x = -vel
		
		else:
			set_position (get_position()+ Vector2(0,0) * vel * delta )
	
	
