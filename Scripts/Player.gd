extends CharacterBody2D

@export var end_screen : PackedScene
@export var speed = 500
@export var friction = 0.1
@export var acceleration = 0.1
@export var health = 100


signal on_death(position : Vector2)
signal on_attack()


func get_input():
	var input = Vector2()
	if Input.is_action_pressed('right'):
		input.x += 1
	if Input.is_action_pressed('left'):
		input.x -= 1
	if Input.is_action_pressed('down'):
		input.y += 1
	if Input.is_action_pressed('up'):
		input.y -= 1

	return input

func _process(delta):
	var direction = (get_global_mouse_position() - global_position)
	if (direction.x < 0):
		scale = Vector2(-1.0, 1.0)
	if (direction.x > 0):
		scale = Vector2(1.0, 1.0)

	rotation = 0.0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("Action"):
		on_attack.emit()

func _physics_process(_delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)

	move_and_slide()

func handle_hit(damage_amount):
	call_deferred("apply_damage", damage_amount)

func apply_damage(amount):
	health -= amount
	print("Player has ", health, " HP")
	if (health <= 0):
		on_death.emit(global_position)
		queue_free()
		get_tree().change_scene_to_packed(end_screen)
