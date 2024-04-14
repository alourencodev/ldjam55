extends Resource
class_name SpawnGroup

# Structure that defines a group of possible spawns

@export var definitions : Array[EnemySpawnDefinition]

@export_group("Spawn Parameters")
@export var min_interval = 3.0		        # Minimum amount of seconds between spawns
@export var max_interval = 4.0		        # Maximum amount of seconds between spawns
@export var time_until_upgrade = 10.0      # Seconds until we promote to the next group


func pick_spawn_enemy():
    var total_weight = 0.0
    for definition in definitions:
        total_weight += definition.weight

    var factor_sum = 0.0
    var factor = randf_range(0.0, total_weight);
    for definition in definitions:
        factor_sum += definition.weight
        
        # Check if it is the picked one
        if (factor_sum >= factor):
            # If we can't spawn it due to the minimum time, just stop searching.
            # We assume that who ever is picking the enemy will keep looking
            var now : float = Time.get_ticks_msec() * 0.001
            var time_since_last_spawn = now - definition.last_spawn_timestamp
            if (time_since_last_spawn < definition.min_time_after_spawned):
                print("Skiped Enemy: ", definition.enemy.resource_path)
                return null
            else:
                print("Picked Enemy: ", definition.enemy.resource_path)
                print("   Total weight: ", total_weight)
                print("   Weight: ", definition.weight)
                print("   Factor: ", factor)
                print("   Last Spawn Timestamp: ", definition.last_spawn_timestamp)
                print("   Now: ", now)

                definition.last_spawn_timestamp = now
                return definition.enemy

    return null