class_name Goo
extends Area2D

@export var sprite: AnimatedSprite2D
@export var audio: AudioStreamPlayer2D

# Basically amount of slime points gained
var points: int
var total_scale: float = 1.00

const GROWTH_RATE: float = 1000.0
# Changed slime_count script to a signal that interacts with Events autoload
signal goo_consume(new_points: int)

func _ready() -> void:
	connect("goo_consume", Events._on_goo_consume)
	
func increase_points(leaf: Leaf) -> void:
	var new_points: int = leaf.data.score
	points += new_points
	grow(new_points)
	goo_consume.emit(points)
		
func grow(amount: int) -> void:
	total_scale += float(amount/GROWTH_RATE)
	scale = Vector2(total_scale, total_scale)
	sprite.play("eat")
	audio.play()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("leaves"):
		body.queue_free()
		increase_points(body)


func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "eat":
		sprite.play("idle")
