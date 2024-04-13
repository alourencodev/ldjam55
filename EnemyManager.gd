extends Node

class_name EnemyManager;

@export var enemy_scene : Resource			        # TODO: Make this an array of scenes. We might need a way to define which enemies are more likely than others
@export var spawn_points : Array[Node2D]			    # We'll take the position of these nodes to spawn the enemies akt
@export var warmup_seconds = 5.0					# Seconds to start spawning
@export var spawn_min_interval = 3.0		        # Minimum amount of seconds between spawns
@export var spawn_max_interval = 4.0		        # Maximum amount of seconds between spawns

# TODO: Difficulty progression

@onready var time_to_spawn = warmup_seconds

func _ready():
	assert(spawn_points.size() > 0)
	assert(enemy_scene != null)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_to_spawn -= delta

	if time_to_spawn <= 0.0:
		time_to_spawn = randf_range(spawn_min_interval, spawn_max_interval)
		spawn_enemy();

	pass


func spawn_enemy():
	# TODO: Pick an enemy depending on the game stage

	var spawn_point_index = randi() % spawn_points.size()
	var spawn_point = spawn_points[spawn_point_index]

	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.position = spawn_point.position
	#TODO: Connect stuff to the enemy

	add_child(enemy_instance)
