extends Node
export (PackedScene) var Zumbi

func _ready():
	randomize()
	pass

func zumbispawn():
	$Path2D/PathFollow2D.offset = randi()
	var zumbi1 = Zumbi.instance()
	add_child(zumbi1)
	zumbi1.position = $Path2D/PathFollow2D.position
	
	$Path2D2/PathFollow2D2.offset = randi()
	zumbi1 = Zumbi.instance()
	add_child(zumbi1)
	zumbi1.position = $Path2D2/PathFollow2D2.position
	pass
