extends Node2D

var ncoracao = 4

func _process(delta):
	if ncoracao == 3:
		$"VidaInicial".hide()
	if ncoracao == 2:
		$"Vida75".hide()
		$"VidaInicial".hide()
	if ncoracao == 1:
		$"VidaMeio".hide()
		$"Vida75".hide()
		$"VidaInicial".hide()
	if ncoracao == 0:
		$"VidaFinal".hide()
		$"VidaMeio".hide()
		$"Vida75".hide()
		$"VidaInicial".hide()
	pass

func _on_Player_life_change():
	ncoracao -= 1
	pass

func player_life_change_boss():
	ncoracao -= 2 
	pass

func _on_Wave_resetLifes():
	ncoracao = 4
	if ncoracao == 4:
		$Vida75.show()
		$VidaFinal.show()
		$VidaInicial.show()
		$VidaMeio.show()
	pass 
