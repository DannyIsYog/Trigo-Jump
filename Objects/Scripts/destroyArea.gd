extends Area2D

signal restartGame

signal spawnPlatforms(number_of_platforms: int)

func _on_body_entered(body):
	print("deleting")
	if body.get_parent().name == "Player":
		print("restarting")
		body.get_parent().queue_free()
		restartGame.emit()
		return
	body.queue_free()
	spawnPlatforms.emit(1)
	
