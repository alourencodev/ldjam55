extends RayCast2D

@onready var ray = $"."
@onready var fire = $fire

func _process(delta: float) -> void:
	if Input.is_action_pressed("Action"):
		fire.emitting = true
		ray.global_position = fire.global_position
		var direction = (get_global_mouse_position()-fire.global_position).normalized()
		
		var material = fire.process_material
		material.direction = Vector3(direction.x,direction.y, 0.0)
		ray.target_position = direction*1000	
		ray.force_raycast_update()
	else:
		fire.emitting = false
