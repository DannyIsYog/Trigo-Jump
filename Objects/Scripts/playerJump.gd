class_name PlayerBody
extends CharacterBody2D

@export var speed: int
@export var jump_speed: int
@export var gravity: int
@export var direction: int
@onready var Sprite : Sprite2D = $Sprite2D
@onready var animationTree : AnimationTree = $AnimationTree
@onready var jumpSound = $AudioStreamPlayer2D


func is_drunk() -> bool:
	return get_parent().is_drunk()


func _physics_process(delta):
	# Add gravity every frame
	# velocity.y += gravity * delta
	direction = Input.get_axis("left", "right")
	# Input affects x axis only
	velocity.x = Input.get_axis("left", "right") * speed
	
	move_and_slide()
	update_animation()
	update_facing_direction()

	# Only allow jumping when on the ground
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
		jumpSound.play()
	
func _ready():
	animationTree.active = true
	
func update_facing_direction():
	if direction > 0:
		Sprite.flip_h = false
	if direction < 0:
		Sprite.flip_h = true
		
func update_animation():
	animationTree.set("parameters/Move/blend_position", direction)
