extends Node2D

#NightStats.leftDoorClosed 
#NightStats.rightDoorClosed 

#@onready var left_door_close_button: Area2D = $leftDoorCloseButton

@onready var left_door_close: AnimatedSprite2D = $leftDoorClose
@onready var left_door_open: AnimatedSprite2D = $leftDoorOpen

@onready var right_door_close: AnimatedSprite2D = $rightDoorClose
@onready var right_door_open: AnimatedSprite2D = $rightDoorOpen

var	leftDoorSwifting := false
var	rightDoorSwifting := false

func _ready() -> void:
	left_door_close.animation_finished.connect(_left_on_animation_finished)
	left_door_open.animation_finished.connect(_left_on_animation_finished)
	right_door_close.animation_finished.connect(_right_on_animation_finished)
	right_door_open.animation_finished.connect(_right_on_animation_finished)

@onready var left_b_10: Sprite2D = $leftDoorCloseButton/leftButtons/b10
@onready var left_b_11: Sprite2D = $leftDoorCloseButton/leftButtons/b11


func _on_left_door_close_button_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if leftDoorSwifting: return
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		leftDoorSwifting = true
		#Si puerta cerrada
		if !NightStats.leftDoorClosed:
			NightStats.leftDoorClosed=true
			left_b_10.visible = true
			if _glitchingLeft: left_b_11.visible = true
			
			left_door_open.visible = false
			left_door_close.visible = true
			
			left_door_close.play()
			
		#Si puerta abierta
		else:
			NightStats.leftDoorClosed=false
			left_b_10.visible = false
			left_b_11.visible = false
			
			left_door_close.visible = false
			left_door_open.visible = true
			
			left_door_open.play()
		
		$openDoor.play()

@onready var right_b_10: Sprite2D = $rightDoorCloseButton/rightButtons/b10

func _on_right_door_close_button_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if rightDoorSwifting: return
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		rightDoorSwifting = true
		#Si puerta cerrada
		if !NightStats.rightDoorClosed:
			NightStats.rightDoorClosed=true
			
			right_b_10.visible = true
			if _glitchingRight: right_b_11.visible = true
			
			right_door_open.visible = false
			right_door_close.visible = true
			
			right_door_close.play()
			
		#Si puerta abierta
		else:
			NightStats.rightDoorClosed=false
			right_b_10.visible = false
			right_b_11.visible = false
			
			right_door_close.visible = false
			right_door_open.visible = true
			
			right_door_open.play()
		
		$openDoor.play()

func _left_on_animation_finished():
	leftDoorSwifting = false
func _right_on_animation_finished():
	rightDoorSwifting = false

@onready var left_timer: Timer = $leftTimer
@onready var left_light: Sprite2D = $"../leftLight"

@onready var left_b_01: Sprite2D = $leftDoorCloseButton/leftButtons/b01

var _glitch_stepLeft = 0
var _glitchingLeft = false

func start_left_glitch():
	if _glitchingLeft: return
	left_light.visible = true
	left_b_01.visible = true
	if NightStats.leftDoorClosed: left_b_11.visible = true
	
	_glitchingLeft = true
	_glitch_stepLeft = 0
	left_timer.wait_time = 0.02  # 20ms
	left_timer.start()

func _on_leftTimer_timeout() -> void:
	left_light.visible = true
	
	if _glitch_stepLeft < 40:
		left_light.visible = randi() % 10 != 0
		_glitch_stepLeft += 1
		left_timer.start()
		
	else:
		left_light.visible = false
		left_b_01.visible = false
		_glitchingLeft = false
		left_b_11.visible = false
		

func _on_left_door_light_button_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		start_left_glitch()
		
@onready var right_timer: Timer = $rightTimer
@onready var right_light: Sprite2D = $"../rightLight"

@onready var right_b_01: Sprite2D = $rightDoorCloseButton/rightButtons/b01
@onready var right_b_11: Sprite2D = $rightDoorCloseButton/rightButtons/b11

var _glitch_stepRight = 0
var _glitchingRight = false

func start_right_glitch():
	if _glitchingRight: return
	right_light.visible = true
	right_b_01.visible = true
	if NightStats.rightDoorClosed: right_b_11.visible = true
	
	_glitchingRight = true
	_glitch_stepRight = 0
	right_timer.wait_time = 0.02  # 20ms
	right_timer.start()

func _on_right_timer_timeout() -> void:
	right_light.visible = true
	
	if _glitch_stepRight < 40:
		right_light.visible = randi() % 10 != 0
		_glitch_stepRight += 1
		right_timer.start()
		
	else:
		right_light.visible = false
		right_b_01.visible = false
		_glitchingRight = false
		right_b_11.visible = false


func _on_right_door_light_button_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		start_right_glitch()
