extends Area2D


func _on_body_entered(body):
	if not is_instance_of(body, PlayerBody):
		return
	var player_data = body.get_parent() as PlayerData
	player_data.sobreiro = true


func _on_body_exited(body):
	if not is_instance_of(body, PlayerBody):
		return
	var player_data = body.get_parent() as PlayerData
	player_data.sobreiro = false
