extends CanvasLayer

var buildings = {}

func _ready() -> void:
	$MapButton.pressed.connect(_on_map_button_pressed)
	$MapPanel/CloseButton.pressed.connect(_on_close_button_pressed)

	set_map_open(false)

	buildings = {
		"A": {
		"area": $MapPanel/AArea,
		"label": $MapPanel/ALabel,
		},
		"B": {
		"area": $MapPanel/BArea,
		"label": $MapPanel/BLabel,
		},
		"C": {
		"area": $MapPanel/CArea,
		"label": $MapPanel/CLabel,
		},
		"D": {
		"area": $MapPanel/DArea,
		"label": $MapPanel/DLabel,
		},
		"E": {
		"area": $MapPanel/EArea,
		"label": $MapPanel/ELabel,
		},
		"F": {
		"area": $MapPanel/FArea,
		"label": $MapPanel/FLabel,
		},
		"G": {
		"area": $MapPanel/GArea,
		"label": $MapPanel/GLabel,
		},
		"H": {
			"area": $MapPanel/HArea,
			"label": $MapPanel/HLabel,
			"scene": "res://Scenes/Exteriors/H_Exterior.tscn"
		},
		"J": {
		"area": $MapPanel/JArea,
		"label": $MapPanel/JLabel,
		},
		"L": {
			"area": $MapPanel/LArea,
			"label": $MapPanel/LLabel,
			"scene": "res://Scenes/Exteriors/L_Exterior.tscn"
		},
		"CTC": {
			"area": $MapPanel/CTCArea,
			"label": $MapPanel/CTCLabel,
		}
	}

	for building_name in buildings:
		var b = buildings[building_name]

		b.label.visible = false

		b.area.pressed.connect(_on_building_pressed.bind(building_name))
		b.area.mouse_entered.connect(_on_building_hovered.bind(building_name, true))
		b.area.mouse_exited.connect(_on_building_hovered.bind(building_name, false))


func _on_map_button_pressed() -> void:
	set_map_open(true)


func _on_close_button_pressed() -> void:
	set_map_open(false)


func set_map_open(is_open: bool) -> void:
	$MapPanel.visible = is_open
	$DarkOverlay.visible = is_open


func _on_building_pressed(building_name: String) -> void:
	SceneManager.enter_scene(buildings[building_name].scene)


func _on_building_hovered(building_name: String, is_hovering: bool) -> void:
	buildings[building_name].label.visible = is_hovering
