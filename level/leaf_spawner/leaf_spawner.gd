extends Area2D

@export var area: CollisionShape2D
@export var spawn_timer: Timer
@export var cooldown: float
@export var base_leaves: Array[PackedScene]
@export var tile_map: TileMapLayer
@export var hole_map: TileMapLayer
var landing_area_rect: Rect2i
var min_x: float
var max_x: float
var y_spawn: float
var landing_min_y: float
var landing_max_y: float
const LANDING_MARGIN: float = 20

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	landing_area_rect = tile_map.get_used_rect()
	var origin = tile_map.map_to_local(landing_area_rect.position)
	var end = tile_map.map_to_local(landing_area_rect.end)
	landing_min_y = origin.y + LANDING_MARGIN
	landing_max_y = end.y - LANDING_MARGIN * 2
	min_x = position.x
	max_x = position.x + (area.shape.get_rect().size.x)
	y_spawn = area.shape.get_rect().position.y
	spawn_timer.start(cooldown)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_rand_leaf() -> void:
	var rand_x = rng.randf_range(min_x, max_x)
	var rand_land = rng.randf_range(landing_min_y, landing_max_y)
	var current_scene = get_tree().current_scene
	var new_leaf = rand_leaf_type().instantiate()
	current_scene.add_child(new_leaf)
	new_leaf.landing_y = rand_land
	new_leaf.hole = hole_map
	new_leaf.position = Vector2(rand_x, y_spawn)
	
func rand_leaf_type() -> PackedScene:
	var rand_leaf_id = rng.randi_range(0, len(base_leaves) - 1)
	return base_leaves[rand_leaf_id]
	
func _on_spawn_timer_timeout() -> void:
	spawn_rand_leaf()
	spawn_timer.start(cooldown)
