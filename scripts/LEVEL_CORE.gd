extends Node

const SAVE_FILE = "user://savefile.dat"

var lvl1_completed = false
var lvl2_completed = false
var lvl3_completed = false

var data = {}

func _ready():
	load_data()
	
func save_data():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	data ={
		"lvl1_completed" = lvl1_completed,
		"lvl2_completed" = lvl2_completed,
		"lvl3_completed" = lvl3_completed
	}
	file.store_var(data)
	file = null
	
func load_data():
	if not FileAccess.file_exists(SAVE_FILE):
		data = {
			"lvl1_completed" = false,
			"lvl2_completed" = false,
			"lvl3_completed" = false
			}
		save_data()
		
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	data  = file.get_var()
	lvl1_completed = data.lvl1_completed
	lvl2_completed = data.lvl2_completed
	lvl3_completed = data.lvl3_completed
	file = null
	
