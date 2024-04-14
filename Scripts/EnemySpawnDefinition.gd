extends Resource
class_name EnemySpawnDefinition

@export var enemy : Resource
@export var min_time_after_spawned = 0
@export var weight = 1.0

var time_since_last_spawn = 0.0