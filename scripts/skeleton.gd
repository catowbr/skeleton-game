extends CharacterBody2D


@export var can_touch: bool = false
@export var can_open_doors: bool = false


func _process(delta: float) -> void:
	if can_touch:
		pass
	if can_open_doors:
		pass
