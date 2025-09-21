class_name Leaf
extends RigidBody2D

@export var data: LeafRef
@export var sprite: Sprite2D
@export var collisionShape: CollisionShape2D
@export var landing_y: float
@export var hole: TileMapLayer

var combined := false

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

# What kind of surface is the leaf on? Should it start falling again?		
func is_item_surface() -> bool:
	var tile_position = hole.to_local(position)
	var coords = hole.local_to_map(tile_position)
	var tile_data = hole.get_cell_tile_data(coords)
	if tile_data:
		return tile_data.get_custom_data("item_surface")
	return true

func merge_leaf(leaf: Leaf) -> void:
	if combined != true:
		leaf.combined = true
		spawn_merged(leaf)
		
		
func spawn_merged(leaf: Leaf) -> void:
	if data.id + 1 < data.leaves.size():
		var current_scene = get_tree().current_scene
		var new_leaf = load(data.leaves[str(data.id + 1)]).instantiate()
		current_scene.add_child(new_leaf)
		new_leaf.position = position
		new_leaf.hole = hole
		new_leaf.state = FallenState.new()
		new_leaf.state.enter(new_leaf)
		leaf.queue_free()
		queue_free()

func _on_body_entered(body: Node) -> void:
	if body is Leaf:
		if body.data.id == data.id:
			call_deferred("merge_leaf", body)
