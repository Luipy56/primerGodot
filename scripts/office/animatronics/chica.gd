#Chica
extends Node

# En tu nodo principal
@onready var timer = $Timer
var rand: int

@onready var camsWithChica := [
		[#1B
			$"../../camerasNode/cameraSystem/Cam1B/Chica",
			$"../../camerasNode/cameraSystem/Cam1B/Chica2"
		],
		[
			$"../../camerasNode/cameraSystem/Cam7/Chica",
			$"../../camerasNode/cameraSystem/Cam7/Chica2"
		],
			$"../../camerasNode/cameraSystem/Cam6/Chica"
		,
		[
			$"../../camerasNode/cameraSystem/Cam4A/Chica",
			$"../../camerasNode/cameraSystem/Cam4A/Chica2"
		],
		[
			$"../../camerasNode/cameraSystem/Cam4B/Chica",
			$"../../camerasNode/cameraSystem/Cam4B/Chica2",
			$"../../camerasNode/cameraSystem/Cam4B/Chica3"
		],#TODO PUERTA
			$"../../Office/rightLight"
			#$"../../Office/chicaLight"
	]

func _ready():
	NightStats.chicaActualCam = $"../../camerasNode/cameraSystem/DebugCam" 
	timer.wait_time = NightStats.chicaWaitTime
	timer.start()

@onready var right_light_node: Sprite2D = $"../../Office/rightLight"
var rightLightChica := load("res://assets/img/office/office/officeRightLightChica.png")
var rightLight := load("res://assets/img/office/office/officeRightLight.png")
var randLocal := 1
func _on_timer_timeout() -> void:
	if NightStats.chicaIsAttacking:
		
		if NightStats.rightDoorClosed:
			NightStats.chicaIsAttacking = false
			NightStats.chicaPosition = 1
			NightStats.chicaActualCam.visible = false
			
			right_light_node.texture = rightLight
		else:
			#Debe de atacar
			#ejecutarJumpscare()
			pass
		return

	rand = randi() % 20
	if rand < NightStats.chicaAI:
		randLocal = 1
		if not (NightStats.chicaPosition in [0, 1, 6]):
			randLocal = -1 if (randi() % 100) < 10 else 1
		NightStats.chicaPosition += randLocal
		NightStats.chicaActualCam.visible = false
		
		#Si Chica en Puerta
		if NightStats.chicaPosition == NightStats.chicaMaxPosition-1:
			NightStats.chicaIsAttacking = true
			right_light_node.texture = rightLightChica
		else:
			NightStats.chicaActualCam = $"../../camerasNode/cameraSystem".activateAnimatronicCamera(camsWithChica, NightStats.chicaPosition - 1)
