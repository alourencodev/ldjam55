extends Area2D

@export var damage = 10
@export var attack_cooldown = 1.0

@onready var anim = $AnimationPlayer


var time_since_last_attack = attack_cooldown

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("Action"):
		attack()

func attack():
	if (time_since_last_attack >= attack_cooldown):
		anim.play("swing")
		time_since_last_attack = 0.0


func _process(delta):
	if (time_since_last_attack < attack_cooldown):
		time_since_last_attack += delta


func _on_body_entered(body: Node2D):
		if body.has_method("handle_hit"):
			body.handle_hit(damage)
