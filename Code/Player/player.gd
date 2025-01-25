extends CharacterBody2D


@export var SPEED = 200
@export var FRICTION = 0.04
@export var ACCELERATION = 0.05

func _physics_process(delta: float) -> void:
	
	var mouse_position = get_viewport().get_mouse_position()
	var mouse_distance = global_position.distance_to(mouse_position)
	
	if mouse_distance > 10:
			look_at(mouse_position)
	if mouse_distance > 30:
		velocity = velocity.lerp(transform.x * SPEED, ACCELERATION)
	else:
		velocity = velocity.lerp(Vector2.ZERO, FRICTION)	
	
	move_and_slide()
