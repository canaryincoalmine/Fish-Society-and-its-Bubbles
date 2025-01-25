extends Area2D

var SPEED = 1000

func _process(delta):
	position += transform.x * SPEED * delta
