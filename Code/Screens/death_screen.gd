extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	$DeathSound.play()
	print("played")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
