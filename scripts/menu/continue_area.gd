extends Area2D

@onready var arrow = $"ArrowContinue"

func _on_mouse_entered():
	arrow.visible = true

func _on_mouse_exited():
	arrow.visible = false

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Me has clicado")

@onready var continueSprite = $"Continue"
@onready var night = $"Night"
@onready var nightNumber = $"NightNumber"
@onready var area = self
var continuar = false

func _ready():
	if SaveData.level != 1:
		continuar = true
		nightNumber.texture = load("res://assets/img/menu/texts/nights/tn"+str(SaveData.level)+".png")
		print("He cambiado la textura")
		
	continueSprite.visible = continuar
	night.visible = continuar
	nightNumber.visible = continuar
	
	area.visible = continuar
	area.set_deferred("monitoring", continuar)  # Desactiva la detección de colisiones y eventos
	area.set_deferred("input_pickable", continuar) 
