extends Area2D

@onready var restart_timer: Timer = $Timer # Path to node


func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	restart_timer.start()


# listens to Timer->OnTimerTimeout()
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
