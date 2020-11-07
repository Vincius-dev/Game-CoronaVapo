extends Node2D

var ncoracao = 4

func _on_Player_life_change():
	ncoracao -= 1
	
	if ncoracao == 3:
		$"VidaInicial".hide()
	if ncoracao == 2:
		$"Vida75".hide()
	if ncoracao == 1:
		$"VidaMeio".hide()
	if ncoracao == 0:
		$"VidaFinal".hide()

func _on_Wave_resetLifes():
	ncoracao = 4
	if ncoracao == 4:
		$Vida75.show()
		$VidaFinal.show()
		$VidaInicial.show()
		$VidaMeio.show()
	pass # Replace with function body.
