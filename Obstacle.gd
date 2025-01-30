extends StaticBody2D
class_name Obstacle

func _ready() -> void:
	add_to_group("obstacle")

func on_collide(obj):
	print("bruh moment")
