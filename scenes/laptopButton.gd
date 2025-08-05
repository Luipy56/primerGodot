extends Area2D

@onready var laptopButton = self
@onready var laptopButtonSprite = $LaptopButtonSprite

@onready var openingLaptopAnimation = $"openingLaptop"
@onready var closingLaptopAnimation := $closingLaptop

@onready var openingLaptopSound := $"openingLaptopSound"
@onready var closingLaptopSound := $closingLaptopSound

@onready var cameraUI = $"../camUI"
@onready var cam1A = $"../cameraSystem/Cam1A"
@onready var cam1ABackground = $"../cameraSystem/Cam1A/Background"

func _ready() -> void:
	#openingLaptopAnimation.visible = false
	openingLaptopAnimation.animation_finished.connect(_open_on_animation_finished)
	closingLaptopAnimation.animation_finished.connect(_close_on_animation_finished)
	
	laptopButton.mouse_entered.connect(func ():
		if NightStats.canOpenLaptop:
			if  !NightStats.openLaptop: 
				NightStats.openLaptop = true
				NightStats.canOpenLaptop = false
				
				openingLaptopAnimation.visible = true
				openingLaptopAnimation.play("openingLaptop")
				openingLaptopSound.play()
				
				laptopButtonSprite.visible = false
				
			else:
				cameraUI.visible = false
				cam1A.visible = false
				
				NightStats.openLaptop = false
				NightStats.canOpenLaptop = false
				
				closingLaptopAnimation.visible = true
				closingLaptopAnimation.play("openingLaptop")
				closingLaptopSound.play()
				
				
				
	)
	
func _open_on_animation_finished() -> void:
	openingLaptopAnimation.visible = false
	cameraUI.visible = true
	cam1A.visible = true
	cam1ABackground.visible = true
	
	NightStats.canOpenLaptop = true
	
func _close_on_animation_finished() -> void:
	closingLaptopAnimation.visible = false
	NightStats.canOpenLaptop = true
	
	laptopButtonSprite.visible = true
	
	print("Closing")
	
	#cameraUI.visible = true
	#cam1A.visible = true
	#cam1ABackground.visible = true
	#
	#NightStats.canOpenLaptop = true
	
