extends Node


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name != "Skeleton":
		return
	Connect.skeleton_decisions.emit([
		"go_south",
	])
