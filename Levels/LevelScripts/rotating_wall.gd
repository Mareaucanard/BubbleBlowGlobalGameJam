extends StaticBody2D

@export var seconds_per_turn = 1
var base_rotation

func _ready() -> void:
	base_rotation = rotation

func reset():
	rotation = base_rotation

func _process(delta: float) -> void:
	rotate(2 * PI * delta * (1.0 / seconds_per_turn))
