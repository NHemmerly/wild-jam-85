class_name Player
extends Node2D

@export var rake: Rake
const CAM_SPEED: float = 25
@export var cam: Camera2D
var cam_direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cam.position += CAM_SPEED * cam_direction
	rake.position = get_local_mouse_position()

func _input(event: InputEvent) -> void:
	cam_movement()
	rake_leaves(event)
	
func rake_leaves(event) -> void:
	if Input.is_action_pressed("click") and event is InputEventMouseMotion:
		rake.visible = true
		var mouse_move_dir = event.relative.normalized()
		rake.move_leaves(mouse_move_dir)
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
