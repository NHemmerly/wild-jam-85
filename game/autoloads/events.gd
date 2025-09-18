extends Node

signal goo_points_change(points: int)

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass
	
func _on_goo_consume(points: int) -> void:
	goo_points_change.emit(points)
	
