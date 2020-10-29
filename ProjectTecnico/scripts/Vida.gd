extends Node2D
var dano = 1
var full = 4

func _ready():
	set_process(true)
	
func _process(delta):
	var vida = full - dano 
	var barra = (vida * 125/full) * 2.55
	
	if dano >= full:
		dano = full
	if dano <= 0:
		dano = 0
		
	get_node("FullLife").set_region_rect(Rect2(0,0,barra,32))
