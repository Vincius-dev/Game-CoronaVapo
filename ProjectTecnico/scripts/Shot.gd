extends Node2D

var direcao = 0
var velocidade = 10
var time = 0

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
