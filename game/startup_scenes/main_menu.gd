extends CanvasLayer

@export var animPlayer: AnimationPlayer
@export var art: TextureRect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	art.modulate.a = 0
	animPlayer.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
