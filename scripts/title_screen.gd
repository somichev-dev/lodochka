extends Control


func _ready() -> void:
	var preset = ConfigFile.new()
	preset.load("res://export_presets.cfg")
	%VersionLabel.text = "Версия: %s" % ProjectSettings.get_setting("application/config/version")
	
	var player_data = PlayerDataFileManager.load()
	%CoinLabel.text = "Монеток: %d\nРекорд: %d" % [player_data.coins, player_data.highscore]


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")


func _on_about_button_pressed() -> void:
	%CreditsPanel.show()


func _on_exit_button_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
	
