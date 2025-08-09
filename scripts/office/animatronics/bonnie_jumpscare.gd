extends Node

func _ready():
	$bonnieJumpscare.animation_finished.connect(_on_animation_finished)

func startBonnieJumpscare():
	$bonnieJumpscareSound.play()
	$bonnieJumpscare.visible = true
	$bonnieJumpscare.play()

var play_count = 0
const MAX_PLAYS = 4
	
func _on_animation_finished():
	play_count += 1
	if play_count < MAX_PLAYS:
		$bonnieJumpscare.play()
	else:
		# Ya se reprodujo 4 veces, para o ejecuta otra cosa
		print("Muerto")
		pass
