extends Node


@export var attack_distance = 20.0
@export var attack_rate = 2.0


signal attack()


var last_attack = attack_rate
@onready var attack_distance_sqr = pow(attack_distance, 2)

func _physics_process(delta):
	var target = get_node("/root/Global").player
	if (target == null):
		return;

	if (last_attack >= attack_rate):
		var distance_to_target = (target.global_position - owner.global_position).length_squared()
		if (distance_to_target <= attack_distance_sqr):
			last_attack = 0.0
			attack.emit()
	else:
		last_attack += delta
	
