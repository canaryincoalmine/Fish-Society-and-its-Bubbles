extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$MusicPlayer.play()
	$AmbiencePlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_go_to_next_level_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		get_tree().change_scene_to_file('res://Code/Screens/Level 2.tscn')


func _on_win_condition_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		get_tree().change_scene_to_file("res://Code/Screens/EndScreen.tscn")
