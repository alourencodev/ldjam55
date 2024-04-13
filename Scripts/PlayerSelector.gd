extends Node

class_name PlayerSelector;

@export var DefaultPlayer : PackedScene
@export var HR_Players : Array[PackedScene]
@export var Manager_Players : Array[PackedScene]
@export var Executive_Players : Array[PackedScene]
@export var Player_Spawn_Point : Marker2D


func _ready():
	assert(Player_Spawn_Point != null)
	assert(!HR_Players.is_empty())
	assert(!Manager_Players.is_empty())
	assert(!Executive_Players.is_empty())

	var globals = get_node("/root/Global")
	var summoned_tier = globals.summoned_tier;
	var player_instance

	if (summoned_tier >= 0):
		var players : Array[PackedScene]
		match summoned_tier:
			0:	# Executive
				players = Executive_Players
				print("Spawning Executive")
			1:	# Manager
				players = Manager_Players
				print("Spawning Manager")
			2:	# HR
				players = HR_Players
				print("Spawning HR")

		var selected_index = randi() % players.size()
		var selected_player_scene = players[selected_index]
		player_instance = selected_player_scene.instantiate();
		print("Picked index ", selected_index)

	else:
		player_instance = DefaultPlayer.instantiate();
		print("Picked default player")

	player_instance.position = Player_Spawn_Point.position;
	add_child(player_instance)


	pass # Replace with function body.

