extends CharacterBody2D


const SPEED = 300.0

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var timer := $Timer as Timer

func _physics_process(delta: float) -> void:

	move_and_slide()
