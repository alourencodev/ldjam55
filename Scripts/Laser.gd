extends Line2D

@onready var ray = $"../RayCast2D"
@onready var line = $"."
var max_bounces = 5

func _process(delta: float) -> void:
	line.clear_points()
	
	if Input.is_action_just_pressed("Action"):
		line.add_point(Vector2.ZERO)
		
		ray.global_position = line.global_position
		ray.target_position = (get_global_mouse_position()-line.global_position).normalized()*1000	
		ray.force_raycast_update()
		
		var prev = null
		var bounces = 0
		
		while true:
			if not ray.is_colliding():
				var pt = ray.global_position + ray.target_position
				line.add_point(line.to_local(pt))
				
			
			var coll = ray.get_collider()
			var pt = ray.get_collision_point()
			
			line.add_point(line.to_local(pt))
			
			
			
			var normal = ray.get_collision_normal()
			
			if normal == Vector2.ZERO:
				break	
			
			if prev != null:
				prev.collision_mask = 3
				prev.collision_layer = 3
			prev = coll
			prev.collision_mask = 0
			prev.collision_layer = 0
			
			ray.global_position = pt
			ray.cast_to = ray.cast_to.bounce(normal)
			ray.force_raycast_update()
			
			bounces += 1
			if bounces >= max_bounces:
				break
			
			if prev != null:
				prev.collision_mask = 3
				prev.collision_layer = 3
