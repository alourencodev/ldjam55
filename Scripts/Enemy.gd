extends Node2D


class_name Enemy;


@export var speed = 200
@export var health = 20
@export var score = 1

signal on_death(position : Vector2, score : int)

var target : Node2D


func _process(delta):
	if (target == null):
		pass

	const target_distance_threshold = 80.0

var direction = (target.global_position - global_position)
	var distance_to_target_sqr = direction.length_squared()
	if (distance_to_target_sqr <= target_distance_threshold):
		return

	direction = direction.normalized()
	position += direction * speed * delta

	if (direction.x < 0):
		scale = Vector2(-1.0, 1.0)
	else:
		scale = Vector2(1.0, 1.0)

func apply_damage(amount):
	health -= amount
	if (health <= 0):
		on_death.emit(global_position, score)
		get_node("/root/Global").add_productivity_bucks(score);
		queue_free()

func handle_hit(damage_amount):
	apply_damage(damage_amount)
