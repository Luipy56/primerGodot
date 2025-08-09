extends Area2D

@onready var freddy_nose: AudioStreamPlayer = $FreddyNose



func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if $"../..".isLeftClic(event):
		$FreddyNose.play()
		
