extends CharacterBody2D


const SPEED = 200.0
const ATTACK_SPEED = 300.0

@onready var anim = get_node("AnimationPlayer")
@onready var health_bar = get_node("HealthBar")
@onready var health_text = get_node("HealthText")

var follow = false
var dead = false
var player

var hp = Global.eagle_hp


func _ready():
	anim.play("flying")


func _process(delta):
	get_node("HealthText").text = str(hp)
	health_bar.size.x = 64 * (hp/Global.eagle_hp)
	
	if position.x < 0 or position.x > 1750:
		queue_free()
	
	if hp <= 0:
		death()


func _physics_process(delta):
	if follow and not dead:
		var direction = (player.position - position).normalized()
		
		velocity.x = direction.x * ATTACK_SPEED
		velocity.y = direction.y * ATTACK_SPEED
		
		if velocity.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
	elif not dead:
		velocity.x = -1 * SPEED
	
	move_and_slide()


func death():
	health_bar.hide()
	health_text.hide()
	velocity = Vector2.ZERO
	dead = true
	anim.play("death")


func _on_range_body_entered(body):
	if body.name == "Player" and not dead:
		var direction = (body.position - position).normalized()
		velocity.x = direction.x * 300
		velocity.y = direction.y * 300
		player = body
		follow = true


func _on_hitbox_body_entered(body):
	print("hi")
	if body.name == "Player" and not dead:
		queue_free()
		body.hp -= Global.eagle_damage
		


func _on_animation_player_animation_finished(anim_name):
	queue_free()
