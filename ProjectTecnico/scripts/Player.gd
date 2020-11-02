extends KinematicBody2D

const SPEED = 300
var walk = Vector2()
var bullet = 1
var shootingV = false

var ShotG0 = preload("res://scenes/Bullets/ShotGlock.tscn")
var ShotA0 = preload("res://scenes/Bullets/ShotAk.tscn")
var ShotS0 = preload("res://scenes/Bullets/ShotShotgun.tscn")


func _physics_process(delta):
	GunsSwitch()
	shooting()
	animation_walk()
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
		$AnimatedSprite.flip_h = true
		shootingV = false
	elif Input.is_action_pressed("right"):
		walk.x = SPEED
		$AnimatedSprite.flip_h = false
		shootingV = false
	else:
		walk.x = 0
	move_and_slide(walk)

func animation_walk():
	if walk.x != 0:
		$AnimatedSprite.play("Run")
	if walk.x == 0:
		$AnimatedSprite.play("Idle")

	if shootingV == true and bullet == 1:
		$AnimatedSprite.play("Glock_Shot")
	if shootingV == true and bullet == 2:
		$AnimatedSprite.play("AK_Shot")
	if shootingV == true and bullet == 3:
		$AnimatedSprite.play("Shotgun_Shot")
	pass

func animation_shooting():
	if shootingV == true and bullet == 1:
		$AnimatedSprite.play("Glock_Shot")
	if shootingV == true and bullet == 2:
		$AnimatedSprite.play("AK_Shot")
	if shootingV == true and bullet == 3:
		$AnimatedSprite.play("Shotgun_Shot")
	pass
	
func GunsSwitch():
	if Input.is_action_just_pressed("Slot1"):
		bullet = 1
	if Input.is_action_just_pressed("Slot2"):
		bullet = 2
	if Input.is_action_just_pressed("Slot3"):
		bullet = 3
	pass

func shooting():
	if Input.is_action_just_pressed("shot") and bullet == 1:
		var ShotG1 = ShotG0.instance()
		add_child(ShotG1)
		ShotG1.position = $BulletStart.position
		shootingV = true
	if Input.is_action_just_pressed("shot") and bullet == 2:
		var ShotA1 = ShotA0.instance()
		add_child(ShotA1)
		ShotA1.position = $BulletStart.position
		shootingV = true
	if Input.is_action_just_pressed("shot") and bullet == 3:
		var ShotS1 = ShotS0.instance()
		add_child(ShotS1)
		ShotS1.position = $BulletStart.position
		shootingV = true
	pass
