extends Node2D

class_name MapTileBase

# --- 
signal onTileExited(next_tile: MapTileBase, entry_direction: Direction.Enum)


# --- Neighbor References ---
@export var north_tile: MapTileBase
@export var north_tile_entry_direction: Direction.Enum

@export var south_tile: MapTileBase
@export var south_tile_entry_direction: Direction.Enum

@export var east_tile: MapTileBase
@export var east_tile_entry_direction: Direction.Enum

@export var west_tile: MapTileBase
@export var west_tile_entry_direction: Direction.Enum

# --- Entry points INSIDE this MapTile ---
@onready var entry_north: Marker2D = $entry_north
@onready var entry_south: Marker2D = $entry_south
@onready var entry_east: Marker2D = $entry_east
@onready var entry_west: Marker2D = $entry_west




func get_entry_position(entry_direction: Direction.Enum) -> Vector2:
	match entry_direction:
		Direction.Enum.NORTH:
			if (entry_north != null):
				return entry_north.global_position
		Direction.Enum.SOUTH:
			if (entry_south != null):
				return entry_south.global_position
		Direction.Enum.EAST:
			if (entry_east != null):
				return entry_east.global_position
		Direction.Enum.WEST:
			if (entry_west != null):
				return entry_west.global_position
	# should never happen
	return Vector2(0,0)
	


func _on_border_south_body_entered(body: Node2D) -> void:
	print("south wall")
	emit_signal("onTileExited", south_tile, south_tile_entry_direction)
	

func _on_border_north_body_entered(body: Node2D) -> void:
	print("north wall")
	emit_signal("onTileExited", north_tile, north_tile_entry_direction)


func _on_border_east_body_entered(body: Node2D) -> void:
	print("east wall")
	emit_signal("onTileExited", east_tile, east_tile_entry_direction)

func _on_border_west_body_entered(body: Node2D) -> void:
	print("west wall")
	emit_signal("onTileExited", west_tile, west_tile_entry_direction)
