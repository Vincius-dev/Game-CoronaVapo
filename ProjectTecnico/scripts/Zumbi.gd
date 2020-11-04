extends StaticBody2D
var vida = 6
const speed = 200

func _ready():
	
	pass

func _process(delta):
	
	pass

func _physics_process(delta):
	var toplayer = ($"res://scenes/Player.tscn".position - position.normalized())
	
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
