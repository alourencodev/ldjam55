extends Resource
class_name SpawnGroup

# Structure that defines a group of possible spawns

@export var definitions : Array[EnemySpawnDefinition]

@export_group("Spawn Parameters")
@export var min_interval = 3.0		        # Minimum amount of seconds between spawns
@export var max_interval = 4.0		        # Maximum amount of seconds between spawns
@export var time_until_upgrade = 10.0      # Seconds until we promote to the next group

var total_weight = 0.0

func _init():
    for definition in definitions:
        total_weight += definition.weight

func pick_spawn_enemy(time_since_last_spawn):
    var factor_sum = 0.0
    var factor = randf_range(0.0, total_weight);
    for definition in definitions:
        factor_sum += definition.weight
        
        # Check if it is the picked one
        if (factor_sum >= factor):
            # If we can't spawn it due to the minimum time, just stop searching.
            # We assume that who ever is picking the enemy will keep looking
            if (time_since_last_spawn < definition.min_time_after_spawned):
                return null
            else:
                # Yay! enemy found
                return definition.enemy

    return null