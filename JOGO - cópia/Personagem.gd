extends KinematicBody2D

var intervalo = .3
var disparo = 0
var direcao_char = true
var pretiro = preload("res://Tiro.tscn")
const SPEED = 300
var walk = Vector2()


func _physics_process(delta):
	_atirar(delta)
	_move(delta)
	
	pass

func _move(delta):
	
	if Input.is_action_pressed("ui_up"):
		walk.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
		walk.y = SPEED
	else:
		walk.y = 0 
	
	if Input.is_action_pressed("ui_left"):
		walk.x = -SPEED
		$Movimentacao.play("Run")
		$Movimentacao.flip_h = true
		direcao_char = true
	elif Input.is_action_pressed("ui_right"):
		walk.x = SPEED
		$Movimentacao.play("Run")
		$Movimentacao.flip_h = false
		direcao_char = false
	else:
		walk.x = 0
		$Movimentacao.play("Idle")
	
	move_and_slide(walk)
	pass
	 
func _atirar(delta):
	 
	if Input.is_action_pressed("tiro"):
		if disparo <= 0:
			var tiro = pretiro.instance()
			tiro.set_global_position(get_global_position())
			get_node("../").add_child(tiro)
			disparo = intervalo
	
	pass
	
	if disparo > 0:
		disparo -= delta
pass

