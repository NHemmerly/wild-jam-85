extends Node

signal goo_points_change(points: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_goo_consume(points: int) -> void:
	goo_points_change.emit(points)
	
