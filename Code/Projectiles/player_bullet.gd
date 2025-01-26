extends Area2D

var SPEED = 1000

func _on_ready():
	$AnimatedSprite2D.play("default")

func _process(delta):
	position += transform.x * SPEED * delta


func _on_area_entered(area):
	print("area entered")


func _on_body_entered(body):
	$AnimatedSprite2D.play("pop")
	SPEED = 0



func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "pop":
		queue_free()
