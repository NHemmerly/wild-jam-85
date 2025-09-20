extends MarginContainer

signal item_selected(item: PackedScene)

@export var item: PackedScene

func _ready() -> void:
	item_selected.connect(Events._on_item_selected)

func _on_button_pressed() -> void:
	item_selected.emit(item)
