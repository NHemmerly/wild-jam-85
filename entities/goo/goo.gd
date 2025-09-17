class_name Goo
extends Area2D

# Basically amount of slime points gained
var points: int

# Changed slime_count script to a signal that interacts with Events autoload
signal goo_consume(new_points: int)

func _ready() -> void:
	connect("goo_consume", Events._on_goo_consume)
	
func increase_points(leaf: Leaf) -> void:
		points += leaf.data.id + 1
		goo_consume.emit(points)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("leaves"):
		body.queue_free()
		increase_points(body)
