extends CharacterBody2D

@export var speed: int
@export var jump_speed: int
@export var gravity: int
@export var direction: int
@onready var animationtree : AnimationTree = $"../AnimationTree"

func _physics_process(delta):
	# Add gravity every frame
	velocity.y += gravity * delta
	direction = Input.get_axis("left", "right")
	# Input affects x axis only
	velocity.x = Input.get_axis("left", "right") * speed
	
	move_and_slide()

	# Only allow jumping when on the ground
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
	
func _ready():
	animationtree.active = true
	
func update_animation():
	animationtree.set("parameters/Move/blend_position", direction)
