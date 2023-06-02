class_name PlayerData
extends Node2D

@export var life: float
@export var lifeLossPerSec: float

@onready var waterBar = $"../Camera2D/waterBar"

var sobreiro = false

func _process(delta):
	if not sobreiro:
		life = life - lifeLossPerSec * delta
	waterBar.value = life
