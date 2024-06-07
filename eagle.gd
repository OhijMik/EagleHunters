extends CharacterBody2D


const SPEED = 200.0
const ATTACK_SPEED = 300.0
@onready var anim = get_node("AnimationPlayer")
var follow = false
var player


func _ready():
	anim.play("flying")


func _physics_process(delta):
	if follow:
		var direction = (player.position - position).normalized()
		
		velocity.x = direction.x * ATTACK_SPEED
		velocity.y = direction.y * ATTACK_SPEED
		
		if velocity.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
	else:
		velocity.x = -1 * SPEED
	
	move_and_slide()


func _on_range_body_entered(body):
	if body.name == "Player":
		var direction = (body.position - position).normalized()
		velocity.x = direction.x * 300
		velocity.y = direction.y * 300
		player = body
		follow = true


func _on_hitbox_body_entered(body):
	if body.name == "Player":
		queue_free()
		body.queue_free()
