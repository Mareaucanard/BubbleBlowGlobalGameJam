extends CharacterBody2D
class_name Bubble

signal on_defeat
signal on_victory

var cursor: Cursor
var locked = false
var linear_damping = 0.75
var start_pose: Vector2
var ask_for_velocity_reset = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_pose = position

func defeat():
	locked = true
	visible = false
	on_defeat.emit()
	velocity = Vector2(0,0)
	
func victory():
	locked = true
	visible = false
	on_victory.emit()
	velocity = Vector2(0,0)

func reset():
	locked = false
	visible = true
	position = start_pose
	ask_for_velocity_reset = true

func _physics_process(delta: float) -> void:
	if locked:
		return

	if ask_for_velocity_reset:
		velocity = Vector2(0,0)
		ask_for_velocity_reset = false

	cursor.handle_firing(delta)
	cursor.queue_redraw()
	velocity *= 1.0 - delta * linear_damping
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.get_collider() is Goal:
			victory()
		else:
			defeat()
		
	
