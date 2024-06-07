extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -800.0

var gravity = 1400

@onready var anim = get_node("AnimationPlayer")


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
	print(anim)
	move_and_slide()
