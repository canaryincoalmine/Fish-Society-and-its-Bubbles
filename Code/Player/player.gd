extends CharacterBody2D

@export var SPEED = 30
@export var FRICTION = 0.04
@export var ACCELERATION = 0.05

var reloaded = true
var dash_available = true
var health = 1

var id = "player"

const BULLET_SCENE = preload("res://Code/Projectiles/Player_Bullet.tscn")

@onready var mouth: Marker2D = $Marker2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func get_input():
	var mouse_position = get_global_mouse_position()
	var mouse_distance = global_position.distance_to(mouse_position)
	
	if mouse_distance > 10:
		look_at(mouse_position)
		$WalkSoundTimer.wait_time = 0.5
		$WalkSound.volume_db = -17
	if mouse_distance > 30:
		velocity = velocity.lerp(transform.x * SPEED, ACCELERATION)
		sprite.play("move")
		$WalkSoundTimer.wait_time = 0.3
		$WalkSound.volume_db = -12
	else:
		velocity = velocity.lerp(Vector2.ZERO, FRICTION)
		sprite.play("idle")	
	
	if Input.is_action_just_pressed("shoot") and reloaded:
		reloaded = false
		var direction = mouse_position - position
		spawn_bullet(direction)
		process_recoil()
		$ShootSound.play()
		$ShootTimer.start()

		
	if Input.is_action_just_pressed(("dash")) and dash_available:
		# velocity add
		velocity = Vector2(1000,0).rotated(rotation)
		dash_available = false
		$DashTimer.start()
		$DashSound.play()
		
func spawn_bullet(direction):
	var bullet = BULLET_SCENE.instantiate()
	get_tree().root.add_child(bullet)
	bullet.global_position = mouth.global_position
	bullet.rotation = rotation
	
func process_recoil():
	velocity = velocity - Vector2(200,0).rotated(rotation)


func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	#var collision = move_and_collide(Vector2(velocity.x, velocity.y) * delta)
	#if collision and "id" in collision.get_collider() and collision.get_collider().id == "enemy":
	#	handle_enemy_collision(collision.get_collider())
		
func handle_enemy_collision(enemy):
	queue_free()
	
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	reloaded = true

func _on_walk_sound_timer_timeout():
	# activates walk sound - timer is set to autostart
	$WalkSound.play()
	$WalkSoundTimer.start()
	
func receiveHP(amount):
	health += amount
	Global.hud.update_simple(health)


func _on_dash_timer_timeout():
	dash_available = true


func _on_ready():
	Global.player = self
