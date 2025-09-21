class_name Hotbar
extends CanvasLayer

@export var hotbar_container: HBoxContainer
@export var hotbar_button: PackedScene

signal item_select(item: HotbarItem)

func update_bar(items: Array[HotbarItem]) -> void:
	for item in items:
		hotbar_container.add_child(build_hotbar_item(item))
		
func build_hotbar_item(item: HotbarItem) -> HotbarButton:
	var new_hotbar_button = hotbar_button.instantiate()
	new_hotbar_button.item = item
	new_hotbar_button.setup_button()
	return new_hotbar_button
	
