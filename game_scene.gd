extends Node2D

var card = preload("res://card.tscn")
var eagle = preload("res://eagle.tscn")
var count = 0

@onready var next_card = get_node("UI/NextCard")
@onready var audio_player = get_node("AudioStreamPlayer2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position = Vector2(576, 320)
	audio_player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not Global.paused:
		if Input.is_action_just_pressed("pause"):
			pause()
		
		
		if Input.is_action_just_pressed("shoot"):
			var card_temp = card.instantiate()
			card_temp.position = $Player.position
			add_child(card_temp)
		
		var wave_text = get_node("UI/Wave")
		wave_text.text = "Wave: " + str(Global.wave)
		
		next_card.texture = load("res://images/cards/" + Global.next_card)


func pause():
	Global.paused = true
	$UI/Paused.show()
	$WaveTimer.stop()
	$EnemySpawnTimer.stop()


func resume():
	Global.paused = false
	$UI/Paused.hide()
	$WaveTimer.start()
	$EnemySpawnTimer.start()


func _on_timer_timeout():
	Global.wave += 1
	if Global.wave % 5 == 0:
		Global.eagle_hp += 2
		Global.eagle_damage += 1
	if Global.wave % 3 == 0:
		var enemy_timer = get_node("EnemySpawnTimer")
		enemy_timer.wait_time -= 0.05


func _on_enemy_spawn_timer_timeout():
	var rng = RandomNumberGenerator.new()
	var random_x = rng.randi_range(0, 1)
	
	var eagle_temp = eagle.instantiate()
	eagle_temp.name = "Eagle" + str(count)
	count += 1

	if random_x == 0:
		var random_y = rng.randi_range(200, 510)
		eagle_temp.position = Vector2(0, random_y)
		eagle_temp.velocity.x = 200
	else:
		var random_y = rng.randi_range(200, 600)
		eagle_temp.position = Vector2(1750, 420)
		eagle_temp.velocity.x = -200
		
	add_child(eagle_temp)


func _on_audio_stream_player_2d_finished():
	audio_player.play()


func _on_resume_button_pressed():
	resume()


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
