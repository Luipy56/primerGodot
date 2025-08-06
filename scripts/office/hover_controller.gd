extends Node2D

@onready var sprite = $"../mainOffice"
@onready var areaLeft = $hoverLeft
@onready var areaRight = $hoverRight

var move_left := false
var move_right := false
var moveLeftLocked := false
var moveRightLocked := false

var current_speed := 50.0
const MAX_SPEED := 450.0  # px/s
const ACCEL_TIME := 1.5   # segundos para alcanzar MAX_SPEED
var acceleration := MAX_SPEED / ACCEL_TIME

const MAX_LEFT = 480
const MAX_RIGHT = 800

func _ready() -> void:
	set_process(false)
	areaLeft.mouse_entered.connect(func (): 
		move_left = true
		moveRightLocked = false
		current_speed = 50.0
		set_process(true)
	)
	areaLeft.mouse_exited.connect(func (): 
		move_left = false
		current_speed = 50.0
		set_process(false)
	)
	areaRight.mouse_entered.connect(func (): 
		move_right = true
		moveLeftLocked = false
		current_speed = 50.0
		set_process(true)
	)
	areaRight.mouse_exited.connect(func ():
		move_right = false
		current_speed = 50.0
		set_process(false)
	)

func _process(delta: float) -> void:
	if move_left or move_right:
		#current_speed += acceleration * delta
		#current_speed = min(current_speed, MAX_SPEED)
		if current_speed < MAX_SPEED:
			current_speed += acceleration * delta

		if !moveLeftLocked and move_left:
			sprite.position.x -= current_speed * delta
			if sprite.position.x < MAX_LEFT: 
				moveLeftLocked = true 
				#print("DER Lockeado")
				sprite.position.x = MAX_LEFT
				
		elif !moveRightLocked and move_right:
			sprite.position.x += current_speed * delta
			if sprite.position.x > MAX_RIGHT: 
				moveRightLocked = true 
				#print("IZQ Lockeado")
				sprite.position.x = MAX_RIGHT
