extends Control

var nameText = "null"
var numberText = 1
var dialogueEnd = false

func _ready():
	pass 

func _process(delta):
	TextList()
	pass

func TextList():
	if Input.is_action_just_pressed("nextText"):
		numberText += 1
	
	if nameText == "cientistaHistoria":
		if numberText == 1:
			$Label.text = "Um humano intacto, Incrível! você por acaso tem um nome? quer saber, isso nem importa mais."
		if numberText == 2:
			$Label.text = "O mundo mudou depois daquele vírus, negligenciado inicialmente, porém causou a estinção da nossa espécie. Definitivamente é a pior escolha que já fizemos."
		if numberText == 3:
			$Label.text = "Sabe, era respeitar medidas tão simples, mas depois daquela mutação as coisas ficaram diferentes... ele tomou total controle do necórtex cerebral."
		if numberText == 4:
			$Label.text = "As pessoas se tornaram selvagens, e atacavam á todos. Foi um caos, cerca de 99,9% da humanidade foi extinta."
		if numberText == 5:
			$Label.text = "Acredite se quiser, a ultima resistencia da humanidade está no Brasil..."
		if numberText == 6:
			$Label.text = "Somos nós, e agóra você faz parte dela."
		if numberText == 7:
			$Label.text = "É muito perigoso conversar aqui fora, vamos entrar. Mas antes elimine esses infectados, siga minhas instruções."
			get_tree().change_scene("res://scenes/Main.tscn")
	
	if nameText == "falaCientista":
		if numberText == 1:
			$Label.text = ""
		if numberText == 2:
			$Label.text = ""
		if numberText == 3:
			$Label.text = ""
		if numberText == 4:
			$Label.text = ""
	
	if nameText == "falaEngenheiro":
		if numberText == 1:
			$Label.text = ""
		if numberText == 2:
			$Label.text = ""
		if numberText == 3:
			$Label.text = ""
		if numberText == 4:
			$Label.text = ""
		
	pass
