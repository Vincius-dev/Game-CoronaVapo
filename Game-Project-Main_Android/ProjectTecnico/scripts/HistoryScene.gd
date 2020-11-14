extends Control

var dialogue0 = load("res://scenes/Dialogue.tscn") 

func _ready():
	$Musica.play()
	var dialogue1 = dialogue0.instance()
	add_child(dialogue1)
	dialogue1.nameText = "cientistaHistoria"
	pass 
