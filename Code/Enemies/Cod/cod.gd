extends CharacterBody2D

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var raycast: RayCast2D = $RayCast2D
@export var target_to_chase: CharacterBody2D

var id = "enemy"
var health = 3
var move = 0

var dash_ready = true
var dashing = false

const SPEED = 100.0

func _ready() -> void:
	$AnimatedSprite2D.play()

func _physics_process(delta: float) -> void:
	if Global.player != null:
		if raycast.is_colliding():
			print("Moving")
			move = 1
		if navigation_agent.is_navigation_finished() and target_to_chase.global_position == navigation_agent.target_position:
			return
		look_at(target_to_chase.global_position)
		navigation_agent.target_position = target_to_chase.global_position
		if dashing == false:
			velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED * move
		if dash_ready:
			dash_ready = false
			dashing = true
			velocity = velocity*5
			$DashTimer.start()
			await get_tree().create_timer(1).timeout
			dashing = false
		move_and_slide()
	
func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free();


func _on_dash_timer_timeout():
	dash_ready = true

#func _on_detection_range_area_entered(area: Area2D) -> void:
	#if area.has_method("get_parent"):
		#var player = area.get_parent() 
		#if "id" in player and player.id == "player":
			#set_physics_process(true)
			
