extends Node2D

@export var platform_scene: PackedScene
@export var player_scene: PackedScene

@onready var platforms = $Platforms
@onready var platform_spawn = $PlatformPath/Spawn
@onready var platform_initial_y = $PlatformPath.position.y

func _ready() -> void:
	randomize()
	spawn_platforms(10, true)


func spawn_platforms(amount: int, spawn_player: bool = false) -> void:
	for i in range(amount):
		platform_initial_y -= randi_range(200, 328)
		var platform = platform_scene.instantiate() as Node2D
		
		platform_spawn.progress_ratio = randf()
		platform.position = platform_spawn.position
		platform.position.y = platform_initial_y
		
		platforms.add_child(platform)
		
		if spawn_player and i == 0:
			var player = player_scene.instantiate() as Node2D
			player.position.x = platform.position.x + 64
			player.position.y = platform_initial_y - 64
			add_child(player)
