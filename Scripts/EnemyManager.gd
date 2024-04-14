extends Node

class_name EnemyManager;

@export var spawn_points : Array[Marker2D]
@export var groups : Array[SpawnGroup]		
@export var warmup_seconds = 5.0					# Seconds to start spawning

@onready var current_group_index = 0
@onready var time_to_spawn = warmup_seconds
@onready var time_since_group_upgrade = -warmup_seconds

var current_group : SpawnGroup


func _ready():
	assert(spawn_points.size() > 0, "Please define spawn points in EnemyManager")
	assert(!groups.is_empty(), "Please define spawn groups in EnemyManager")

	current_group = groups[0]


func _process(delta):
	if get_player() == null:
		return

	# Update timers
	time_since_group_upgrade += delta

	# Check for spawn
	if time_to_spawn <= 0.0:
		time_to_spawn = calc_time_to_spawn()
		spawn_enemy();
	else:
		time_to_spawn -= delta

	# Check for group Updates
	if (time_since_group_upgrade >= current_group.time_until_upgrade):
		if groups.size() > (current_group_index + 1):
			current_group_index += 1
			current_group = groups[current_group_index]
			time_since_group_upgrade = 0.0
			print("Upgrading Spawn group to ", current_group_index, " ", current_group.resource_path)


func spawn_enemy():
	var enemy = current_group.pick_spawn_enemy()
	if (enemy == null):
		return

	# Pick spawn point
	var spawn_point_index = randi() % spawn_points.size()
	var spawn_point = spawn_points[spawn_point_index]

	# Pick enemy
	var enemy_instance = enemy.instantiate()
	enemy_instance.position = spawn_point.position
	add_child(enemy_instance)


func get_player():
	return get_node("/root/Global").player


func calc_time_to_spawn():
	return randf_range(current_group.min_interval, current_group.max_interval)
