extends Camera2D

var player = null
@export var maxY: float

signal restartGame

var firstTime = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player == null:
		player = get_parent().get_node("Player")
		return
	if firstTime:
		firstTimeSet()
	var nextY = player.get_node("PlayerBody").get_global_position().y
	if nextY > self.position.y + (get_viewport_rect().size.y / 2) + 200:
		print("Lose")
		restartGame.emit()
	if nextY < maxY:
		self.position.y = nextY
		maxY = nextY
	var nextLimit = self.position.y + (get_viewport_rect().size.y / 2)
	if nextLimit < self.limit_bottom :
		self.limit_bottom = self.position.y + (get_viewport_rect().size.y / 2)

func firstTimeSet():
	var nextY = player.get_node("PlayerBody").get_global_position().y
	self.position.y = nextY
	maxY = nextY
	var nextLimit = self.position.y + (get_viewport_rect().size.y / 2)
	self.limit_bottom = self.position.y + (get_viewport_rect().size.y / 2)
	firstTime = false
	
