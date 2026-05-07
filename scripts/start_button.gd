extends Area2D

var is_hovered = false




func _on_mouse_entered() -> void:
	is_hovered = true




func _on_mouse_exited() -> void:
	is_hovered = false




func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if is_hovered and event.is_action("click"):
		get_tree().change_scene_to_file("res://game.tscn")
