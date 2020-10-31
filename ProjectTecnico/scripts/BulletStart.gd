extends Node2D

var tiro0 = preload("res://scenes/Shot.tscn")
var TravaTiro = false
var direcao = 1
var cooldownS = 1
var bulletS = 1
var timeS = 0
var somaTime = 1

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	Cooldown(delta)
	
	var direita = Input.is_action_pressed("right")
	var esquerda = Input.is_action_pressed("left")
	var tiro = Input.is_action_pressed("shot")
	
	if esquerda:
		direcao = -1
	
	if direita:
		direcao = 1
	
	if direcao == -1:
		position.x = -32
	
	if direcao == 1:
		position.x = 32 
	
	if !tiro and timeS >= somaTime:
		TravaTiro = false
	
	if tiro and TravaTiro == false and direcao == 1:
		var tiro1 = tiro0.instance()
		tiro1.direcao = 1 
		tiro1.position = global_position
		get_node("../../").add_child(tiro1)
		somaTime = timeS + cooldownS
		TravaTiro = true

	if tiro and TravaTiro == false and direcao == -1:
		var tiro1 = tiro0.instance()
		tiro1.direcao = -1 
		tiro1.position = global_position
		get_node("../../").add_child(tiro1)
		somaTime = timeS + cooldownS
		TravaTiro = true

	if tiro:
		get_tree().call_group("player","GunsList")
		get_tree().call_group("Bullet","BulletList")

func Cooldown(delta):
	var tiro1 = tiro0.instance()
	cooldownS = tiro1.cooldown
	bulletS = tiro1.bullet
	timeS += delta
	
	if bulletS == 1:
		cooldownS = 1
	if bulletS == 2:
		cooldownS = 0
	if bulletS == 3:
		cooldownS = 2
	pass

