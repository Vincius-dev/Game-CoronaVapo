extends Node
export (PackedScene) var Zumbi
var waveNumber = 1
var totalZombie = 6
var spawnedZombies = 0
var zombiesAlive = totalZombie
var attempts = 3
var speedZumbi = 50

signal pause
signal resetLifes
signal passarWave

func _physics_process(delta):
	show_remaining()
	win_game()
	pass

func _ready():
	randomize()
	wave_start()
	pass

func wave_start():
	$ZumbiTimer.start()
	$Player.position = Vector2(487.419,295.59)
	wave_attributes()
	pass

func zumbispawn():
	if spawnedZombies < totalZombie:
		$Path2D/PathFollow2D.offset = randi()
		var zumbi1 = Zumbi.instance()
		add_child(zumbi1)
		spawnedZombies += 1
		zumbi1.position = $Path2D/PathFollow2D.position
		zumbi1.connect("zumbiDeath", self, "zumbi_death")
		zumbi1.speed = speedZumbi
		
		$Path2D2/PathFollow2D2.offset = randi()
		zumbi1 = Zumbi.instance()
		add_child(zumbi1)
		spawnedZombies += 1
		zumbi1.position = $Path2D2/PathFollow2D2.position
		zumbi1.connect("zumbiDeath", self, "zumbi_death")
		zumbi1.speed = speedZumbi
	pass

func wave_attributes():
	totalZombie = totalZombie + waveNumber/2 + 1
	speedZumbi = speedZumbi + waveNumber*2
	zombiesAlive = totalZombie
	attempts = 3
	spawnedZombies = 0
	
	if waveNumber <= 5:
		$ZumbiTimer.wait_time = 13
	if waveNumber >= 5 and waveNumber <= 10:
		$ZumbiTimer.wait_time = 11
	if waveNumber >= 10 and waveNumber <= 15:
		$ZumbiTimer.wait_time = 10
	if waveNumber >= 15 and waveNumber <= 20:
		$ZumbiTimer.wait_time = 8
	pass

func zumbi_death():
	zombiesAlive -= 1
	pass

func player_death():
	$scientist_Dialogue.visible = false
	emit_signal("pause")
	get_tree().call_group("inimigos","queue_free")
	if $PauseScreen.visible == false:
		restart_wave()
	pass

func restart_wave():
	zombiesAlive = totalZombie
	$Player.vida = 4
	$Player.position = Vector2(487.419,295.59)
	$scientist_Dialogue.visible = true
	emit_signal("resetLifes")
	attempts -= 1
	spawnedZombies = 0
	pass

func game_over():
	if attempts == 0:
		emit_signal("pause")
	pass

func win_game():
	if zombiesAlive == 0:
		$Player.move_and_slide($Position2D.position - $Player.position)
		if $Player.position >= Vector2(590.906, 260.415):
			waveNumber += 1
			emit_signal("passarWave")
			queue_free()
	pass

func show_remaining():
	$HUDWave/Label.text = ("Zombies Remaining: " + String(zombiesAlive))
	$HUDWave/WaveLabel.text = ("Wave: " + String(waveNumber))
	pass
