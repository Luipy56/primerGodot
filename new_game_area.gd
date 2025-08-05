extends Area2D

@onready var arrow = $"ArrowNewGame"

func _on_mouse_entered():
	arrow.visible = true

func _on_mouse_exited():
	arrow.visible = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Me has clicado")
