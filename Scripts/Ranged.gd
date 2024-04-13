extends Marker2D

@export var bullet : PackedScene
@export var bullet_speed = 750
@export var fire_rate = 0.0
@export var damage = 10

var time_until_last_fire = fire_rate

func _process(delta):
	if (time_until_last_fire < fire_rate):
		time_until_last_fire += delta
		return

	if Input.is_action_just_pressed("Action"):
		shoot()
		time_until_last_fire = 0.0

func shoot():
	var direction = (get_global_mouse_position() - global_position).normalized()
	var bullet_instance = bullet.instantiate()
	bullet_instance.global_position = global_position
	bullet_instance.direction = direction
	bullet_instance.rotation = direction.angle()
	bullet_instance.speed = bullet_speed
	bullet_instance.damage = damage

	var manager = get_node("/root/Global/ProjectileManager")
	manager.shoot(bullet_instance)
