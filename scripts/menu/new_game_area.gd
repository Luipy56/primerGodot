extends Area2D

@onready var arrow = $"ArrowNewGame"

func _on_mouse_entered():
	arrow.visible = true

func _on_mouse_exited():
	arrow.visible = false

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if $"..".isLeftClic(event):
		#print("Se va a cambiar de escena")
		get_tree().change_scene_to_file("res://scenes/office.tscn")
