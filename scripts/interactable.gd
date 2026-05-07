extends Area2D

class_name Interactable


@onready var interactable_base: Area2D = $"."

var is_entered = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node2D) -> void:
	is_entered = true

func _on_body_exited(body: Node2D) -> void:
	is_entered = false

func _unhandled_input(event: InputEvent) -> void:
	if is_entered and event.is_action_pressed("action"):
		_on_interacted()

func _on_interacted():
	pass
