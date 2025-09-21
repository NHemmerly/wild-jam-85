class_name Map
extends Node2D

@export var tree_spawner: TreeSpawner

func _ready() -> void:
	await tree_spawner.spawn_trees()
