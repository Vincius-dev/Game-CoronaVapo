extends RigidBody2D

const Velocidade = 20
const Dano = 2
const cadencia = 0.1
var direcao = 1

func _ready():
	pass

func _process(delta):
	move()
	pass

func move():
	if direcao == 1:
		position += Vector2(1,0) * Velocidade
		$Sprite.flip_h = false
	if direcao == 2:
		position += Vector2(-1,0) * Velocidade
		$Sprite.flip_h = true
	pass


func sreen_exited():
	queue_free()
	pass # Replace with function body.
