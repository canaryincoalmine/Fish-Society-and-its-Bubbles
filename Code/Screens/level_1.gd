extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$MusicPlayer.play()
	$AmbiencePlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_go_to_level_2_body_entered(body):
	# Go to level 2
	if body.name == 'Player':
		get_tree().change_scene_to_file('res://Code/Screens/Level 2.tscn')
