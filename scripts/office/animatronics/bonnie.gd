#Bonnie
extends Node

# En tu nodo principal
@onready var timer = $Timer
var rand: int

@onready var camsWithBonnie := [
	$"../../camerasNode/cameraSystem/Cam1B/Bonnie",
	$"../../camerasNode/cameraSystem/Cam1B/Bonnie2",
]

func _ready():
	timer.wait_time = 1
	timer.start()
	print("A")

func _on_timer_timeout() -> void:
	print("Casda")
	rand = randi() % 20
	if rand < NightStats.bonnieAI:
		#Bonnie debe de actualziar su posicion
		NightStats.bonniePosition += 1
		print("Rand")
		
		if NightStats.bonniePosition == 1:
			#PARA OTRO SI cualquier IA != 0 esconder background
			#Añadir sprite de error
			camsWithBonnie[0].visible = true #TODO PONER DIRECTAMENTE EL position?? -1 Random choice
			print("PARO EL TIMER DE BONNIE")
			timer.stop()
			
		
		#currentBonnieCamPosition =  
		
		#TODO if position = puerta
