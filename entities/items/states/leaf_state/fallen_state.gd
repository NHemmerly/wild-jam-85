class_name FallenState
extends LeafState

var title = "fallen"

func enter(new_leaf: Leaf) -> void:
	leaf = new_leaf
	leaf.gravity_scale = 0.0
	leaf.freeze = true
	leaf.collision_layer = 2
	leaf.collision_mask = 2
	leaf.freeze = false
	
func update() -> State:
	if !leaf.is_item_surface():
		return FallingState.new()
	return
