extends KinematicBody2D
class_name Player

const SPEED = 300
var walk = Vector2()
var weapon = 1

func _physics_process(delta):
	GunsSwitch()
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

func GunsList():
	if weapon == 1:
		$AnimatedSprite.play("Glock_Shot")
	if weapon == 2:
		$AnimatedSprite.play("AK_Shot")
	if weapon == 3:
		$AnimatedSprite.play("Shotgun_Shot")
	pass

func GunsSwitch():
	if Input.is_action_just_pressed("Slot1"):
		weapon = 1
		get_tree().call_group("Bullet","BulletSwitch1")
	if Input.is_action_just_pressed("Slot2"):
		weapon = 2
		get_tree().call_group("Bullet","BulletSwitch2")
	if Input.is_action_just_pressed("Slot3"):
		weapon = 3
		get_tree().call_group("Bullet","BulletSwitch3")
	pass
