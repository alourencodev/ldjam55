extends Label

@export var label = "Productivity Bucks"

func _ready():
	var points = get_node("/root/Global").productivity_bucks
	text = label + ": " + str(points)