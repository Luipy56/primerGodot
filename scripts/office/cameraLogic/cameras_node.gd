extends Node2D

#@onready var spriteCam = $cam
var normalCamsList = []
var animatronicCamsList = []

@onready var cameraSystem = $"cameraSystem"

func changeCamera(id): cameraSystem.changeCamera(id)

@onready var transition_lines: AnimatedSprite2D = $transitionLines
@onready var transition_lines_sound: AudioStreamPlayer = $transitionLinesSound

func _ready() -> void:
	transition_lines.animation_finished.connect(_open_on_animation_finished)

func transitionLines():
	#Animacion transicion y sonido
	transition_lines.visible = true
	transition_lines.play()
	transition_lines_sound.play()
	
func _open_on_animation_finished():
	transition_lines.visible = false

	
