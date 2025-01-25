extends Area2D

#var velocity = Vector2(0, 0)
#var acceleration : Vector2
#var direction : Vector2
#
##Called when the node is created
#func _ready():
	#acceleration = Vector2.RIGHT.rotated(rotation)
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#acceleration *= 0.95
	#velocity += acceleration
	#position += velocity * delta

var speed = 500
var direction = Vector2.ZERO

func _process(delta):
	position += speed * direction * delta
