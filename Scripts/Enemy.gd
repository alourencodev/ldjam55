extends Node2D


class_name Enemy;


@export var speed = 30

var target : Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# An enemy needs to have a target
	assert(target != null)

	var direction = (target.position - position).normalized()
	position += direction * speed * delta

	pass
