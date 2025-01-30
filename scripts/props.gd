extends Node2D

var offset = 0
var obstacle_limit = 150
@onready var obstacle_scene = preload("res://scenes/chunks/obstacle.tscn") as PackedScene
@export var obstacle_v_offset = 1200
@export var scroll_speed = 300
@export var safe_margin = 100


func _process(delta: float) -> void:
	summon_random_obstacle()
	delete_invisible_obstacles()
	position.y += scroll_speed * delta


func summon_random_obstacle():
	if(get_child_count() >= obstacle_limit):
		return
	var obstacle = obstacle_scene.instantiate() as Node2D
	obstacle.position.x = 0
	obstacle.position.y = position.y + (offset) * -1 
	offset += obstacle_v_offset
	add_child(obstacle)


func delete_invisible_obstacles():
	for c in get_children():
		if c is Node2D:
			if c.global_position.y > get_viewport_rect().size.y + safe_margin:
				c.queue_free()


func _on_difficulty_increase_timer_timeout() -> void:
	scroll_speed += 2
