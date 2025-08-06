extends Area2D

@onready var laptopButton = self
@onready var laptopButtonSprite = $LaptopButtonSprite

@onready var openingLaptopAnimation = $"openingLaptop"
@onready var closingLaptopAnimation := $closingLaptop

@onready var openingLaptopSound := $"openingLaptopSound"
@onready var closingLaptopSound := $closingLaptopSound

@onready var cameraSystem: Node2D = $"../cameraSystem"

@onready var cameraUI = $"../camUI"
@onready var cam1A = $"../cameraSystem/Cam1A"
@onready var cam1ABackground = $"../cameraSystem/Cam1A/Background"

func _ready() -> void:
	#Apagar el proceso del control de las camaras para que aun no se mueva
	cameraSystem.set_process(false)
	
	#openingLaptopAnimation.visible = false
	openingLaptopAnimation.animation_finished.connect(_open_on_animation_finished)
	closingLaptopAnimation.animation_finished.connect(_close_on_animation_finished)
	
	laptopButton.mouse_entered.connect(func ():
		if NightStats.canOpenLaptop:
			if  !NightStats.openLaptop: 
				NightStats.openLaptop = true
				NightStats.canOpenLaptop = false
				
				#Activar nodo de las camaras
				cameraSystem.visible= true
				
				#Ejecutar animacion
				openingLaptopAnimation.visible = true
				openingLaptopAnimation.play("openingLaptop")
				openingLaptopSound.play()
				
				#Esconder el boton usado
				laptopButtonSprite.visible = false
				
			else:
				#Esconder Camaras
				cameraSystem.visible= false
				cameraUI.visible = false
				cam1A.visible = false #TODO
				
				NightStats.openLaptop = false
				NightStats.canOpenLaptop = false
				
				#Ejecutar animacion
				closingLaptopAnimation.visible = true
				closingLaptopAnimation.play("openingLaptop")
				closingLaptopSound.play()
				
				#Apagar el proceso para mayor eficiecia
				cameraSystem.set_process(false)
				#print("Apago proceso")
	)
	
func _open_on_animation_finished() -> void:
	openingLaptopAnimation.visible = false
	cameraUI.visible = true
	cam1A.visible = true
	cam1ABackground.visible = true
	
	#Autoload
	NightStats.canOpenLaptop = true
	
	#Encender el proceso para mayor eficiecia
	cameraSystem.set_process(true)
	#print("Enciendo proceso")
	
	
func _close_on_animation_finished() -> void:
	closingLaptopAnimation.visible = false
	NightStats.canOpenLaptop = true
	
	laptopButtonSprite.visible = true
	
	#cameraUI.visible = true
	#cam1A.visible = true
	#cam1ABackground.visible = true
	#
	#NightStats.canOpenLaptop = true
	
