class_name Rake
extends Node2D

@export var rake_area: Area2D
@export var sprite: Sprite2D
const RAKE_FORCE: int = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func move_leaves(rake_direction: Vector2) -> void:
	var leaves: Array = rake_area.get_overlapping_bodies()
	for leaf in leaves:
		if leaf is not Leaf:
			continue
		leaf.apply_force(rake_direction * RAKE_FORCE)
		
func rakes_dont_push(pull_direction: Vector2) -> void:
	if pull_direction.x > 0:
		sprite.flip_h = true
	elif pull_direction.x < 0:
		sprite.flip_h = false
