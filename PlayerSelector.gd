extends Node

class_name PlayerSelector;

@export var HR_Players : Array[Resource]
@export var Manager_Players : Array[Resource]
@export var Executive_Players : Array[Resource]
@export var Player_Spawn_Point : Node2D


func _ready():
	assert(Player_Spawn_Point != null)
	assert(!HR_Players.is_empty())
	assert(!Manager_Players.is_empty())
	assert(!Executive_Players.is_empty())

	var globals = get_node("/root/Global")
	var summoned_tier = globals.summoned_tier;
	assert(summoned_tier >= 0)

	var players : Array[Resource]
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
	var player_instance = selected_player_scene.instantiate();
	player_instance.position = Player_Spawn_Point.position;
	add_child(player_instance)

	print("picked index ", selected_index)

	pass # Replace with function body.

