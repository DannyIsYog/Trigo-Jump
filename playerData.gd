extends Node2D

@export var life: float
@export var lifeLossPerSec: float

@onready var waterBar = $"../Camera2D/waterBar"

func _process(delta):
	life = life - lifeLossPerSec * delta
	waterBar.value = life
