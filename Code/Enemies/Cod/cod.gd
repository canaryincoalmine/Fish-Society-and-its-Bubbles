extends CharacterBody2D


@export var SPEED = 30

@export var target_to_chase: Node2D
@onready var navigation_agent := $NavigationAgent2D as NavigationAgent2D
@onready var timer := $Timer as Timer

func _ready() -> void:
	timer.start()

func _physics_process(delta: float) -> void:
	if target_to_chase and is_instance_valid(target_to_chase):
		velocity  = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
		move_and_slide()
	else:
		print("Error, invalid target.")

func _on_timer_timeout() -> void:
	if target_to_chase and is_instance_valid(target_to_chase):
		navigation_agent.target_position = target_to_chase.global_position
