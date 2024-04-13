extends Area2D

var speed = 750

func _process(delta):
	position += transform.x * speed * delta

func _on_bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
