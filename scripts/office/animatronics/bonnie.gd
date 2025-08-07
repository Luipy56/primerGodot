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

var randLocal := 1
func _on_timer_timeout() -> void:
	if NightStats.bonnieIsAttacking:
		#Si se defiende a bonnie
		if NightStats.leftDoorClosed:
			#print("Reinicio posicion")
			NightStats.bonnieIsAttacking = false
			NightStats.bonniePosition = 1
			NightStats.bonnieActualCam.visible = false
			NightStats.bonnieActualCam = $"../../camerasNode/cameraSystem".activateAnimatronicCamera(camsWithBonnie,NightStats.bonniePosition-1)
		else:
			#Bonnie debe de atacar
			#ejecutarJumpscare()
			pass
		return

	rand = randi() % 20
	if rand < NightStats.bonnieAI:
		#Bonnie debe de actualziar su posicion
		
		#50% de que se sume otro si posicion 2
		#if NightStats.bonniePosition == 2: NightStats.bonniePosition += randi() % 2
		#NightStats.bonniePosition += 1
		
		randLocal = 1
		if not (NightStats.bonniePosition in [0, 1, 5]):
			randLocal = -1 if (randi() % 100) < 20 else 1
		NightStats.bonniePosition += randLocal


		
		#Ocultamos todas la camaras donde podria estar actualmente # Pasar a ACTUAL CAM y Esconderla, dios es super facil porq haces esto asi? lol
		#get_tree().call_group("camsWithBonnieGroup", "set", "visible", false)
		

		#if NightStats.bonniePosition >= 1:
			#PARA OTRO SCRIPT si cualquier IA != 0 esconder background
			#Añadir sprite de error
			#camsWithBonnie[NightStats.bonniePosition+1].visible = true #TODO PONER DIRECTAMENTE EL position?? -1 Random choice
			
		#var camarasPosibles = camsWithBonnie[NightStats.bonniePosition-1]
		#var tmp = camarasPosibles[randi() % camarasPosibles.size()] if camarasPosibles is Array else camarasPosibles
		#print(tmp)
		#tmp.visible = true
		NightStats.bonnieActualCam.visible = false
		NightStats.bonnieActualCam = $"../../camerasNode/cameraSystem".activateAnimatronicCamera(camsWithBonnie, NightStats.bonniePosition - 1)

		
			#timer.stop()
		
		#Cuando atacar
		if NightStats.bonniePosition == NightStats.bonnieMaxPosition-1:
			#timer.stop()
			#print("Detenido Bonnie")
			#print("Bonnie En Puerta")
			NightStats.bonnieIsAttacking = true
			#NightStats.bonnieActualCam.visible = false
			
		
		#currentBonnieCamPosition =  
		
		#TODO if position = puerta
