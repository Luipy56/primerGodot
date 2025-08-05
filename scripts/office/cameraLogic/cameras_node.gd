extends Node2D

@onready var spriteCam = $cam
var normalCamsList = []
var animatronicCamsList = []



func _ready() -> void:
	spriteCam.texture = null
	
	var fileNames = [
		"cam1A",
		"cam1B",
		"cam1C",
		"cam2A",
		"cam2B",
		"cam3",
		"cam4A",
		"cam4B",
		"cam5",
		"cam6",
		"cam7"
	]

	# Construir rutas completas y cargar texturas
	for name in fileNames:
		var ruta = "res://assets/img/office/cameras/" + name +".png"
		var textura = load(ruta)
		if not textura:
			push_warning("No se pudo cargar: " + ruta)
			continue
			
		if nombre.begins_with("freddyMenuStatic"):
			freddyMenu.append(textura)
			
		elif nombre.begins_with("freddyMenuWeird1Static") or nombre.begins_with("freddyMenuWeird2Static") or nombre.begins_with("freddyMenuWeird3Static"):
			freddyMenuWeird.append(textura)
			
		elif nombre == "freddyMenu.png":
			freddyMenu.append(textura)
	

func changeCamera(id):
	
	
	
	pass
