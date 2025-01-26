extends CharacterBody2D


const SPEED = 150.0

@export var target_to_chase: Node2D
@onready var navigation_agent := $NavigationAgent2D as NavigationAgent2D
@onready var timer := $Timer as Timer

func _physics_process(delta: float) -> void:
	navigation_agent.target_position = target_to_chase.global_position
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
	move_and_slide()
