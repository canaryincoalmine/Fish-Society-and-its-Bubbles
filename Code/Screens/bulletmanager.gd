extends Node2D

@export var bullet_scene : PackedScene


func _on_player_shoot(position, direction) -> void:
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
	bullet.position = position
