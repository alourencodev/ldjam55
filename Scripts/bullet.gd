extends Area2D

var speed : int
var direction : Vector2
var damage : int


func _process(delta):
	position += direction * speed * delta

func _on_bullet_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit(damage)
