extends Control

signal sairBase

func _ready():
	pass 



func _on_Button_pressed():
	emit_signal("sairBase")
	queue_free()
	pass 
