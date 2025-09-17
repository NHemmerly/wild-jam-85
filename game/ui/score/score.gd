class_name Score
extends CanvasLayer

@export var score_label: Label 

func _ready() -> void:
	Events.connect("goo_points_change", _on_goo_points_change)

func set_label(value: String) -> void:
	score_label.text = value

func _on_goo_points_change(points: int) -> void:
	set_label(str(points))
