extends Node2D

var current_tile: MapTileBase
#@onready var camera_2d: Camera2D = $player/Camera2D

@onready var camera_2d: Camera2D = $Camera2D
@onready var map_tile_1: MapTileBase = $MapTile1
@onready var player: CharacterBody2D = $player

@onready var MapTiles:= $Maps.get_children()
@onready var teleports := $Teleports.get_children()

@onready var radios := $Radios.get_children()

func _on_next_map_tile(next_tile: MapTileBase, entry_direction: Direction.Enum) -> void:
	if (next_tile != null):
		camera_2d.global_position = next_tile.global_position
		# get entry position depending on enum
		player.global_position = next_tile.get_entry_position(entry_direction)
		current_tile = next_tile
	
	



func _on_ready() -> void:
	camera_2d.global_position = player.global_position # Replace with function body.
	
	for radio in radios:
		radio.connect("onRadioOff", _on_radio_off)
	
	for teleport in teleports:
		teleport.connect("onTeleportTrigger", _on_teleport_player)
	
	for map in MapTiles:
		map.connect("onTileExited", _on_next_map_tile)
	

func _on_radio_off():
	var b_radios_on = false
	
	for r in radios:
		var radio := r as Radio
		if radio.is_on == true:
			b_radios_on = true
	
	if !b_radios_on:
		get_tree().change_scene_to_file("res://YouWin.tscn")

func _on_teleport_player(destination : Node2D):
	player.global_position = destination.global_position
	camera_2d.global_position = destination.global_position
