extends Node2D

var tiro0 = preload("res://scenes/Shot.tscn")
var TravaTiro = false
var direcao = 1

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
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
	
	if !tiro:
		TravaTiro = false
	
	if tiro and TravaTiro == false and direcao == 1:
		var tiro1 = tiro0.instance()
		tiro1.direcao = 1 
		tiro1.position = global_position
		get_node("../../").add_child(tiro1)
		TravaTiro = true

	if tiro and TravaTiro == false and direcao == -1:
		var tiro1 = tiro0.instance()
		tiro1.direcao = -1 
		tiro1.position = global_position
		get_node("../../").add_child(tiro1)
		TravaTiro = true

	if tiro:
		get_tree().call_group("player","GunsList")
		get_tree().call_group("Bullet","BulletList")

