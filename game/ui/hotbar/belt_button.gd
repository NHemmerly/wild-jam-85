class_name HotbarButton
extends MarginContainer

signal item_selected(item: HotbarItem)

@export var item: HotbarItem
@export var button: Button

func _ready() -> void:
	item_selected.connect(Events._on_item_selected)
	
func setup_button() -> void:
	button.icon = item.thumbnail

func _on_button_pressed() -> void:
	item_selected.emit(item)
