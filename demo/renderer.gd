extends Node2D

@onready var content: SubViewport = $Content

func _input(event: InputEvent) -> void:
	content.push_input(event)
