extends PathFollow2D

@export var sec_to_traverse: float = 10
var base_progress_ratio: float

func _ready() -> void:
	base_progress_ratio = progress_ratio

func reset():
	progress_ratio = base_progress_ratio

func _process(delta: float) -> void:
	progress_ratio += delta * (1.0 / sec_to_traverse) / 2
	
