extends CharacterBody2D


const SPEED = 1000.0

@onready var anim_player = $AnimationPlayer

var cards = ["2ofClubs.png", "3ofClubs.png", "4ofClubs.png", "5ofClubs.png", 
			 "6ofClubs.png", "7ofClubs.png", "8ofClubs.png", "9ofClubs.png",
			 "10ofClubs.png", "JofClubs.png", "QofClubs.png", "KofClubs.png",
			 "AofClubs.png",
			 "2ofHearts.png", "3ofHearts.png", "4ofHearts.png", "5ofHearts.png", 
			 "6ofHearts.png", "7ofHearts.png", "8ofHearts.png", "9ofHearts.png",
			 "10ofHearts.png", "JofHearts.png", "QofHearts.png", "KofHearts.png",
			 "AofHearts.png",
			"2ofDiamonds.png", "3ofDiamonds.png", "4ofDiamonds.png", "5ofDiamonds.png", 
			 "6ofDiamonds.png", "7ofDiamonds.png", "8ofDiamonds.png", "9ofDiamonds.png",
			 "10ofDiamonds.png", "JofDiamonds.png", "QofDiamonds.png", "KofDiamonds.png",
			 "AofDiamonds.png",
			"2ofSpades.png", "3ofSpades.png", "4ofSpades.png", "5ofSpades.png", 
			 "6ofSpades.png", "7ofSpades.png", "8ofSpades.png", "9ofSpades.png",
			 "10ofSpades.png", "JofSpades.png", "QofSpades.png", "KofSpades.png",
			 "AofSpades.png"]

var damage

func _ready():
	var rng = RandomNumberGenerator.new()
	var random_card = cards[rng.randi_range(0, 51)]

	$Sprite2D.texture = load("res://images/cards/" + Global.next_card)
	
	if "2" in Global.next_card:
		damage = 2
	elif "3" in Global.next_card:
		damage = 3
	elif "4" in Global.next_card:
		damage = 4
	elif "5" in Global.next_card:
		damage = 5
	elif "6" in Global.next_card:
		damage = 6
	elif "7" in Global.next_card:
		damage = 7
	elif "8" in Global.next_card:
		damage = 8
	elif "9" in Global.next_card:
		damage = 9
	elif "10" in Global.next_card:
		damage = 10
	elif "J" in Global.next_card:
		damage = 11
	elif "Q" in Global.next_card:
		damage = 12
	elif "K" in Global.next_card:
		damage = 13
	elif "A" in Global.next_card:
		damage = 1000
	
	Global.next_card = random_card
	
	var mouse_pos = get_global_mouse_position()
	
	var player = get_node("/root/Game_scene/Player")

	var direction = (mouse_pos - position).normalized()
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	look_at(mouse_pos)
	rotate(PI/2)
	anim_player.play("Flying")


func _process(delta):
	if position.x < 0 or position.x > 1750 or position.y < 0 or position.y > 620:
		self.queue_free()
	


func _physics_process(delta):
	move_and_slide()


func _on_area_2d_body_entered(body):
	if "Eagle" in body.name:
		body.hp -= damage
		queue_free()

