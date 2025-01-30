extends Node2D


signal coins_changed(value)
signal game_over(coins, highscore)


var coins = 0:
	set(value):
		coins = value
		coins_changed.emit(value)
		pass

var highscore = 0


func _on_coin_collected() -> void:
	coins += 1
	
	
func _on_pozdnyakov() -> void:
	coins += 1


func _on_rock_collided() -> void:
	end_game()
	
	
func end_game():
	%DifficultyIncreaseTimer.stop()
	var node = preload("res://scenes/cool_explosion.tscn").instantiate()
	node.position = %Boat.position
	add_child(node)
	%Boat.queue_free()
	%Props.scroll_speed = 0
	%LeftBarrier.scroll_speed = 0
	%RightBarrier.scroll_speed = 0
	%MusicPlayer.stop()
	update_player_data()
	game_over.emit(coins, highscore)
	


func update_player_data() -> void:
	var saved_data = PlayerDataFileManager.load()
	saved_data.coins += coins
	saved_data.highscore = maxi(coins, saved_data.highscore)
	highscore = saved_data.highscore
	PlayerDataFileManager.save(saved_data)


func _ready() -> void:
	coins = 0
	SignalBus.connect("coin_collected", _on_coin_collected)
	SignalBus.connect("rock_collided", _on_rock_collided)
	SignalBus.connect("pozdnyak", _on_pozdnyakov)
	%Boat.position.y = get_viewport_rect().size.y * 0.8
	%Boat.position.x = get_viewport_rect().size.x / 2
	%Props.position.x = get_viewport_rect().size.x / 2
