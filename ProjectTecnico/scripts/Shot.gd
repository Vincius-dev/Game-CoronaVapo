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
	move_local_x(direcao * velocidade)
	
	if direcao == 1:
		$SpriteRight.show()
		$SpriteLeft.hide()
	
	if direcao == -1:
		$SpriteRight.hide()
		$SpriteLeft.show()
	
	time += delta
	
	if time > 4:
		queue_free()
	pass

func _on_Area2D_body_entered(body):
	print(body)
	body.dano()
	queue_free()
	
func SwitchBullet():
	if bullet == 1:
		$SpriteRight.set_texture(bulletGlock)
		$SpriteLeft.set_texture(bulletGlock)
	if bullet == 2:
		$SpriteRight.set_texture(bulletShotgun)
		$SpriteLeft.set_texture(bulletShotgun)
	if bullet == 3:
		$SpriteRight.set_texture(bulletAK)
		$SpriteLeft.set_texture(bulletAK)
		velocidade = 20
