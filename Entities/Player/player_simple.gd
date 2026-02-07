extends Sprite2D

var direction: Vector2 = Vector2(1,0)
var speed: int = 1

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
	position += direction * speed
	
