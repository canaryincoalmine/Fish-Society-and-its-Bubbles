extends Button

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Code/Screens/Level 1.tscn")

func _on_replay_pressed() -> void:
	get_tree().change_scene_to_file("res://Code/Screens/Level 1.tscn")
	
	
