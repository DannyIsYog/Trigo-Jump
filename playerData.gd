class_name PlayerData
extends Node2D

@export var life: float
@export var lifeLossPerSec: float

@onready var waterBar = $"../Camera2D/Control/waterBar"

@onready var gameManager = get_parent()

var sobreiro = false
var drunk_for = 0.0


func _process(delta):
	if life <= 0:
		gameManager.restart()
	if not sobreiro:
		life = life - lifeLossPerSec * delta
	waterBar.value = life
	
	if is_drunk():
		drunk_for -= delta
		drunk_for = max(0, drunk_for)


func is_drunk():
	return drunk_for > 0.0
