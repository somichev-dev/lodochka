extends CanvasLayer


func _ready() -> void:
	%GameOverPanel.hide()


func _on_coins_changed(value: int) -> void:
	%CoinLabel.text = str(value + 100).substr(1, -1)


func _on_game_over(coins: int, highscore: int) -> void:
	%GameOverPanel.visible = true
	%GameOverScoreLabel.text = "Рекорд: %d\nСобрано монет: %d" % [highscore, coins]


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
