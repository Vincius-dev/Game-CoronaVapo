extends KinematicBody2D
var vida = 3
var toPlayer
var inicialpos

var velocity = Vector2()

var speed = 40

signal zumbiDeath

func _physics_process(delta):
	toPlayer = ($"../Player".position - position).normalized()
	velocity = toPlayer * speed
	inicialpos = position.x
	move_and_collide(velocity*delta)
	zumbi_direction(delta)
	pass

func zumbi_direction(delta):
	if velocity.x < position.x * delta:
		$Sprite.flip_h = true
	if velocity.x > position.x * delta:
		$Sprite.flip_h = false
	pass

func DamageGlock():
	vida -= 0.5
	print(vida)
	if vida <= 0:
		emit_signal("zumbiDeath")
		queue_free()
	pass

func DamageAK():
	vida -= 1
	if vida <= 0:
		emit_signal("zumbiDeath")
		queue_free()
	pass

func DamageShotgun():
	vida -= 2
	if vida <= 0:
		emit_signal("zumbiDeath")
		queue_free()
	pass

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		body.dano()
	pass #
