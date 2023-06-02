extends Camera2D

@onready var player = $"../Player"
var maxY: float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var nextY = player.get_node("PlayerBody").get_global_position().y
	if nextY < maxY:
		self.position.y = nextY
		maxY = nextY
	var nextLimit = self.position.y + (get_viewport_rect().size.y / 2)
	if nextLimit < self.limit_bottom :
		self.limit_bottom = self.position.y + (get_viewport_rect().size.y / 2)
	
