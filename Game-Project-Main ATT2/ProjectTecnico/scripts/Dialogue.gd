extends Control

var nameText = "null"
var numberText = 1
var dialogueEnd = false

signal mostrarArma
signal pararArma

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
			$Label.text = "Um humano intacto, Incrível! Você por acaso tem um nome? Quer saber, isso nem importa mais."
		if numberText == 2:
			$Label.text = "O mundo mudou depois daquele vírus. Ele foi negligenciado inicialmente, porém causou a extinção da nossa espécie. Definitivamente é a pior escolha que já fizemos."
		if numberText == 3:
			$Label.text = "Sabe, era respeitar medidas tão simples, mas depois daquela mutação as coisas ficaram diferentes... Ele tomou total controle do neocórtex cerebral."
		if numberText == 4:
			$Label.text = "As pessoas se tornaram selvagens, e atacavam a todos. Foi um caos, cerca de 99,9% da humanidade foi extinta."
		if numberText == 5:
			$Label.text = "Acredite se quiser, a ultima resistência da humanidade está no Brasil..."
		if numberText == 6:
			$Label.text = "Somos nós, e agora você faz parte dela."
		if numberText == 7:
			$Label.text = "É muito perigoso conversar aqui fora, vamos entrar. Mas antes elimine esses infectados, siga minhas instruções."
		if numberText == 8:
			get_tree().change_scene("res://scenes/Main.tscn")
	
	if nameText == "cientistaFimDoJogo":
		if numberText == 1:
			$Label.text = "Você se saiu muito bem, finalmente consegui finalizar o protótipo da vacina."
		if numberText == 2:
			$Label.text = "Parece que a humanidade pode começar a se estabelecer agora, apesar de que será um processo extremamente demorado."
		if numberText == 3:
			$Label.text = "Também não sabemos ainda quantos poderão ser salvos. Mas pelo menos temos uma chance de reverter esta situação."
		if numberText == 4:
			$Label.text = "Muitos testes ainda precisam ser feitos. Mas obrigado por sua ajuda, sem ela não teríamos chegado até aqui."
		if numberText == 5:
			$Label.text = "Devemos continuar com as medidas de segurança até que está situação esteja controlada, mas não podemos abandonar os hábitos de higiene."
		if numberText == 6:
			get_tree().change_scene("res://scenes/FimDoJogo.tscn")

	if nameText == "falaCientista":
		if numberText == 1:
			$Label.text = "É Sempre bom te ver, abençoado combatente!!!"
		if numberText == 2:
			$Label.text = "Estou recomeçando os meus estudos, Eu ainda não tive nenhum progresso."
		if numberText == 3:
			$Label.text = "No momento tenho muito a fazer, por favor não me atrapalhe."


	if nameText == "falaCientista2":
		if numberText == 1:
			$Label.text = "É Sempre bom te ver, abençoado combatente!!!"
		if numberText == 2:
			$Label.text = "Encontrei alguns estudos por aqui eles podem vir a me ajudar."
		if numberText == 3:
			$Label.text = "No momento tenho muito a fazer, por favor não me atrapalhe."
		if numberText == 4:
			$Label.text = "Continue segurando eles."


	if nameText == "falaCientista3":
		if numberText == 1:
			$Label.text = "Sempre bom te ver amigo!!! Você parece estar indo muito bem lá fora."
		if numberText == 2:
			$Label.text = "Tive um progresso considerável em minhas pesquisas, me traga mais amostras, talvez eu tenha sucesso."
		if numberText == 3:
			$Label.text = "No momento tenho muito a fazer, por favor não me atrapalhe."
		if numberText == 4:
			$Label.text = "Lembre-se, o que não te mata te torna mais forte."

	if nameText == "falaCientista4":
		if numberText == 1:
			$Label.text = "Ai está você. Tenho ótimas notícias."
		if numberText == 2:
			$Label.text = "Eu tenho fortes indícios de que há encontrei."
		if numberText == 3:
			$Label.text = "Sim, eu encontrei a fórmula da vacina mas eu ainda preciso de algum tempo."
		if numberText == 4:
			$Label.text = "Para isso você deve agüentar todas essas próximas hordas de zumbi !"

	if nameText == "falaEngenheiro":
		if numberText == 1:
			$Label.text = "Caramba, até inúteis como você conseguem sobreviver?"
		if numberText == 2:
			$Label.text = "A humanidade ter sucumbido a isto quase chega a ser uma piada."

	if nameText == "falaEngenheiro2":
		if numberText == 1:
			$Label.text = "Olha só, até pessoas como você conseguem sobreviver lá fora, parece que eles estão realmente enfraquecendo."
		if numberText == 2:
			$Label.text = "Não atrapalhe o meu sono, vá fazer o seu trabalho." 

	if nameText == "falaEngenheiroSHOT":
		if numberText == 1:
			$Label.text = "Não que você mereça, mas eu achei isso ali atrás, e como eu não to  a fim de ir lá, vou deixar você usar."
		if numberText == 2:
			$Label.text = "Mas não vá se acostumando." 
		if numberText == 3:
			emit_signal("mostrarArma")
		if numberText == 4:
			$Label.text = "..."
			emit_signal("pararArma")

	if nameText == "falaEngenheiro3":
		if numberText == 1:
			$Label.text = "Você ainda está vivo? Achei que já tinha sucumbido aos infectados."
		if numberText == 2:
			$Label.text = "Vá fazer o seu trabalho, estou ocupado dormindo." 

	if nameText == "falaEngenheiroAK":
		if numberText == 1:
			$Label.text = "Você não é a melhor das opções, mas é o único no momento. Então leve essa arma, ela realmente boa, portanto..."
		if numberText == 2:
			$Label.text = "Vê se acerta alguns infectados."
		if numberText == 3:
			emit_signal("mostrarArma")
		if numberText == 4:
			$Label.text = "..."
			emit_signal("pararArma")
 

	if nameText == "falaEngenheiro4":
		if numberText == 1:
			$Label.text = "Você até que está sendo de alguma utilidade, mas não fique convencido. Uma vida se esvai rapidamente."
		if numberText == 2:
			$Label.text = "Eu acho que li isso em um livro." 

	if nameText == "falaEngenheiro5":
		if numberText == 1:
			$Label.text = "Não pensei que você iria durar até aqui, realmente sua ajuda foi necessária nessa missão."
		if numberText == 2:
			$Label.text = "Estou começando a ter esperanças, continue nesse ritmo." 

	pass
