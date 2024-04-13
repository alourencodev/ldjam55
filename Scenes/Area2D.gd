extends Area2D

@onready var anim = $AnimationPlayer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("Action"):
		$weapon.attack

func attack():
	anim.play("swing")


func _on_body_entered(body: Node2D) -> void:
		if body.has_method("handle_hit"):
			body.handle_hit
