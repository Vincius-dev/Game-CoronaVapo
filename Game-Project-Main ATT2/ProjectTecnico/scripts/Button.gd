extends Button
var trocarTela = false
var frame = 1

func _on_Start_mouse_entered():
	$Start.modulate.r = 0.7
	$Start.modulate.g = 0.7
	$Start.modulate.b = 0.7
	pass # Replace with function body.


func _on_Start_mouse_exited():
	$Start.modulate.r = 1
	$Start.modulate.g = 1
	$Start.modulate.b = 1
	pass # Replace with function body.

func _on_Start_pressed():
	$Start.modulate.r = 0.4
	$Start.modulate.g = 0.4
	$Start.modulate.b = 0.4
	$AnimatedSprite.play("Shooting")
	$Shot.play()
	pass 

func _on_AnimatedSprite_frame_changed():
	frame += 1
	if frame == 4:
		get_tree().change_scene("res://scenes/HistoryScene.tscn")
		
	pass 
