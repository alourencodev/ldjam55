extends Marker2D

@export var grenade : PackedScene
@export var damage = 10
@export var fire_rate = 0.0

@onready var _animated_sprite = $"../AnimatedSprite2D"


var time_until_last_fire = fire_rate

func _process(delta):
	if (time_until_last_fire < fire_rate):
		time_until_last_fire += delta
		return

	if Input.is_action_just_pressed("Action"):
		throw()
		_animated_sprite.play("attack")

func throw():
	# TODO: Implement rate of fire
	var grenade_instance = grenade.instantiate()
	var manager = get_node("/root/Global/ProjectileManager")
	grenade_instance.global_transform = global_transform
	grenade_instance.damage = damage
	manager.shoot(grenade_instance)
