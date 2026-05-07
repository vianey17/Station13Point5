extends Area2D
class_name ExitArea

@export var next_tile: MapTileBase # Tile this exits to
@export var enter_from: int # Direction

signal exit_triggered(next_tile: MapTileBase, incoming_dir: int)

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# this should only affect the player class
	if not (body is CharacterBody2D):
		return
	emit_signal("exit_triggered", next_tile, enter_from)
