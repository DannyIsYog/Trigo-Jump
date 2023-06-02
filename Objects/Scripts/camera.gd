extends Camera2D

var player = null
@export var maxY: float

var startingY: float
@onready var text = $Control/ScoreText

signal restartGame
signal spawnPlatforms(number_of_platforms: int, spawn_player: bool)
signal updateScore(score: int)

var firstTime = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player == null:
		player = get_parent().get_node("Player")
		return
	if firstTime:
		firstTimeSet()
	if player.get_node("PlayerBody") == null:
		return
	var nextY = player.get_node("PlayerBody").get_global_position().y
	if nextY < maxY:
		self.position.y = nextY
		maxY = nextY
	var nextLimit = self.position.y + (get_viewport_rect().size.y / 2)
	if nextLimit < self.limit_bottom :
		self.limit_bottom = self.position.y + (get_viewport_rect().size.y / 2)
	text.text = str(int((startingY - maxY)/50))

func firstTimeSet():
	var nextY = player.get_node("PlayerBody").get_global_position().y
	self.position.y = nextY
	maxY = nextY
	var nextLimit = self.position.y + (get_viewport_rect().size.y / 2)
	self.limit_bottom = self.position.y + (get_viewport_rect().size.y / 2)
	startingY = nextY
	firstTime = false

func restartGameFunc():
	restartGame.emit()


func _on_area_2d_spawn_platforms(number_of_platforms):
	spawnPlatforms.emit(1, false)
