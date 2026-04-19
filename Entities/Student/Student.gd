extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var last_dir: Vector2 = Vector2.DOWN

var speed: float = 200

@onready var student: AnimatedSprite2D = $Student

func _ready() -> void:
	_set_anim("idle_down")

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = direction * speed
	move_and_slide()
	
	if direction != Vector2.ZERO:
		last_dir = direction
		
	update_animation()
	
func update_animation() -> void:
	if direction == Vector2.ZERO:
		play_idle()
	else:
		play_walk()

func play_idle() -> void:
	if abs(last_dir.x) > abs(last_dir.y):
		_set_anim("idle_side")
		student.flip_h = (last_dir.x < 0)
	else:
		student.flip_h = false
		if last_dir.y < 0:
			_set_anim("idle_up")
		else:
			_set_anim("idle_down")

func play_walk() -> void:
	if abs(direction.x) > abs(direction.y):
		_set_anim("side")
		student.flip_h = (direction.x < 0)
	else:
		student.flip_h = false
		if direction.y < 0:
			_set_anim("walk_up")
		else:
			_set_anim("walk_down")
			
func _set_anim(anim_name: String) -> void:
	if student.animation == anim_name and student.is_playing():
		return
	student.play(anim_name)
