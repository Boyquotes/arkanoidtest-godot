extends Node2D

@onready var Pad : Sprite2D = $Pad

const Y_POS: int = 1000


func _ready() -> void:
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)
	Pad.position.y = Y_POS


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		Pad.position.x = get_viewport().get_mouse_position().x
