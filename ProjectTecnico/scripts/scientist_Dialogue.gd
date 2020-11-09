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
			$Label.text = "teste 1"
			TextOn = false
		if numberText == 2:
			$Label.text = "teste 2"
			TextOn = false
		if numberText == 3:
			$Label.text = "teste 3"
			TextOn = false
		if numberText == 4:
			$Label.text = "teste 4"
			TextOn = false
		if numberText == 5:
			$Label.text = "teste 5"
			TextOn = false
		if numberText == 6:
			$Label.text = "teste 6"
			TextOn = false
		if numberText == 7:
			$Label.text = "teste 7"
			TextOn = false
		if numberText == 8:
			$Label.text = "teste 8"
			TextOn = false
		if numberText == 9:
			$Label.text = "teste 9"
			TextOn = false
		if numberText == 10:
			$Label.text = "teste 10"
			TextOn = false
	pass



func _on_Timer2_timeout():
	visible = false
	TextOn = true
	pass 
