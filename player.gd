extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var movement_direction = Input.get_vector("left", "right", "up", "down")
	velocity = movement_direction * SPEED
	
	if Input.is_action_just_pressed("shoot"):
		var mouse_pos = get_global_mouse_position()
		

	
	move_and_slide()
