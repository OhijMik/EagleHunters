extends Node2D

var card = preload("res://card.tscn")

@onready var next_card = get_node("UI/NextCard")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position = Vector2(576, 320)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		var card_temp = card.instantiate()
		card_temp.position = $Player.position
		add_child(card_temp)
	
	var wave_text = get_node("UI/Wave")
	wave_text.text = "Wave: " + str(Global.wave)
	
	next_card.texture = load("res://images/cards/" + Global.next_card)


func _on_timer_timeout():
	Global.wave += 1
