extends Marker2D

@export var grenade : PackedScene
@onready var _animated_sprite = $"../AnimatedSprite2D"

func _process(_delta):
	if Input.is_action_just_pressed("Action"):
		throw()
		_animated_sprite.play("attack")

func throw():
	# TODO: Implement rate of fire
	var grenade_instance = grenade.instantiate()
	add_child(grenade_instance)
	grenade_instance.global_transform = global_transform
