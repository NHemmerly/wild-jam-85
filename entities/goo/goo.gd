class_name Goo
extends Area2D

# Basically amount of slime points gained
var points: int
var total_scale: float = 1.00
# Changed slime_count script to a signal that interacts with Events autoload
signal goo_consume(new_points: int)

func _ready() -> void:
	connect("goo_consume", Events._on_goo_consume)
	
func increase_points(leaf: Leaf) -> void:
	var new_points: int = leaf.data.id + 1
	points += new_points
	grow(new_points)
	goo_consume.emit(points)
		
func grow(amount: int) -> void:
	total_scale += float(amount/100.0)
	scale = Vector2(total_scale, total_scale)
	print(total_scale)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("leaves"):
		body.queue_free()
		increase_points(body)
