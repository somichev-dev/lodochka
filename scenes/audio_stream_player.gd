extends AudioStreamPlayer


func _ready() -> void:
	SignalBus.connect("coin_collected", _on_coin_collected)
	SignalBus.connect("rock_collided", _on_rock_collided)
	SignalBus.connect("pozdnyak", _on_pozdnyakoin_collected)


func play_sound(sound: String):
	stream = load("res://sounds/%s.wav" % sound)
	if sound == "pozdnyakoin":
		pitch_scale = randf_range(0.5, 2.0)
		play()
		return
	play()


func _on_coin_collected() -> void:
	play_sound("coin_pick")


func _on_rock_collided() -> void:
	play_sound("gamover")


func _on_pozdnyakoin_collected() -> void:
	play_sound("pozdnyakoin")


func _on_finished() -> void:
	pitch_scale = 1.0
