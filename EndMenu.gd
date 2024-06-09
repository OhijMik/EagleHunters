extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var label = get_node("Label")
	label.text = "You survived until wave " + str(Global.wave) + "!!\n\n" + \
				 "You have killed " + str(Global.eagle_killed) + " eagles!!"


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
