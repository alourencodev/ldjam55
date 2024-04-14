extends TextureButton

class_name SceneChanger

@export var scene_name = ""

func _pressed():
	var path = "res://Screens/" + scene_name
	get_tree().change_scene_to_file(path)

func _enable(_selection):
	disabled = false
