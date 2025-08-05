extends Area2D

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Alternando estado")
		SaveData.save(1 if SaveData.level == 2 else 2)
