extends Interactable

class_name npc

@onready var character_base: Area2D = $"."
@onready var label: Label = $Label
@export var character_sprite: Texture2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@export var speech: String
@onready var speech_bubble: SpeechBubble = $speech_bubble


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speech_bubble.set_text(speech)
#	sprite_2d.texture = character_sprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interacted():
	speech_bubble.visible = true

func _on_body_exited(body: Node2D) -> void:
	super(body)
	speech_bubble.visible = false
