extends RichTextLabel

@onready var gameManager = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "[center] Score: " + str(gameManager.score) + " m \n Highscore: " + str(gameManager.highScore) + " m \n\n\n\n Press R to restart[/center]" 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
