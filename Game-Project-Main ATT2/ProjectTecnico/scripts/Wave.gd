extends Node
export (PackedScene) var Zumbi
export (PackedScene) var zumbieboss
var waveNumber = 1
var totalZombie = 6
var spawnedZombies = 0
var zombiesAlive = totalZombie
var attempts = 3
var speedZumbi = 50
var ZumbieBossOn = false

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
	$Musica.play()
	$ZumbiTimer.start()
	$Player.position = Vector2(487.419,295.59)
	wave_attributes()
	pass

func zumbispawn():
	if spawnedZombies + 1 == totalZombie and ZumbieBossOn == true:
		$Path2D2/PathFollow2D2.offset = randi()
		var zumbieboss1 = zumbieboss.instance()
		add_child(zumbieboss1)
		spawnedZombies += 1
		zumbieboss1.position = $Path2D2/PathFollow2D2.position
		zumbieboss1.connect("zumbiDeath", self, "zumbi_death")
		zumbieboss1.speed = speedZumbi
	
	if spawnedZombies < totalZombie:
		$Path2D/PathFollow2D.offset = randi()
		var zumbi1 = Zumbi.instance()
		add_child(zumbi1)
		spawnedZombies += 1
		zumbi1.position = $Path2D/PathFollow2D.position
		zumbi1.connect("zumbiDeath", self, "zumbi_death")
		zumbi1.speed = speedZumbi
		
		if spawnedZombies + 1 == totalZombie and ZumbieBossOn == true:
			$Path2D2/PathFollow2D2.offset = randi()
			var zumbieboss1 = zumbieboss.instance()
			add_child(zumbieboss1)
			spawnedZombies += 1
			zumbieboss1.position = $Path2D2/PathFollow2D2.position
			zumbieboss1.connect("zumbiDeath", self, "zumbi_death")
			zumbieboss1.speed = speedZumbi

		if totalZombie > spawnedZombies: 
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
		$Player.gunlockSHOT = true
		$GunsBar/Shotgun_Bar1.show()
		$ZumbiTimer.wait_time = 11
	if waveNumber >= 10 and waveNumber <= 15:
		$Player.gunlockAK = true
		$Player.gunlockSHOT = true
		$GunsBar/Shotgun_Bar1.show()
		$GunsBar/AK_Bar1.show()
		$ZumbiTimer.wait_time = 10
	if waveNumber >=15 and waveNumber <= 20:
		$ZumbiTimer.wait_time = 8
		$Player.gunlockAK = true
		$Player.gunlockSHOT = true
		$GunsBar/Shotgun_Bar1.show()
		$GunsBar/AK_Bar1.show()


	if waveNumber == 5:
		ZumbieBossOn = true
	if waveNumber == 10:
		ZumbieBossOn = true
	if waveNumber == 15:
		ZumbieBossOn = true
	if waveNumber == 20:
		ZumbieBossOn = true

	if waveNumber < 5:
		ZumbieBossOn = false
	if waveNumber > 5 and  waveNumber < 10:
		ZumbieBossOn = false
	if waveNumber > 10 and  waveNumber < 15:
		ZumbieBossOn = false
	if waveNumber > 15 and  waveNumber < 20:
		ZumbieBossOn = false
	pass

func zumbi_death():
	zombiesAlive -= 1
	pass

func player_death():
	$Musica.stop()
	$scientist_Dialogue.visible = false
	emit_signal("pause")
	get_tree().call_group("inimigos","queue_free")
	if $PauseScreen.visible == false:
		restart_wave()
	pass

func restart_wave():
	zombiesAlive = totalZombie
	$Musica.play()
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
			if waveNumber == 20:
				get_tree().change_scene("res://scenes/HistoriaFimJogo.tscn")
			emit_signal("passarWave")
			queue_free()
	pass

func show_remaining():
	$HUDWave/Label.text = ("Zombies Remaining: " + String(zombiesAlive))
	$HUDWave/WaveLabel.text = ("Wave: " + String(waveNumber))
	pass
