extends Node2D

@export var game_scene: PackedScene
@export var score_scene: PackedScene

var score = 0
var highScore = 0
var inGame = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("restart") and not inGame:
		startGame()

func endGame(score, currentScene):
	inGame = false
	print("going to score")
	self.score = score
	if score > highScore:
		highScore = score
		
	add_child(score_scene.instantiate())
	currentScene.queue_free()

func startGame():
	inGame = true
	self.get_child(0).queue_free()
	add_child(game_scene.instantiate())
