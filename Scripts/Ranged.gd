extends Marker2D

@export var bullet : PackedScene


func _process(_delta):
	if Input.is_action_just_pressed("Action"):
		shoot()

func shoot():
	# TODO: Implement rate of fire
	var bullet_instance = bullet.instantiate()
	add_child(bullet_instance)
	bullet_instance.global_transform = global_transform
