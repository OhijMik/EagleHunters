extends Node2D

@onready var audio_player = get_node("AudioStreamPlayer2D")

func _ready():
	audio_player.play()


func _on_start_button_pressed():
	Global.eagle_hp = 10.0
	Global.eagle_damage = 1
	Global.eagles_slain = 0
	Global.next_card = "2ofClubs.png"
	Global.wave = 1
	Global.paused = false
	get_tree().change_scene_to_file("res://game_scene.tscn")


func _on_help_button_pressed():
	get_tree().change_scene_to_file("res://help_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_audio_stream_player_2d_finished():
	audio_player.play()
