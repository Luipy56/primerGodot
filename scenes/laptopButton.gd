extends Area2D

@onready var laptopButton = self
@onready var openingLaptopAnimation = $"../openingLaptop"
@onready var openingLaptopSound = $"../openingLaptopSound"
@onready var cameraUI = $"../camerasNode/camUI"
@onready var cam1A = $"../camerasNode/cameraSystem/Cam1A"
@onready var cam1ABackground = $"../camerasNode/cameraSystem/Cam1A/Background"

func _ready() -> void:
	openingLaptopAnimation.visible = false
	openingLaptopAnimation.animation_finished.connect(_on_animation_finished)
	
	laptopButton.mouse_entered.connect(func (): 
		openingLaptopAnimation.visible = true
		openingLaptopAnimation.play("openingLaptop")
		openingLaptopSound.play()
	)
	
func _on_animation_finished() -> void:
	openingLaptopAnimation.visible = false
	cameraUI.visible = true
	cam1A.visible = true
	cam1ABackground.visible = true
