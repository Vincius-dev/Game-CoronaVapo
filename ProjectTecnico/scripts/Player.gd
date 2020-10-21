extends KinematicBody2D

const SPEED = 300
var walk = Vector2()

func _physics_process(delta):
	
	_move(delta)
	
	pass

func _move(delta):
	
	if Input.is_action_pressed("up"):
		walk.y = -SPEED
	elif Input.is_action_pressed("down"):
		walk.y = SPEED
	else:
		walk.y = 0 
	
	if Input.is_action_pressed("left"):
		walk.x = -SPEED
	elif Input.is_action_pressed("right"):
		walk.x = SPEED
	else:
		walk.x = 0
	
	move_and_slide(walk)

