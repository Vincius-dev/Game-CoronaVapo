extends Control

var dialogo0 = load("res://scenes/Dialogue.tscn")
var numberwave = 4

signal SairBase
signal TrocarTelaBase

func _ready():
	$AnimationAK/Label.hide()
	$AnimationAK/Sprite.hide()
	$AnimationShot/Label.hide()
	$AnimationShot/Sprite.hide()
	dialogo_engenheiro()
	pass

func dialogo_engenheiro():
	if numberwave == 1:
		var dialogo1 = dialogo0.instance()
		add_child(dialogo1) 
		dialogo1.nameText = "falaEngenheiro"
	
	if numberwave < 5 and numberwave > 1:
		var dialogo1 = dialogo0.instance()
		add_child(dialogo1) 
		dialogo1.nameText = "falaEngenheiro2"
	
	if numberwave == 5:
		var dialogo1 = dialogo0.instance()
		add_child(dialogo1) 
		dialogo1.nameText = "falaEngenheiroSHOT"
		dialogo1.connect("mostrarArma",self,"mostrar_shot")
		dialogo1.connect("pararArma",self,"parar_shot")
	
	if numberwave < 10 and numberwave > 5:
		var dialogo1 = dialogo0.instance()
		add_child(dialogo1) 
		dialogo1.nameText = "falaEngenheiro3"
	
	if numberwave == 10:
		var dialogo1 = dialogo0.instance()
		add_child(dialogo1) 
		dialogo1.nameText = "falaEngenheiroAK"
		dialogo1.connect("mostrarArma",self,"mostrar_ak")
		dialogo1.connect("pararArma",self,"parar_ak")
	
	if numberwave > 10 and numberwave < 15:
		var dialogo1 = dialogo0.instance()
		add_child(dialogo1) 
		dialogo1.nameText = "falaEngenheiro4"
	
	if numberwave >= 15 and numberwave < 20:
		var dialogo1 = dialogo0.instance()
		add_child(dialogo1) 
		dialogo1.nameText = "falaEngenheiro5"
	pass

func _process(delta):
	if Input.is_action_just_pressed("sairbase"):
		emit_signal("SairBase")
		queue_free()
	pass

func _on_Button_pressed():
	emit_signal("TrocarTelaBase")
	queue_free()
	pass 

func mostrar_shot():
	$AnimationShot.play("Shot_give")
	pass
func parar_shot():
	$AnimationShot.stop()
	$AnimationShot/Label.hide()
	$AnimationShot/Sprite.hide()
	pass

func mostrar_ak():
	$AnimationAK.play("AK_Gift")
	pass
func parar_ak():
	$AnimationAK.stop()
	$AnimationAK/Label.hide()
	$AnimationAK/Sprite.hide()
	pass
