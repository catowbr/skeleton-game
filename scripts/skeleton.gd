extends CharacterBody2D

@export var speed: float = 140.0
@export var can_touch: bool = false
@export var can_open_doors: bool = false

var current_direction: Vector2 = Vector2(1, 0)


func _process(delta: float) -> void:
	var direction = current_direction.normalized()
	velocity = direction * speed

	move_and_slide()
	
	
func win_game():
	current_direction = Vector2(0, 0)
