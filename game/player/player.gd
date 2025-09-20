class_name Player
extends Node2D

@export var hotbar_items: Array[HotbarItem]
@export var hotbar: Hotbar
@export var rake: Rake
@export var cam: Camera2D
@export var held_sprite: Sprite2D

const CAM_SPEED: float = 25
var cam_direction: Vector2 = Vector2.ZERO

var current_tile: Vector2i
var current_tile_data: TileData
var held_item: HotbarItem

func _ready() -> void:
	Events.map_tile_data.connect(_hover_pos)
	Events.set_item.connect(_on_set_item)
	hotbar.update_bar(hotbar_items)

func _process(delta: float) -> void:
	cam.position += CAM_SPEED * cam_direction
	rake.position = get_local_mouse_position()
	hold_item()

func _input(event: InputEvent) -> void:
	cam_movement()
	if !held_item:
		rake_leaves(event)
	else:
		rotate_item()
		held_item_rotation()
		use_item(event)
	

func _unhandled_input(event: InputEvent) -> void:
	pass
		
func use_item(event) -> void:
	if Input.is_action_just_pressed("click"):
		var current_scene = get_tree().current_scene
		var viewport = get_viewport().get_visible_rect()
		if viewport.has_point(get_global_mouse_position()):
			if current_tile_data.get_custom_data("buildable"):
				var placed_item = held_item.structure.instantiate()
				current_scene.add_child(placed_item)
				placed_item.belt_direction = held_item.direction
				placed_item.set_direction()
				placed_item.position = get_scene_position(current_tile)
	
func hold_item() -> void:
	if held_item != null	:
		held_sprite.texture = held_item.preview
		held_sprite.position = get_local_mouse_position()
		
func rotate_item() -> void:
	if Input.is_action_just_pressed("rotate"):
		held_item.direction += 1
		held_item.direction = wrapi(held_item.direction, 0, 4)
	
func _hover_pos(tile_coords: Vector2i, tile_data: TileData) -> void:
	current_tile = tile_coords
	current_tile_data = tile_data
	
func rake_leaves(event) -> void:
	if Input.is_action_pressed("click") and event is InputEventMouseMotion:
		rake.visible = true
		var mouse_move_dir = event.relative.normalized()
		rake.move_leaves(mouse_move_dir)
		rake.rakes_dont_push(mouse_move_dir)
	if Input.is_action_just_released("click"):
		rake.visible = false
	
func cam_movement() -> void:
	if Input.is_action_pressed("cam_up"):
		cam_direction = Vector2.UP
	if Input.is_action_pressed("cam_down"):
		cam_direction = Vector2.DOWN
	if Input.is_action_pressed("cam_left"):
		cam_direction = Vector2.LEFT
	if Input.is_action_pressed("cam_right"):
		cam_direction = Vector2.RIGHT
	if not (
		Input.is_action_pressed("cam_up") or
		Input.is_action_pressed("cam_down") or
		Input.is_action_pressed("cam_left") or 
		Input.is_action_pressed("cam_right")
	):
		cam_direction = Vector2.ZERO
		
func _on_set_item(new_item: HotbarItem) -> void:
	held_item = new_item
	
func get_scene_position(tile_coords: Vector2i) -> Vector2:
	var scene_vector: Vector2 = Vector2((tile_coords.x * 32) + 16, \
										(tile_coords.y * 32) + 16) 
	return scene_vector
	
func held_item_rotation() -> void:
	match held_item.direction:
		held_item.Direction.UP:
			held_sprite.rotation_degrees = -90
		held_item.Direction.DOWN:
			held_sprite.rotation_degrees = 90
		held_item.Direction.LEFT:
			held_sprite.rotation_degrees = 180
		held_item.Direction.RIGHT:
			held_sprite.rotation_degrees = 0
