extends KinematicBody2D
var vida = 6

var velocity = Vector2()

var speed = 40

signal zumbiDeath

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
	if vida <= 0:
		emit_signal("zumbiDeath")
		queue_free()
	pass

func DamageAK():
	vida -= 2
	if vida <= 0:
		emit_signal("zumbiDeath")
		queue_free()
	pass

func DamageShotgun():
	vida -= 3
	if vida <= 0:
		emit_signal("zumbiDeath")
		queue_free()
	pass

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		body.dano()
	pass #
