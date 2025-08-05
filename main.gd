extends Node2D

@onready var label = $Label
#
#func _ready():
	#label.text = "He editado el texto\nHe editado el textoHe editado el textoHe editado el textoHe editado el texto"
	#print("Debugg")
	#
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action("testing"):
		print("le has dado a la "+ event.as_text())
