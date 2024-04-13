extends Area2D

@export var lifetime = 2.0

var speed : int
var direction : Vector2
var damage : int

var time_alive = 0.0

func _process(delta):
	time_alive += delta

	if (time_alive > lifetime):
		queue_free()
		return

	position += direction * speed * delta


func _on_body_entered(body: Node2D):
	if body.has_method("handle_hit"):
		body.handle_hit(damage)

	queue_free()