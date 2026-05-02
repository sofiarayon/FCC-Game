extends CharacterBody2D

@onready var dialog_ui = $CanvasLayer/Dialog

var player_near := false

func _ready() -> void:
	dialog_ui.visible = false

func _process(_delta: float) -> void:
	if player_near and Input.is_action_just_pressed("interact"):
		dialog_ui.visible = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Student":
		player_near = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Student":
		player_near = false
		dialog_ui.visible = false
