extends Resource
class_name EnemySpawnDefinition

@export var enemy : Resource
@export var min_time_after_spawned = 0
@export var weight = 1.0

var last_spawn_timestamp = 0.0