extends Marker2D

@export var grenade : PackedScene


func _process(_delta):
	if Input.is_action_just_pressed("Action"):
		throw()

func throw():
	# TODO: Implement rate of fire
	var grenade_instance = grenade.instantiate()
	add_child(grenade_instance)
	grenade_instance.global_transform = global_transform
