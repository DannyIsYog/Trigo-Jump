extends Node2D

@export var platform_scene: PackedScene
@export var player_scene: PackedScene
@export var water_scene: PackedScene
@export var sobreiro_scene: PackedScene
@export var wine_scene: PackedScene

@export var spawn_water_prob = 0.45

@onready var platforms = $Platforms
@onready var platform_spawn = $PlatformPath/Spawn
@onready var platform_initial_y = $PlatformPath.position.y
var last_platform_x = 0

func _ready() -> void:
	randomize()
	spawn_platforms(20, true)


func spawn_platforms(amount: int, spawn_player: bool = false) -> void:
	for i in range(amount):
		platform_initial_y -= randi_range(270, 360)
		var platform = platform_scene.instantiate() as Node2D
		
		platform_spawn.progress_ratio = randf()
		var first_platform = i == 0 and spawn_player
		while not first_platform and abs(platform_spawn.position.x - last_platform_x) <= 200:
			platform_spawn.progress_ratio = randf()
		
		platform.position = platform_spawn.position
		platform.position.y = platform_initial_y
		last_platform_x = platform.position.x
		
		platforms.add_child(platform)
		
		if spawn_player and i == 0:
			var player = player_scene.instantiate() as Node2D
			player.position.x = platform.position.x + 64
			player.position.y = platform_initial_y - 64
			add_child(player)
		elif randf() <= spawn_water_prob:
			var water = water_scene.instantiate() as Node2D
			water.position.x = platform.position.x + 64
			water.position.y = platform_initial_y - 64
			add_child(water)
		elif randf() <= 0.4:
			var sobreiro = sobreiro_scene.instantiate() as Node2D
			sobreiro.position.x = platform.position.x + 64
			sobreiro.position.y = platform_initial_y - 64
			add_child(sobreiro)
		elif randf() <= 0.4:
			var wine = wine_scene.instantiate() as Node2D
			wine.position.x = platform.position.x + 64
			wine.position.y = platform_initial_y - 64
			add_child(wine)

func restart():
	get_tree().reload_current_scene()
	
