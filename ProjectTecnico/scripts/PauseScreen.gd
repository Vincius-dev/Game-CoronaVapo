extends Control

var secondPass = 10
var mortes = 0

func _process(delta):
	if get_tree().paused and secondPass > 0:
		show()
	if secondPass == 0:
		hide()
		get_tree().paused = false
		$Timer.stop()
		secondPass = 10
	
	if mortes == 1:
		show_mensage1()
	if mortes == 2:
		show_mensage2()
	if mortes == 3:
		show_mensage3()
	if mortes == 4:
		show_game_over()
	
	change_time()
	pass

func death_mensage():
	get_tree().paused = !get_tree().paused
	$Timer.start()
	mortes += 1
	pass

func time():
	secondPass -= 1
	pass

func change_time():
	if visible == true:
		$timeLabel.text = ("Levantando em " + String(secondPass))
	pass

func show_game_over():
	$Timer.stop()
	$timeLabel.visible = false
	$mainLabel.text = "Você foi infectado, agora é sem volta"
	$Label.text = "Na próxima vez lembre-se de seguir as medidas de distanciamento"
	pass

func show_mensage1():
	$Label.text = "Porem ainda consegue continuar "
	pass
	
func show_mensage2():
	$Label.text = "Você esta incrivelmente ferido, mas ainda pode andar"
	pass
	
func show_mensage3():
	$Label.text = "Você sobreviveu graças as medidas de segurança, mas não aguentará uma próxima vez"
	pass
	
func reset_mortes():
	mortes = 0
	pass
