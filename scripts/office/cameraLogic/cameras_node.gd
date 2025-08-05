extends Node2D

#@onready var spriteCam = $cam
var normalCamsList = []
var animatronicCamsList = []

@onready var cameraSystem = $"cameraSystem"

#var dic = {
	#"cam1A":{
		#"normal":null,
		#"bonnie":null,
		#"chica":null
	#},
	#"cam1Adata":null,
	#"cam1B":{
		#"normal":null,
		#"bonnie1":null,
		#"bonnie2":null,
		#"chica1":null,
		#"chica2":null,
		#"freddy":null
	#},
	#"cam1Bdata":null,
#}

func _ready() -> void:
	pass
	#spriteCam.texture = null
	#cameraSystem.visible = true
	#var fileNames = [
		#"cam1A",
		#"cam1B",
		#"cam1C",
		#"cam2A",
		#"cam2B",
		#"cam3",
		#"cam4A",
		#"cam4B",
		#"cam5",
		#"cam6",
		#"cam7"
	#]
	#var fileAnimatronicNames = [
		#"cam1A",
		#"cam1B",
		#"cam1C",
		#"cam2A",
		#"cam2B",
		#"cam3",
		#"cam4A",
		#"cam4B",
		#"cam5",
		#"cam6",
		#"cam7"
	#]

	#for name in fileNames:
		#var ruta = "res://assets/img/office/cameras/"+ name +".png"
		#var textura = load(ruta)
		#if not textura:
			#push_warning("No se pudo cargar: " + ruta)
			#continue
		#normalCamsList.append(textura)
		
	#for name in fileAnimatronicNames:
		#var ruta = "res://assets/img/office/cameras/" + name +".png"
		#var textura = load(ruta)
		#if not textura:
			#push_warning("No se pudo cargar: " + ruta)
			#continue
		#normalCamsList.append(textura)

func changeCamera(id):
	
	print(id)
	
	pass
	
func autoMoveCamera():
	cameraSystem.position.x += 1
	
	
	
	
	
	
	
	
	
	
	
	
	
	
