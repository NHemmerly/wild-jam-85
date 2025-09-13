extends Area2D
var speed = 300
var conveying = false
@onready var direction = Vector2.from_angle(rotation)
@onready var leaf_body = $"../TEST_OBJ"

func _ready() -> void:
	
	print(direction)

func _on_body_entered(leaf_body) -> void:
	conveying = true
	#body = leaf_bod
	#leaf_body.picked = false
	print("enter")
	
#
func _on_body_exited(body: RigidBody2D) -> void:
	conveying = false
	print("exit")

func _process(delta: float) -> void:
	if conveying:
		leaf_body.position += Vector2(speed,speed) * direction * delta
