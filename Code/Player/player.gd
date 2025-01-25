extends CharacterBody2D

@export var SPEED = 30
@export var FRICTION = 0.04
@export var ACCELERATION = 0.05

const BULLET_SCENE = preload("res://Code/Projectiles/Player_Bullet.tscn")

func get_input():
	var mouse_position = get_viewport().get_mouse_position()
	var mouse_distance = global_position.distance_to(mouse_position)
	
	if mouse_distance > 10:
			look_at(mouse_position)
	if mouse_distance > 30:
		velocity = velocity.lerp(transform.x * SPEED, ACCELERATION)
	else:
		velocity = velocity.lerp(Vector2.ZERO, FRICTION)	
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var direction = mouse_position - position
		var bullet = BULLET_SCENE.instantiate()
		get_tree().root.add_child(bullet)
		bullet.global_position = global_position
		bullet.rotation = rotation

func _physics_process(delta: float) -> void:
	get_input()
	
	move_and_slide()
