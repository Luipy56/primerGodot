extends Area2D

@onready var area = self
@onready var camerasNode = $"../../"

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		camerasNode.changeCamera("Cam3")
