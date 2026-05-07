extends Node2D

#camera_2d.global_position = player.global_position # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		get_tree().change_scene_to_file("res://game.tscn")
