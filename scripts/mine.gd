extends Obstacle

func on_collide(obj: Node2D):
	if(obj.is_in_group("player")):
		SignalBus.rock_collided.emit()
		queue_free()
