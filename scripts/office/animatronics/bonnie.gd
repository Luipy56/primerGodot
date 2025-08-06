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
		null
	]

func _ready():
	timer.wait_time = 5
	timer.start()

func _on_timer_timeout() -> void:
	print("Holi")
	rand = randi() % 20
	if rand < NightStats.bonnieAI:
		#Bonnie debe de actualziar su posicion
		NightStats.bonniePosition += 1
		print("Bonnie:  Me muevo, posicion="+str(NightStats.bonniePosition))
		
		#Ocultamos todas la camaras donde podria estar actualmente #TODO Pasar a ACTUAL CAM y Esconderla, dios es super facil porq haces esto asi? lol
		get_tree().call_group("camsWithBonnieGroup", "set", "visible", false)

		#if NightStats.bonniePosition >= 1:
			#PARA OTRO SCRIPT si cualquier IA != 0 esconder background
			#Añadir sprite de error
			#camsWithBonnie[NightStats.bonniePosition+1].visible = true #TODO PONER DIRECTAMENTE EL position?? -1 Random choice
			
		var camarasPosibles = camsWithBonnie[NightStats.bonniePosition-1]
		var tmp = camarasPosibles[randi() % camarasPosibles.size()] if camarasPosibles is Array else camarasPosibles
		print(tmp)
		tmp.visible = true
			
			#timer.stop()
		
		if NightStats.bonniePosition == 5:
			timer.stop()
			print("Detenido Bonnie")
		
		#currentBonnieCamPosition =  
		
		#TODO if position = puerta
