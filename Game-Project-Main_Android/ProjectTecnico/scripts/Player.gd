extends KinematicBody2D

const SPEED = 300
var walk = Vector2()
var bulletAtual = 1
var bullet = 1
var shootingV = false
var ShootingON = true
var walkON = true
var time = 0
var vida = 4
var gunlockAK =  false
var gunlockSHOT = false

var touchTop = false
var touchDown = false
var touchLeft = false
var touchRight = false
var touchShot = false
var touchSwitch = false

var ShotG0 = preload("res://scenes/Bullets/ShotGlock.tscn") 
var ShotA0 = preload("res://scenes/Bullets/ShotAk.tscn")
var ShotS0 = preload("res://scenes/Bullets/ShotShotgun.tscn")

signal PlayerDead
signal tomaDano
signal tomaDanoBoss

func _physics_process(delta):
	time += 1 
	ShotCadence()
	GunsSwitch()
	shooting()
	animation_walk()
	visilibility()
	_move(delta)
	pass

func _move(delta):
	if touchShot == true:
		walkON = false
	else:
		walkON = true
	
	if touchTop == true and walkON == true:
		walk.y = -SPEED
	elif touchDown == true and walkON == true:
		walk.y = SPEED
	else:
		walk.y = 0 
	if touchLeft == true and walkON == true:
		walk.x = -SPEED
		$AnimatedSprite.flip_h = true
		shootingV = false
	elif touchRight == true and walkON == true:
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
	if bulletAtual == 4:
		bulletAtual = 1
	if bulletAtual == 1:
		bullet = 1
	if bulletAtual == 2 and gunlockSHOT == true:
		bullet = 3
	if bulletAtual == 3 and gunlockAK == true:
		bullet = 2
	pass

func shooting():
	if ShootingON == true:
		if touchShot == true and bullet == 1:
			var ShotG1 = ShotG0.instance()
			ShotG1.set_global_position($AnimatedSprite/BulletStart.get_global_position())
			if $AnimatedSprite.flip_h == true:
				ShotG1.direcao = 2
				get_tree().call_group("position","changePositionLeft")
			if $AnimatedSprite.flip_h == false:
				ShotG1.direcao = 1
				get_tree().call_group("position","changePositionRight")
			get_node("../").add_child(ShotG1)
			$Shot_Glock.play()
			shootingV = true
			ShootingON = false
			time = 0

		if touchShot == true and bullet == 2:
			var ShotA1 = ShotA0.instance()
			ShotA1.set_global_position($AnimatedSprite/BulletStart.get_global_position())
			
			if $AnimatedSprite.flip_h == true:
				ShotA1.direcao = 2
				get_tree().call_group("position","changePositionLeft")
			if $AnimatedSprite.flip_h == false:
				ShotA1.direcao = 1
				get_tree().call_group("position","changePositionRight")
			get_node("../").add_child(ShotA1)
			$Shot_AK.play()
			shootingV = true
			ShootingON = false
			time = 0

		if touchShot == true and bullet == 3:
			var ShotS1 = ShotS0.instance()
			ShotS1.set_global_position($AnimatedSprite/BulletStart.get_global_position())
			if $AnimatedSprite.flip_h == true:
				ShotS1.direcao = 2
				get_tree().call_group("position","changePositionLeft")
			if $AnimatedSprite.flip_h == false:
				ShotS1.direcao = 1
				get_tree().call_group("position","changePositionRight")
			get_node("../").add_child(ShotS1)
			$Shot_Shotgun.play()
			shootingV = true
			ShootingON = false
			time = 0
	pass

func ShotCadence():
	if ShootingON == false and bullet == 1:
		if time >= 40:
			ShootingON = true
	if ShootingON == false and bullet == 2:
		if time >= 20:
			ShootingON = true
	if ShootingON == false and bullet == 3:
		if time >= 70:
			ShootingON = true
	pass

func dano():
	vida -= 1
	$Damage.play()
	emit_signal("tomaDano")
	if vida == 0:
		emit_signal("PlayerDead")
		visible = false

func danoboss():
	vida -= 2
	$Damage.play()
	emit_signal("tomaDanoBoss")
	if vida == 0:
		emit_signal("PlayerDead")
		visible = false

func visilibility():
	if vida > 0:
		visible = true
	pass

func _on_Down_Button_pressed():
	touchDown = true
	pass 
func _on_Down_Button_released():
	touchDown = false
	pass 

func _on_Left_Button_pressed():
	touchLeft = true
	pass 
func _on_Left_Button_released():
	touchLeft = false
	pass 

func _on_Right_Button_pressed():
	touchRight = true
	pass 
func _on_Right_Button_released():
	touchRight = false
	pass

func _on_Top_Button_pressed():
	touchTop = true
	pass 
func _on_Top_Button_released():
	touchTop = false
	pass 

func _on_X_Button_pressed():
	touchShot = true
	pass 
func _on_X_Button_released():
	touchShot = false
	pass 

func _on_Switch_Button_pressed():
	bulletAtual += 1
	pass 

func _on_Switch_Button_released():
	touchSwitch = false
	pass 
