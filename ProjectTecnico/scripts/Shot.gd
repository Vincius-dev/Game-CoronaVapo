extends Node2D

var direcao = 0
var velocidade = 10
var time = 0
var bullet = 3

var bulletAK = preload("res://sprites/Armas/AK/Shot.png")
var bulletShotgun = preload("res://sprites/Armas/Shotgun/shot_shotgun.png")
var bulletGlock = preload("res://sprites/Armas/GLOCK/shot_glock.png") 

func _ready():
	
	pass

func _physics_process(delta):
	bulletVelocity()
	tiroMove()
	limitBullet(delta)

func _on_Area2D_body_entered(body):
	
	if bullet == 1:
		print(body)
		body.DamageGlock()
		queue_free()
	if bullet == 2:
		print(body)
		body.DamageAK()
		queue_free()
	if bullet == 3:
		print(body)
		body.DamageShotgun()
		queue_free()
	pass

func SwitchBullet():
	if bullet == 1:
		$SpriteRight.set_texture(bulletGlock)
		$SpriteLeft.set_texture(bulletGlock)

	if bullet == 3:
		$SpriteRight.set_texture(bulletShotgun)
		$SpriteLeft.set_texture(bulletShotgun)

	if bullet == 2:
		$SpriteRight.set_texture(bulletAK)
		$SpriteLeft.set_texture(bulletAK)

func tiroMove():
	move_local_x(direcao * velocidade)
	
	if direcao == 1:
		$SpriteRight.show()
		$SpriteLeft.hide()
	
	if direcao == -1:
		$SpriteRight.hide()
		$SpriteLeft.show()
	pass

func limitBullet(delta):
	time += delta

	if time > 0.7 and bullet == 4:
		queue_free()

	if time > 0.1 and bullet == 3:
		queue_free()
	
	elif time > 1 and bullet == 2:
		 queue_free()
	
	elif time > 1.5 and bullet == 1:
		 queue_free()
	pass

func bulletVelocity():
	
	if bullet == 1:
		velocidade = 10
	elif bullet == 2:
		velocidade = 20
	elif bullet == 3:
		velocidade = 40
	elif bullet == 4:
		velocidade = 25
	pass


func ColisaoBodyAK(body):
	
	pass 
