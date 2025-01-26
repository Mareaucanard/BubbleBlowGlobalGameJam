extends Control

var help_state = false
var delta_sum = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_exit_help_text_pressed()


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/level1.tscn")

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/level2.tscn")

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/level3.tscn")

func _on_help_pressed() -> void:
	help_state = true
	$BaseMenu.visible = false
	$"Help UI".visible = true


func _on_exit_help_text_pressed() -> void:
	help_state = false
	$BaseMenu.visible = true
	$"Help UI".visible = false


func _on_exit_pressed() -> void:
	get_tree().quit()



	
