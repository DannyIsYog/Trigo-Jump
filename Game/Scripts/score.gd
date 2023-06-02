extends RichTextLabel

@onready var gameManager = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	print(gameManager)
	print(gameManager.score)
	print(gameManager.highScore)
	self.text = "[center] Score: " + str(gameManager.score) + " m \n Hightscore: " + str(gameManager.highScore) + " m [/center]"
	print("Score scene")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
