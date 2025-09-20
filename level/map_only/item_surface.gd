extends TileMapLayer

signal cell_data(cell_pos: Vector2i, tile_data: TileData)

@export var selectors: TileSelector

const BUILDABLE_HIGHLIGHT: Vector2i = Vector2i(0, 0)
const UNBUILDABLE_HIGHLIGHT: Vector2i = Vector2i(2, 0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("cell_data", Events._get_mouse_tile)
	
func _process(delta: float) -> void:
	highlighter()

func highlighter() -> void:
	var viewport = get_viewport().get_visible_rect()
	var tile_pos = local_to_map(to_local(get_global_mouse_position()))
	var tile_data = get_cell_tile_data(tile_pos)
	selectors.clear()
	if tile_data != null:
		highlight_tile(tile_pos, tile_data)
	cell_data.emit(tile_pos, tile_data)
	
func highlight_tile(cell: Vector2i, tile_data: TileData) -> void:
	if tile_data.get_custom_data("buildable"):
		selectors.set_cell(cell, 0, BUILDABLE_HIGHLIGHT)
	else:
		selectors.set_cell(cell, 0, UNBUILDABLE_HIGHLIGHT)
