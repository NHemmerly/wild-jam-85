class_name TreeSpawner
extends Area2D

@export var tree_types: Array[Decor]
@export var area: CollisionShape2D
@export var base_tree: PackedScene

@onready var spawn_area = area.shape.get_rect()

const ROWS: int = 10

var rng = RandomNumberGenerator.new()
@onready var global_rect_position = area.global_position + spawn_area.position
@onready var global_rect: Rect2 = Rect2(global_rect_position, spawn_area.size)

func _ready() -> void:
	pass
	
func spawn_trees() -> void:
	var range_y: float = global_rect.size.y
	var offset_y: float = range_y / ROWS
	var row_y: float = global_rect.position.y
	var current_scene = get_tree().current_scene
	for i in range(0, ROWS):
		for j in range(0, rng.randi_range(10, 20)):
			var rand_tree = tree_types[rng.randi_range(0, tree_types.size() - 1)]
			var rand_x: float = rng.randf_range(global_rect.position.x, global_rect.end.x)
			var new_tree = base_tree.instantiate()
			current_scene.add_child(new_tree)
			new_tree.global_position = Vector2(rand_x, row_y)
			new_tree.texture = rand_tree.texture
		row_y += offset_y
		
