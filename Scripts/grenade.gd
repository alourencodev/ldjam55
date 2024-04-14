extends Area2D

var speed = 350
var damage = 10

@onready var anim = $AnimationPlayer

func _ready():
	anim.play("grenade")

func _on_body_entered(body: Node2D):
	if body.has_method("handle_hit"):
		body.handle_hit(damage)

func _process(delta):
	position += transform.x * speed * delta

func _on_ground_hit():
	queue_free()
