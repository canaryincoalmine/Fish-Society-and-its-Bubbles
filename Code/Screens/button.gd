extends Button


# Called when the node enters the scene tree for the first time.



func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Code/Screens/Level 1.tscn")
