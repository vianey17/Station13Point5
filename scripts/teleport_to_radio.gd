extends Area2D


@export var teleport_node : Node2D

signal onTeleportTrigger(destination_node: Node2D)
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D



func _on_body_entered(body: Node2D) -> void:
	emit_signal("onTeleportTrigger", teleport_node)
