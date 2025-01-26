extends CharacterBody2D

@export var SPEED = 30
@export var FRICTION = 0.04
@export var ACCELERATION = 0.05

var reloaded = true

const BULLET_SCENE = preload("res://Code/Projectiles/Player_Bullet.tscn")

@onready var mouth: Marker2D = $Marker2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func get_input():
	var mouse_position = get_viewport().get_mouse_position()
	var mouse_distance = global_position.distance_to(mouse_position)
	
	if mouse_distance > 10:
			look_at(mouse_position)
	if mouse_distance > 30:
		velocity = velocity.lerp(transform.x * SPEED, ACCELERATION)
		sprite.play("move")
	else:
		velocity = velocity.lerp(Vector2.ZERO, FRICTION)
		sprite.play("idle")	
	
	if Input.is_action_just_pressed("shoot") and reloaded:
		var direction = mouse_position - position
		var bullet = BULLET_SCENE.instantiate()
		get_tree().root.add_child(bullet)
		bullet.global_position = mouth.global_position
		bullet.rotation = rotation
		reloaded = false
		$ShootSound.play()
		$ShootTimer.start()

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	reloaded = true


func _on_walk_sound_timer_timeout():
	# activates walk sound - timer is set to autostart
	$WalkSound.play()
	$WalkSoundTimer.start()
	
