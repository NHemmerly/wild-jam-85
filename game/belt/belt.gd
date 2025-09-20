extends Area2D
var speed = 10000
var conveying = false
@onready var direction = Vector2.from_angle(rotation)
@onready var leaf_body 

func _ready() -> void:
	
	print(direction)

func _on_body_entered(body: RigidBody2D) -> void:
	conveying = true
	leaf_body = body
	print("enter")
	
#
func _on_body_exited(body: RigidBody2D) -> void:
	conveying = false
	print("exit")

func _process(delta: float) -> void:
	for leaf in get_overlapping_bodies():
		if leaf is Leaf:
			leaf.apply_force(Vector2(speed,speed) * direction * delta)
