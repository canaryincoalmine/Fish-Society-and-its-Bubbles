extends CharacterBody2D


@export var SPEED = 30

@export var target_to_chase: Node2D
@onready var navigation_agent := $NavigationAgent2D as NavigationAgent2D

func _ready() -> void:
	set_physics_process(false)
	call_deferred("wait_for_physics")

func wait_for_physics():
	await get_tree().physics_frame
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	navigation_agent.target_position = target_to_chase.global_position
	
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
	move_and_slide()
