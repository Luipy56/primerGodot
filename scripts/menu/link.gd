extends Area2D

func _on_link_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if $"..".isLeftClic(event):
		OS.shell_open("https://doc.ldeluipy.es")
