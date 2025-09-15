class_name Leaf
extends RigidBody2D

@export var data: LeafRef
@export var sprite: Sprite2D
@export var collisionShape: CollisionShape2D
@export var landing_y: float

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if position.y >= landing_y:
		gravity_scale = 0.0
		freeze = true
		collision_layer = 2
		collision_mask = 2
