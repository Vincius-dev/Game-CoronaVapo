extends KinematicBody2D
var vida = 6

var velocity = Vector2()

const speed = 100

func _physics_process(delta):
	var toPlayer = ($"../Player".position - position).normalized()
	velocity = toPlayer * speed
	move_and_collide(velocity*delta)
	zumbi_direction()
	pass

func zumbi_direction():
	var playerDirection 
	playerDirection = ($"../Player/AnimatedSprite".flip_h)
	if playerDirection == true:
		$Sprite.flip_h = true
	if playerDirection == false:
		$Sprite.flip_h = false
	pass

func DamageGlock():
	vida -= 1
	print("vida -1")
	if vida <= 0:
		queue_free()
	pass

func DamageAK():
	vida -= 2
	print("vida -2")
	if vida <= 0:
		queue_free()
	pass

func DamageShotgun():
	vida -= 3
	print("vida -3")
	if vida <= 0:
		queue_free()
	pass

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		body.dano()
	pass #
