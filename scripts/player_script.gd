extends CharacterBody2D

@export var speed: float = 600
@export var turn_inertia: float = 4.0
@export var max_turn_angle: float = 45

var max_radius

var move_vector: Vector2
var controls_engaged: bool
var controls_engage_position: Vector2


func calculate_move_vector(drag_pos: Vector2) -> Vector2:
	var move_diff = controls_engage_position - drag_pos
	move_diff.x /= max_radius
	move_diff.x = clampf(move_diff.x, -1.0, 1.0) * -1
	return move_diff


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		controls_engaged = (event.index == 0 and event.pressed)
		if(!controls_engaged):
			move_vector = Vector2.ZERO
		else:
			controls_engage_position = event.position

	if event is InputEventScreenDrag:
		move_vector = calculate_move_vector(event.position)


func _physics_process(delta: float) -> void:
	velocity = velocity.lerp(Vector2(move_vector.x * speed, 0), delta * turn_inertia)
	if controls_engaged:
		rotation = lerpf(rotation, deg_to_rad(max_turn_angle * move_vector.x), 0.1)
	else:
		rotation = lerpf(rotation, 0, 0.1)
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		
		var collider = collision.get_collider()
		if collider is Obstacle:
			collider.on_collide(self)
	

func _ready() -> void:
	max_radius = DisplayServer.window_get_size().x * 0.3
