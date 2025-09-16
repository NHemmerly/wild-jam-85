extends Label

var slime_count = 0
func _process(delta: float) -> void:
	var slime_count_text = str(slime_count)
	text = slime_count_text
