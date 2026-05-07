extends Node2D

class_name SpeechBubble

@onready var speech_bubble: Node2D = $"."
@onready var label: Label = $Label

func set_text(new_text: String):
	label.text = new_text
	label.queue_redraw()
