extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.hud = self
	update_simple(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_simple(value):
	for i in get_child_count():
		get_child(i).visible = value > i
