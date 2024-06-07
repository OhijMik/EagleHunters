extends CharacterBody2D


const SPEED = 300.0

var cards = ["2ofClubs.png", "3ofClubs.png", "4ofClubs.png", "5ofClubs.png", 
			 "6ofClubs.png", "7ofClubs.png", "8ofClubs.png", "9ofClubs.png",
			 "10ofClubs.png", "JofClubs.png", "QofClubs.png", "KofClubs.png",
			 "AofClubs.png",
			 "2ofHeart.png", "3ofHeart.png", "4ofHeart.png", "5ofHeart.png", 
			 "6ofHeart.png", "7ofHeart.png", "8ofHeart.png", "9ofHeart.png",
			 "10ofHeart.png", "JofHeart.png", "QofHeart.png", "KofHeart.png",
			 "AofHeart.png",
			"2ofDiamonds.png", "3ofDiamonds.png", "4ofDiamonds.png", "5ofDiamonds.png", 
			 "6ofDiamonds.png", "7ofDiamonds.png", "8ofDiamonds.png", "9ofDiamonds.png",
			 "10ofDiamonds.png", "JofDiamonds.png", "QofDiamonds.png", "KofDiamonds.png",
			 "AofDiamonds.png",
			"2ofSpades.png", "3ofSpades.png", "4ofSpades.png", "5ofSpades.png", 
			 "6ofSpades.png", "7ofSpades.png", "8ofSpades.png", "9ofSpades.png",
			 "10ofSpades.png", "JofSpades.png", "QofSpades.png", "KofSpades.png",
			 "AofSpades.png"]

func _ready():
	var rng = RandomNumberGenerator.new()
	var random_card = rng.randi_range(0, 52)
	
	$Sprite2D.texture = load("res://images/cards/3ofClubs.png")


func _physics_process(delta):
	# velocity = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
