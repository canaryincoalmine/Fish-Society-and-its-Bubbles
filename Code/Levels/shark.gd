# extends CharacterBody2D


# const SPEED = 300.0

# @export var player: Node2D
# @onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
# @onready var timer := $Timer as Timer

# func _ready() -> void:
# 	if player == null:
# 		player = get_parent().get_node('Player')
# 	timer.start()

# func _process(delta: float) -> void:
# 	$AnimatedSprite2D.play('idle')
# 	var next_position = nav_agent.get_next_path_position()
# 	if next_position != null:
# 		var dir = to_local(next_position).normalized()
# 		velocity = dir * SPEED
# 		move_and_slide()

# func makepath():
# 	if player != null:
# 		nav_agent.target_position = player.global_position

# func _on_timer_timeout():
# 	makepath()



extends CharacterBody2D

const SPEED = 150.0

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var timer := $Timer as Timer

func _ready():
	# Ensure the player node is assigned
	if player == null:
		player = get_parent().get_node("Player")  # Adjust the path to match your scene's structure
		print("Player node assigned programmatically")

	timer.start()  # Start the timer to update the path regularly
	print("Timer started")

func _process(delta: float):
	$AnimatedSprite2D.play("idle")
	
	# Get the direction to the next path position
	var next_position = nav_agent.get_next_path_position()
	if next_position != null:
		var dir = (next_position - global_position).normalized()
		velocity = dir * SPEED
		move_and_slide()
	else:
		print("No path found")

func makepath():
	# Set the target position of the navigation agent to the player's position
	if player != null:
		nav_agent.target_position = player.global_position
		print("Path updated to player position: ", player.global_position)
	else:
		print("Player node is null")

func _on_Timer_timeout():
	# Update the path to the player
	makepath()
