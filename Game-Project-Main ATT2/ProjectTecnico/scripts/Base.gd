extends Control

var dialogo0 = load("res://scenes/Dialogue.tscn")
var numberwave = 1

signal sairBase
signal TrocarTelaBase

func _ready():
	dialogo_cientista()
	pass

func dialogo_cientista():
	print("numero da wave é :", numberwave)
	if numberwave < 5:
		var dialogo1 = dialogo0.instance()
		add_child(dialogo1) 
		dialogo1.nameText = "falaCientista"
	if numberwave >= 5 and numberwave < 10:
		var dialogo1 = dialogo0.instance()
		add_child(dialogo1) 
		dialogo1.nameText = "falaCientista2"
	if numberwave >= 10 and numberwave < 15:
		var dialogo1 = dialogo0.instance()
		add_child(dialogo1) 
		dialogo1.nameText = "falaCientista3"
	if numberwave >= 15 and numberwave < 20:
		var dialogo1 = dialogo0.instance()
		add_child(dialogo1) 
		dialogo1.nameText = "falaCientista4"
	pass

func _process(delta):
	if Input.is_action_just_pressed("sairbase"):
		emit_signal("sairBase")
		queue_free()
	pass


func _on_Button_pressed():
	emit_signal("TrocarTelaBase")
	queue_free()
	pass 
