extends Node2D


func _on_audio_stream_player_tree_entered() -> void:
	$AnimatedSprite2D.play()
	$AudioStreamPlayer.play()


func _on_audio_stream_player_finished() -> void:
	queue_free()
