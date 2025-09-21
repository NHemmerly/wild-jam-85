extends Control


func _on_button_pressed() -> void:
	if MusicPlayer.volume_db > -100:
		MusicPlayer.volume_db = -100
	else:
		MusicPlayer.set_volume(MusicPlayer.volume_tick)
