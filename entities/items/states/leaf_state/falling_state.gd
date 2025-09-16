class_name FallingState
extends LeafState

var title = "falling"

func enter(new_leaf: Leaf) -> void:
	leaf = new_leaf

func update() -> State:
	if leaf.position.y >= leaf.landing_y:
		return FallenState.new()
	return
