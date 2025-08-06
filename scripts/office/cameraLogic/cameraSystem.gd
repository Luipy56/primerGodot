extends Node2D

@export var move_interval := 0.04  # tiempo en segundos entre movimientos 
@export var wait_duration := 3.0

var _time_accumulator := 0.0
var _active := false

const MAX_LEFT = 480
const MAX_RIGHT = 800
var moveDirection := -1
var _wait_timer := 0.0
var _waiting := false

func _process(delta):
	#print("S")
	#if not visible:
	##if not visible or not _active:
		#return
	#region Movimiento de la camara
	if _waiting:
		_wait_timer += delta
		if _wait_timer >= wait_duration:
			_waiting = false
			_wait_timer = 0.0
		else:
			return
	else:
		_time_accumulator += delta
		if _time_accumulator >= move_interval:
			_time_accumulator = 0.0
			if position.x+moveDirection < MAX_LEFT:
				moveDirection *= -1
				_waiting = true
			elif position.x+moveDirection > MAX_RIGHT:
				moveDirection *= -1
				_waiting = true 
			else:
				position.x += moveDirection
	#endregion
	

func start_animation():
	_active = true
	_time_accumulator = 0.0

func stop_animation():
	_active = false
	
@onready var currentCamera: Node2D = $Cam1A

func changeCamera(id: String):
	
	if currentCamera.name == id: return
		
	# Ocultar la camara actual
	if currentCamera: currentCamera.visible = false

	# Obtener la camara a mostrar usando el nombre
	var camera_to_show = get_node_or_null(id)
	if camera_to_show and camera_to_show is CanvasItem:
		camera_to_show.visible = true
		currentCamera = camera_to_show
	else:
		push_error("No se encontro la camara: " + id)


















 
