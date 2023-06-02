extends Area2D


func _on_body_entered(body):
	if not is_instance_of(body, PlayerBody):
		return
	var player_data = body.get_parent() as PlayerData
	player_data.life = min(100, player_data.life + 16)
	player_data.drunk_for = 5.0
	body.WineSound.play()
	queue_free()
