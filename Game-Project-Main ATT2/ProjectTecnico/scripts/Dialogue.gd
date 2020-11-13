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
			$Label.text = "Sempre bom te ver amigo !!!"
		if numberText == 2:
			$Label.text = "Estou recomeçando os meus estudos, Ainda não tive nenhum progresso."
		if numberText == 3:
			$Label.text = "No momento tenho muito a fazer, por favor não me atrapalhe."


	if nameText == "falaCientista2":
		if numberText == 1:
			$Label.text = "Sempre bom te ver amigo !!!"
		if numberText == 2:
			$Label.text = "Encontrei alguns estudos por aqui eles podem vir a me ajudar."
		if numberText == 3:
			$Label.text = "No momento tenho muito a fazer, por favor não me atrapalhe."
		if numberText == 4:
			$Label.text = "Continue segurando eles."


	if nameText == "falaCientista3":
		if numberText == 1:
			$Label.text = "Sempre bom te ver amigo !!! Você parece estar indo muito bem lá fora."
		if numberText == 2:
			$Label.text = "Tive um progresso considerável em minhas pesquisas, me traga mais amostras, talvez eu tenha sucesso."
		if numberText == 3:
			$Label.text = "No momento tenho muito a fazer, por favor não me atrapalhe."
		if numberText == 4:
			$Label.text = "Lembre-se, oque não te mata te torna mais forte."

	if nameText == "falaCientista4":
		if numberText == 1:
			$Label.text = "Ai está você. Tenho ótimas notícias."
		if numberText == 2:
			$Label.text = "Eu tenho fortes indícios de que eu ha encontrei."
		if numberText == 3:
			$Label.text = "Sim, eu encontrei a formula da vacina mas eu ainda preciso de algum tempo."
		if numberText == 4:
			$Label.text = "Para isso você deve aguentar todas essas proximas hordas de zumbi !"

	if nameText == "falaEngenheiro":
		if numberText == 1:
			$Label.text = "Caramba, até inúteis como você conseguem sobreviver?"
		if numberText == 2:
			$Label.text = "a humanidade ter sucumbido a isto quase chega a ser uma piada."

	if nameText == "falaEngenheiro2":
		if numberText == 1:
			$Label.text = "Olha só,até pessoas como você conseguem sobreviver lá fora, parece que eles estão realmente enfraquecendo."
		if numberText == 2:
			$Label.text = "Me deixe em paz, vá fazer o seu trabalho." 

	if nameText == "falaEngenheiroSHOT":
		if numberText == 1:
			$Label.text = "Não que você mereça, mas eu achei um negócio ali atr3ás e como eu não to afim de ir lá, vou deixar você usar."
		if numberText == 2:
			$Label.text = "mas não vá se acustumando." 

	if nameText == "falaEngenheiro3":
		if numberText == 1:
			$Label.text = "Você ainda está vivo? Achei que já tinha sucumbido aos infectados."
		if numberText == 2:
			$Label.text = "Vá fazer o seu trabalho, estou ocupado dormindo." 

	if nameText == "falaEngenheiroAK":
		if numberText == 1:
			$Label.text = "Você não é a melhor das opções, e essa arma é realmente boa, então..."
		if numberText == 2:
			$Label.text = "vê se acerta alguns infectados."
 

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
