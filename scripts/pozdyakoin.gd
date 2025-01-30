extends Obstacle


func on_collide(obj: Node2D):
	if(obj.is_in_group("player")):
		SignalBus.pozdnyak.emit()
		queue_free()
