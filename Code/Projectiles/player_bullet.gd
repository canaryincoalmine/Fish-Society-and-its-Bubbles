extends Area2D

var SPEED = 500

func _process(delta):
	position += transform.x * SPEED * delta
