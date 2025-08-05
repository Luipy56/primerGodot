extends Node

var level := 0
const SAVE_PATH := "user://save.dat"

func _ready():
	load_save()

func load_save():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		while not file.eof_reached():
			var line = file.get_line()
			var data = line.split("=")
			if data.size() == 2:
				match data[0]:
					"level":
						level = int(data[1])
		file.close()
	else:
		save()

func save(level=level):
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_line("level=%d" % level)
	file.close()
