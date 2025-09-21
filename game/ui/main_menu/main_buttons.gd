extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level/map_only/map_only.tscn")


func _on_h_slider_value_changed(value: float) -> void:
	MusicPlayer.set_volume(int(value))
	
