extends CanvasLayer

@onready var map_panel: Panel = $MapPanel
@onready var dark_overlay = $DarkOverlay

func _ready() -> void:
	map_panel.visible = false
	dark_overlay.visible = false
	$MapPanel/HLabel.visible = false
	

func _on_map_button_pressed() -> void:
	dark_overlay.visible = true
	map_panel.visible = true

func _on_close_button_pressed() -> void:
	map_panel.visible = false
	dark_overlay.visible = false

func _on_l_button_pressed() -> void:
	SceneManager.enter_scene("res://Scenes/Interiors/L_Interior.tscn")

func _on_h_area_pressed() -> void:
	SceneManager.enter_scene("res://Scenes/Exteriors/H_Exterior.tscn")

func _on_h_area_mouse_entered() -> void:
	$MapPanel/HLabel.visible = true

func _on_h_area_mouse_exited() -> void:
	$MapPanel/HLabel.visible = false
