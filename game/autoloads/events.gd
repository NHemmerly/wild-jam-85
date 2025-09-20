extends Node

signal goo_points_change(points: int)
signal map_tile_data(tile_position: Vector2i, tile_data: TileData)

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass
	
func _get_mouse_tile(cell_pos: Vector2i, tile_data: TileData) -> void:
	map_tile_data.emit(cell_pos, tile_data)
	
func _on_goo_consume(points: int) -> void:
	goo_points_change.emit(points)
	
