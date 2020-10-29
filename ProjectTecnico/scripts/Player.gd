extends KinematicBody2D
class_name Player

const SPEED = 300
var walk = Vector2()
var disparo = 0
var weapon = 3

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
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = true

	elif Input.is_action_pressed("right"):
		walk.x = SPEED
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = false

	else:
		walk.x = 0
		$AnimatedSprite.play("Idle")
	
	move_and_slide(walk)

func SwitchWeapon():
	if weapon == 1:
		$AnimatedSprite.play("Glock_Shot")
	if weapon == 2:
		$AnimatedSprite.play("AK_Shot")
	if weapon == 3:
		$AnimatedSprite.play("Shotgun_Shot")
	pass
