extends AnimatedSprite2D

@export var animation_label = ""

func _ready():
	play(animation_label)
