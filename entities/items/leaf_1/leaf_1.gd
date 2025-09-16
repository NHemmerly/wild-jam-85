class_name Leaf
extends RigidBody2D

@export var data: LeafRef
@export var sprite: Sprite2D
@export var collisionShape: CollisionShape2D
@export var landing_y: float
var state: LeafState

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	check_state()
	
func check_state() -> void:
	if !state:
		state = FallingState.new()
		state.enter(self)
	var new_state = state.update()
	if new_state != null:
		state = new_state
		state.enter(self)
