extends CharacterBody2D


@export var SPEED = 200
@export var FRICTION = 0.01
@export var ACCELERATION = 0.1

func get_input():

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	return Vector2(
		(Input.is_action_pressed("right") as int) - (Input.is_action_pressed("left") as int),
		(Input.is_action_pressed("down") as int) - (Input.is_action_pressed("up") as int)	
	)
	
func _physics_process(delta: float) -> void:
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * SPEED , ACCELERATION)
	else:
		velocity = velocity.lerp(Vector2.ZERO, FRICTION)
	move_and_slide()
