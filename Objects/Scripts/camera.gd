extends Camera2D

var player = null
@export var maxY: float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player == null:
		player = get_parent().get_node("Player")
		return
	
	var nextY = player.get_node("PlayerBody").get_global_position().y
	if nextY < maxY:
		self.position.y = nextY
		maxY = nextY
	var nextLimit = self.position.y + (get_viewport_rect().size.y / 2)
	if nextLimit < self.limit_bottom :
		self.limit_bottom = self.position.y + (get_viewport_rect().size.y / 2)
	
