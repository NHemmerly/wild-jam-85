extends AudioStreamPlayer

var volume_tick_array := [
	-99.0,	
	-20.0,
	-15.0,
	-10.0,
	-5.0,
	0.0
]

var volume_tick := 5

func set_volume(level: int) -> void:
	volume_tick = level
	volume_db = volume_tick_array[volume_tick]
