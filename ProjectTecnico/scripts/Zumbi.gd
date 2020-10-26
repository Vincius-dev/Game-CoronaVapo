extends StaticBody2D
var flip = true
var inicial
var final
var velocidade = 3

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
func dano():
	print("Morreu")
	$".".queue_free()
