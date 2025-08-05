extends Sprite2D

var freddyMenu = []
var freddyMenuWeird = []
var frame_delay = 0.08  # 40 ms ~ 25 fps
var timer := 0.0

func _ready():
	randomize()

	var nombres_archivos = [
		#"freddyMenu.png",  # N
		"freddyMenuStatic1.png",
		"freddyMenuStatic2.png",
		"freddyMenuStatic3.png",
		"freddyMenuStatic4.png",
		"freddyMenuStatic5.png",
		"freddyMenuStatic6.png",
		"freddyMenuStatic7.png",
		"freddyMenuStatic8.png",
		#"freddyMenuWeird1.png",  # N
		"freddyMenuWeird1Static1.png",
		"freddyMenuWeird1Static2.png",
		"freddyMenuWeird1Static3.png",
		"freddyMenuWeird1Static4.png",
		"freddyMenuWeird1Static5.png",
		"freddyMenuWeird1Static6.png",
		"freddyMenuWeird1Static7.png",
		"freddyMenuWeird1Static8.png",
		#"freddyMenuWeird2.png",  # N
		"freddyMenuWeird2Static1.png",
		"freddyMenuWeird2Static2.png",
		"freddyMenuWeird2Static3.png",
		"freddyMenuWeird2Static4.png",
		#"freddyMenuWeird3.png",  # N
		"freddyMenuWeird3Static1.png",
		"freddyMenuWeird3Static2.png",
		"freddyMenuWeird3Static3.png",
		"freddyMenuWeird3Static4.png"
	]

	# Construir rutas completas y cargar texturas
	for nombre in nombres_archivos:
		var ruta = "res://assets/img/menu/freddy/" + nombre
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
			

func _process(delta):
	timer += delta
	if timer >= frame_delay:
		timer = 0.0
		var dado = randi() % 10 + 1  # 1 a 10
		if dado == 1:
			texture = freddyMenuWeird[randi() % freddyMenuWeird.size()]
		else:
			texture = freddyMenu[randi() % freddyMenu.size()]
