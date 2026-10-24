extends Node2D

const GRIDSIZE: int = 64 * 4;

@export var col: int = 0;
@export var row: int = 0;

func _ready() -> void:
	set_position(Vector2(col*GRIDSIZE, row*GRIDSIZE))

func _process(delta: float) -> void:
	pass
