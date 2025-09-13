extends TextureRect

@export var animPlayer: AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade_in_out()

func fade_in_out() -> void:
	animPlayer.play("fade_in")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_in":
		animPlayer.play("fade_out")
	else:
		get_tree().change_scene_to_file("res://game/startup_scenes/main_menu.tscn")
