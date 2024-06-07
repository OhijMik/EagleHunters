extends CharacterBody2D


const SPEED = 300.0
@onready var anim = get_node("AnimationPlayer")


func _ready():
	anim.play("flying")


func _physics_process(delta):
	
	move_and_slide()
