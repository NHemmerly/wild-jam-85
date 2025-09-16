extends Area2D

@onready var slime_count = $"../slimeCount"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("leaf"):
		body.queue_free()
		slime_count.slime_count+=1
