extends CharacterBody2D

var SPEED = 30


# Called when the node enters the scene tree for the first time.
func _ready():
	$HeartAnimation.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Global.player != null and position.distance_to(Global.player.position) <= 500):
		var acceleration = Vector2(0,0)
		rotation = Global.player.position.angle_to_point(position)
		acceleration = -Vector2(SPEED,0).rotated(rotation)
		velocity += acceleration
		position += velocity * delta
