extends Node2D
class_name Cursor

@export var bubble: Bubble
var force = 1000

var firing = false

func _exit_tree() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _ready() -> void:
	bubble.cursor = self
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func get_vector_towards_bubble() -> Vector2:
	return Vector2(bubble.global_position - global_position)

func handle_position():
	global_position = get_global_mouse_position()
	
	$Tuba.global_rotation = get_vector_towards_bubble().angle() + (-PI/2)

func handle_firing(delta: float):
	if firing:
		var v = get_vector_towards_bubble()
		var distance_factor = 1 / max(1, v.length())
		bubble.velocity += v * delta * distance_factor * force
		$Star.rotate(delta * 2 * PI * 1.5)

func _process(delta: float) -> void:
	handle_position()
	
	if Input.is_action_just_pressed("fire"):
		firing = true
	if Input.is_action_just_released("fire"):
		firing = false
		
