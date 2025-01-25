extends TileMapLayer

@export var map_texture: Texture2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# pass # Replace with function body.
	var image = map_texture.get_image()
	var width = image.get_width()
	var height = image.get_height()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
