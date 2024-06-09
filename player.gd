extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -800.0

var gravity = 1400
var hp = 10.0

@onready var anim = get_node("AnimationPlayer")
@onready var health_bar = get_node("HealthBar")
@onready var health_text = get_node("HealthText")


func _process(delta):
	get_node("HealthText").text = str(hp)
	health_bar.size.x = 64 * (hp/10.0)
	
	if hp <= 0:
		get_tree().change_scene_to_file("res://end_menu.tscn")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var direction = Input.get_axis("left", "right")
	
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
	
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("idle")

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")
	
	if velocity.y > 0:
		anim.play("fall")

	move_and_slide()
