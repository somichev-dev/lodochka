extends Obstacle

# урааа это же реюз кода :D
var scroll_speed = 300
var sprites: Array[Node2D] = []

func _ready() -> void:
	for c in get_children():
		if c.is_in_group("buoy"):
			sprites.push_back(c)

func _process(delta: float) -> void:
	var screen_height = get_viewport_rect().size.y
	for c in sprites:
		c.global_position.y += scroll_speed * delta
		if c.global_position.y > screen_height + 85:
			c.global_position.y = -85

func find_min_y_node(nodes: Array) -> Node:
	var min_y_node = null
	var min_y_value = INF

	for node in nodes:
		if node.position.y < min_y_value:
			min_y_value = node.position.y
			min_y_node = node

	return min_y_node

func on_collide(obj: Node2D):
	if(obj.is_in_group("player")):
		SignalBus.rock_collided.emit()


func _on_difficulty_increase_timer_timeout() -> void:
	scroll_speed += 2
