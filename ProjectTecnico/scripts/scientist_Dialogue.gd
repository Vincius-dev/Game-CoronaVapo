extends Control

var numberText = 0
var rng = RandomNumberGenerator.new()
var TextOn= true

func _process(delta):
	pass

func textList():
	if TextOn == true:
		rng.randomize()
		numberText = rng.randi_range(1,10)
		visible = true
		$Timer2.start()
		
		if numberText == 1:
			$Label.text = "Evite tocar os olhos, o nariz e a boca. Você pode se tornar um deles."
			TextOn = false
		if numberText == 2:
			$Label.text = "As mãos estão em contato constante com superfícies que podem ser vetores de transmissão de vírus e bactérias. Mantênha-las longe das mucosas."
			TextOn = false
		if numberText == 3:
			$Label.text = "Não saia de casa se estiver com febre. Se os sintomas persistirem e caso haja dificuldade respiratória, busque atenção especializada imediatamente."
			TextOn = false
		if numberText == 4:
			$Label.text = "Tenha boas práticas de higiene respiratória. Isso significa cobrir a boca e o nariz com o braço ou lenço, isto pode salvar a sua vida."
			TextOn = false
		if numberText == 5:
			$Label.text = "Gotículas de saliva e secreção são vetores para a transmissão do virus, mantenha distancia dos infectados."
			TextOn = false
		if numberText == 6:
			$Label.text = "Inicialmente não deram importância para o vírus, aqueles que o negligenciaram se tornaram marionetes de sua ignorância."
			TextOn = false
		if numberText == 7:
			$Label.text = "Mantenha o distanciamento dos infectados, senão isto pode custar a sua vida."
			TextOn = false
		if numberText == 8:
			$Label.text = "Inicialmente eram só sintomas comuns, porém após algum tempo ele passou por uma grande mutação."
			TextOn = false
		if numberText == 9:
			$Label.text = "Dê o seu melhor. Dependendo de quanto tempo aguentar, talvéz eu consiga produzir a cura."
			TextOn = false
		if numberText == 10:
			$Label.text = "Colete algumas amostras se conseguir, isso pode me ajudar a progredir na cura."
			TextOn = false
	pass

func _on_Timer2_timeout():
	visible = false
	TextOn = true
	pass 
