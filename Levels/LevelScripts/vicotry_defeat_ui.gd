extends CanvasLayer



func _ready() -> void:
	visible = true
	reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		reset()
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://menu.tscn")
	$Vicotry.position = $"../Camera2D".get_screen_center_position() - $"../Camera2D".get_viewport_rect().size / 2  
	$Defeat.position = $"../Camera2D".get_screen_center_position() - $"../Camera2D".get_viewport_rect().size / 2  

func reset() -> void:
	$Vicotry.visible = false
	$Defeat.visible = false
	get_tree().call_group("Walls", "reset")
	get_tree().call_group("Bubble", "reset")

func victory() -> void:
	$Vicotry.visible = true
	$Vicotry/Info.text = "Congrats!\nPress r to reset the level.\nPress escape to return to the level select."

func defeat() -> void:
	$Defeat.visible = true
	$Defeat/Info.text = "Press r to reset the level.\nPress escape to return to the level select."
	
	
