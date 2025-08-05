extends Sprite2D

var staticsList = []
var rand = 0
var timer = 0.0

var index = 0          # índice de la textura actual en la secuencia
var phase = 0          # 0: aparecer, 1: visible, 2: desaparecer
var phase_timer = 0.0  # tiempo acumulado para la fase actual

var sequence_length = 0  # cuántas texturas mostrar en esta ronda
var inter_sequence_delay = 0.9  # 1 segundo de pausa entre secuencias
var inter_sequence_timer = 0.0
var waiting_between_sequences = false

var phase_durations = [0.04, 0.05, 0.05]  # tiempos en segundos para cada fase

func _ready():
	randomize()
	for i in range(1, 15+1):
		var ruta = "res://assets/img/menu/staticLines/staticLines" + str(i) + ".png"
		var textura = load(ruta)
		if not textura:
			push_warning("No se pudo cargar: " + ruta)
			continue
		staticsList.append(textura)
	visible = false

func _process(delta):
	if waiting_between_sequences:
		inter_sequence_timer += delta
		if inter_sequence_timer >= inter_sequence_delay:
			waiting_between_sequences = false
			inter_sequence_timer = 0.0
			sequence_length = 0  # prepararse para nueva secuencia
		return
	
	if sequence_length == 0:
		# iniciar nueva secuencia
		rand = randi_range(3, 5)
		sequence_length = rand
		index = 0
		phase = 0
		phase_timer = 0.0
		visible = false
		return

	phase_timer += delta

	if phase_timer >= phase_durations[phase]:
		phase_timer = 0.0
		phase += 1

		if phase > 2:
			phase = 0
			index += 1
			if index >= sequence_length:
				# secuencia terminada, empieza espera
				visible = false
				waiting_between_sequences = true
				return

		if phase == 0:
			texture = staticsList[randi() % staticsList.size()]
			visible = true
		elif phase == 2:
			visible = false
