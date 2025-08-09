extends Node2D

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action("testing"):
		print("le has dado a la "+ event.as_text())

func isLeftClic(event):
	return event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT

func _ready() -> void:
	$Office/fanAnimation.play()

	
