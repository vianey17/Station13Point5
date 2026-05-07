extends Interactable

class_name Radio

@onready var puzzle_audio: AudioStreamPlayer2D = $PuzzleAudio
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var audio_track: AudioStream

signal onRadioOff()

var is_on = true

# Called when the node enters the scene tree for the first time.
# BeginPlay()
func _ready() -> void:
	puzzle_audio.stream = audio_track
	puzzle_audio.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interacted():
	if is_on:
		is_on = false
		puzzle_audio.stop()
		animated_sprite_2d.stop()
		emit_signal("onRadioOff")
	
