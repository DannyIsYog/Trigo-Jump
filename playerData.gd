extends Node2D

@export var life: float
@export var lifeLossPerSec: float

#@onready var waterBar = get_tree().get_root().find_node("waterBar")

func _process(delta):
	life = life - lifeLossPerSec * delta
	print(life)
	#waterBar.value = life
	
