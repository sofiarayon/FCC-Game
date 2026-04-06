extends Node


# Called when the node enters the scene tree for the first time.
func enter_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
