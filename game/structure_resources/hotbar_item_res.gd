class_name HotbarItem
extends Resource

enum Direction {
	UP,
	RIGHT,
	DOWN,
	LEFT
}

@export var price: int
@export var thumbnail: Texture2D
@export var preview: Texture2D
@export var structure: PackedScene
@export var direction: Direction
