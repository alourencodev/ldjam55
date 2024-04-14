extends TextureButton

class_name SceneChanger

@export var scene : Resource

func _pressed():
	get_tree().change_scene_to_packed(scene)

func _enable(_selection):
	disabled = false
