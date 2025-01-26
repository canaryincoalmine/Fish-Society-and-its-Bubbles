extends Button

func _on_replay_pressed() -> void:
	get_tree().change_scene_to_file("res://Code/Screens/Level 1.tscn")
