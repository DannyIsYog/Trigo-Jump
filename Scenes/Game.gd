extends Node2D

@export var platform_scene: PackedScene

func _ready() -> void:
	randomize()
	spawn_platforms()


func spawn_platforms() -> void:
	var spawn_paths = $PlatformSpawning.get_children()
	for spawn_path in spawn_paths:
		var platform: Node2D = platform_scene.instantiate()
		var spawn_location: PathFollow2D = spawn_path.get_node("Spawn")
		spawn_location.progress_ratio = randf()
		platform.position = spawn_location.position
		$Platforms.add_child(platform)
