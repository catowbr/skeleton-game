extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name != "Skeleton":
		print("not a skeleton")
		return
	print("level won!")
	$Timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
