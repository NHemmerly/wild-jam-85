extends Node

signal goo_points_change(points: int)
signal map_tile_data(tile_position: Vector2i, tile_data: TileData)
signal set_item(item: HotbarItem)

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass
	
func _get_mouse_tile(cell_pos: Vector2i, tile_data: TileData) -> void:
	map_tile_data.emit(cell_pos, tile_data)
	
func _on_goo_consume(points: int) -> void:
	goo_points_change.emit(points)
	
func _on_item_selected(item: HotbarItem) -> void:
	set_item.emit(item)
	
