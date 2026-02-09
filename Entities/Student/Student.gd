extends AnimatedSprite2D

var direction: Vector2 = Vector2(1,0)
var speed: int = 2

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
	position += direction * speed
	animation()
	
func animation():
	if direction:
		if direction.x < 0:
			$".".flip_h = true
		else:
			$".".flip_h = false
		
	else:
		$".".frame = 0
