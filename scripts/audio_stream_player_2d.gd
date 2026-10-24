extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"..".move_east() or $"..".move_south() or  $"..".move_west() or  $"..".move_north():
		playing = true
	else:
		playing = false
