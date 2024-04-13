extends CharacterBody2D

@export var speed = 500
@export var friction = 0.1
@export var acceleration = 0.1
@export var health = 100


signal on_death(position : Vector2)


func get_input():
	var input = Vector2()
	if Input.is_action_pressed('right'):
		scale = Vector2(1.0, 1.0)
		rotation = 0.0
		input.x += 1
	if Input.is_action_pressed('left'):
		scale = Vector2(-1.0, 1.0)
		rotation = 0.0
		input.x -= 1
	if Input.is_action_pressed('down'):
		input.y += 1
	if Input.is_action_pressed('up'):
		input.y -= 1

	return input

func _physics_process(_delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)

	move_and_slide()

func handle_hit(damage_amount):
	apply_damage(damage_amount)

func apply_damage(amount):
	health -= amount
	print("Player has ", health, " HP")
	if (health <= 0):
		on_death.emit(global_position)
		queue_free()
