class_name Belt
extends Area2D

enum Direction {UP, DOWN, LEFT, RIGHT}

var speed = 10000
var conveyor_direction: Direction

@export var leaf: Leaf
@export var anim: AnimatedSprite2D

func _ready() -> void:
	set_direction()
	
func _process(delta: float) -> void:
	pass
	
func set_direction() -> void:
	match conveyor_direction:
		Direction.UP:
			anim.play("belt_up")
		Direction.DOWN:
			anim.play("belt_down")
		Direction.LEFT:
			anim.play("belt_left")
		Direction.RIGHT:
			anim.play("belt_right")
			

func _on_body_entered(body: RigidBody2D) -> void:
	if leaf != null and body is Leaf:
		leaf = body

func _on_body_exited(body: RigidBody2D) -> void:
	if body == leaf:
		leaf = null
