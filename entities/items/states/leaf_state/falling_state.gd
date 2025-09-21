class_name FallingState
extends LeafState

var title = "falling"

func enter(new_leaf: Leaf) -> void:
	leaf = new_leaf
	leaf.collision_layer = 1 
	leaf.collision_mask = 1
	leaf.gravity_scale = 1.0
	leaf.freeze = false

func update() -> State:
	if leaf.position.y >= leaf.landing_y:
		return FallenState.new()
	return
