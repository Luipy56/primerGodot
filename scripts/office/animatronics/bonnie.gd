#Bonnie
extends Node

# En tu nodo principal
@onready var timer = $Timer
var rand: int

@onready var camsWithBonnie := [
		[#1B
			$"../../camerasNode/cameraSystem/Cam1B/Bonnie",
			$"../../camerasNode/cameraSystem/Cam1B/Bonnie2"
		],
		[#5
			$"../../camerasNode/cameraSystem/Cam5/Bonnie",
			$"../../camerasNode/cameraSystem/Cam5/Bonnie2"
		],
		#2A
			$"../../camerasNode/cameraSystem/Cam2A/Bonnie"
		,
		#3
			$"../../camerasNode/cameraSystem/Cam3/Bonnie"
		,
		[
			$"../../camerasNode/cameraSystem/Cam2B/Bonnie",
			$"../../camerasNode/cameraSystem/Cam2B/Bonnie2"
		],#TODO PUERTA
			$"../../Office/bonnieLight"
	]

func _ready():
	NightStats.bonnieActualCam = $"../../camerasNode/cameraSystem/DebugCam" 
	timer.wait_time = NightStats.bonnieWaitTime
	timer.start()
	
@onready var left_light_node: Sprite2D = $"../../Office/leftLight"
var leftLightBonnie := load("res://assets/img/office/office/officeLeftLightBonnie.png")
var leftLight := load("res://assets/img/office/office/officeLeftLight.png")
var randLocal := 1


func _on_timer_timeout() -> void:
	if NightStats.bonnieIsAttacking:
		#Si se defiende a bonnie
		if NightStats.leftDoorClosed:
			NightStats.bonnieIsAttacking = false
			NightStats.bonniePosition = 1
			NightStats.bonnieActualCam.visible = false
		
			left_light_node.texture = leftLight
		else:
			#Bonnie debe de atacar
			#ejecutarJumpscare()
			timer.stop()#TODO
			$BonnieJumpscare.startBonnieJumpscare()
		return

	rand = randi() % 20
	if rand < NightStats.bonnieAI:
		randLocal = 1
		if not (NightStats.bonniePosition in [0, 1, 5]):
			randLocal = -1 if (randi() % 100) < 20 else 1
		NightStats.bonniePosition += randLocal
		$"../../camerasNode".transitionLines()
		
		#Efecto de sonido
		if randi() % 4 == 1:
			if not $Circus.playing:
				$Circus.play()
		if not $BonnieSteps.playing:
			$BonnieSteps.play()

		
		
		
		NightStats.bonnieActualCam.visible = false
		
		#Cuando atacar
		if NightStats.bonniePosition == NightStats.bonnieMaxPosition-1:
			NightStats.bonnieIsAttacking = true
			left_light_node.texture = leftLightBonnie
		else:
			NightStats.bonnieActualCam = $"../../camerasNode/cameraSystem".activateAnimatronicCamera(camsWithBonnie, NightStats.bonniePosition - 1)

			
