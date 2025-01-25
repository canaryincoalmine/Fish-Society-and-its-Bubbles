extends CharacterBody2D


@export var SPEED = 200
@export var FRICTION = 0.04
@export var ACCELERATION = 0.05
#@export var ROTATION_SPEED = 4

func get_input():
	# Get the user input as a Vector2.
	#return Vector2(
		#(Input.is_action_pressed("right") as int) - (Input.is_action_pressed("left") as int),
		#(Input.is_action_pressed("down") as int) - (Input.is_action_pressed("up") as int)	
	#)
	var mouse_position = get_global_mouse_position()
	var mouse_distance = mouse_position - position
	
	if (mouse_position - position).length() > 50:
		if mouse_distance.length_squared() > 10:
			look_at(mouse_position)
		velocity = velocity.lerp(transform.x * SPEED, ACCELERATION)
	else:
		velocity = velocity.lerp(Vector2.ZERO, FRICTION)	
		
func _physics_process(delta: float) -> void:
	# Process physics
	#var direction = get_input()
	#if direction.length() > 0:
		#velocity = velocity.lerp(direction.normalized() * SPEED , ACCELERATION)
	#else:
		#velocity = velocity.lerp(Vector2.ZERO, FRICTION)
	
	#var mouse_position = get_global_mouse_position()
	#
	#var direction = (mouse_position - position).normalized()
	#velocity = direction * SPEED
	
	get_input()
	
	move_and_slide()
