extends Panel


func _ready() -> void:
	hide()


func _on_visibility_changed() -> void:
	%ButtonContainer.visible = !%ButtonContainer.visible
	%CoinLabel.visible = !%CoinLabel.visible
	%VersionLabel.visible = !%VersionLabel.visible
	%TitleLabel.visible = !%TitleLabel.visible


func _on_close_credits_button_pressed() -> void:
	%CreditsPanel.hide()
