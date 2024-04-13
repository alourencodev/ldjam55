extends Area2D

@onready var anim = $AnimationPlayer
var speed = 350

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("Action"):
		$grenade.attack

func attack():
	anim.play("grenade")


func _on_body_entered(body: Node2D) -> void:
		if body.has_method("handle_hit"):
			body.handle_hit

func _process(delta):
	position += transform.x * speed * delta

func _on_bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
