extends CanvasLayer

@onready var map_panel: Panel = $MapPanel

func _ready() -> void:
	map_panel.visible = false

func _on_map_button_pressed() -> void:
	map_panel.visible = true

func _on_close_button_pressed() -> void:
	map_panel.visible = false

func _on_l_button_pressed() -> void:
	SceneManager.enter_scene("res://Scenes/Interiors/L_Interior.tscn")

func _on_h_button_pressed() -> void:
	SceneManager.enter_scene("res://Scenes/Exteriors/H_Exterior.tscn")
