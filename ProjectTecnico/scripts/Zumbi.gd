extends StaticBody2D
var flip = true
var inicial
var final
var velocidade = 3
var vida = 6


func _ready():
	$Sprite.play("Walk")
	inicial = $".".position.x
	final = inicial +100

func _process(delta):
	
	if(inicial <= final and flip):
		$".".position.x += velocidade
		$Sprite.flip_h = false
		if ($".".position.x >= final and flip):
			flip = false
			
	if($".".position.x >= inicial and !flip):
		$".".position.x -= velocidade
		$Sprite.flip_h = true
		if($".".position.x <= inicial):
			flip = true

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
