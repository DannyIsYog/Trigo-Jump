class_name PlayerData
extends Node2D

@export var life: float
@export var lifeLossPerSec: float

@onready var waterBar = $"../Camera2D/Control/waterBar"

@onready var gameManager = get_parent()

var sobreiro = false

func _process(delta):
	if life <= 0:
		gameManager.restart()
	if not sobreiro:
		life = life - lifeLossPerSec * delta
	waterBar.value = life
