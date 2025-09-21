class_name Belt
extends Area2D

enum Direction {UP, RIGHT, DOWN, LEFT}

var speed = 10
var belt_direction: Direction
var move_direction: Vector2
var coord: Vector2i

@export var leaf: Leaf
@export var anim: AnimatedSprite2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if leaf == null and body is Leaf:
		leaf = body
		leaf.freeze = true
		leaf.position = position
		leaf.freeze = false
		leaf.gravity_scale = 1.0

func _on_body_exited(body: Node2D) -> void:
	if body == leaf:
		leaf.freeze = false
		
		leaf = null
		
func check_adjacent() -> void:
	pass

func set_direction() -> void:
	match belt_direction:
		Direction.UP:
			anim.play("belt_up")
			gravity_direction = Vector2.UP
		Direction.DOWN:
			anim.play("belt_down")
			gravity_direction = Vector2.DOWN
		Direction.LEFT:
			anim.play("belt_left")
			gravity_direction = Vector2.LEFT
		Direction.RIGHT:
			anim.play("belt_right")
			gravity_direction = Vector2.RIGHT
