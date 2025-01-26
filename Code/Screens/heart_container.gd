extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_simple(1)

func update_simple(value):
	for i in get_child_count():
		get_child(i).visible = value > i
