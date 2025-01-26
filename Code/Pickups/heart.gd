extends Area2D

var follow_range = 300
var speed = 60
var velocity = Vector2(0,0)
var acceleration = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$HeartAnimation.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Global.player != null and position.distance_to(Global.player.position) <= follow_range):
		acceleration = Vector2(speed,0).rotated(position.angle_to_point(Global.player.position))
		velocity += acceleration
		position += velocity * delta
	velocity = velocity * 0.9


func _on_body_entered(body):
	Global.player.receiveHP(1)
	queue_free()
