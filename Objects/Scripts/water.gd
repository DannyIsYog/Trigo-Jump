extends Area2D


func _on_body_entered(body):
	if not is_instance_of(body, PlayerBody):
		return
	var player_data = body.get_parent() as PlayerData
	player_data.life = min(100, player_data.life + 8)
	body.drinkingSound.pitch_scale = randf_range(0.5, 1.5)
	body.drinkingSound.play()
	queue_free()
