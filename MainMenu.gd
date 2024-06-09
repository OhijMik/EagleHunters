extends Node2D

@onready var audio_player = get_node("AudioStreamPlayer2D")

func _ready():
	audio_player.play()


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://game_scene.tscn")


func _on_help_button_pressed():
	get_tree().change_scene_to_file("res://help_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_audio_stream_player_2d_finished():
	audio_player.play()
