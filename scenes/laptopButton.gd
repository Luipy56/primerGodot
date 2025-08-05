extends Area2D

@onready var laptopButton = self
@onready var openingLaptopAnimation = $"../openingLaptop"
@onready var openingLaptopSound = $"../openingLaptopSound"

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
