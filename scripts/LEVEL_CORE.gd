extends Node

const SAVE_FILE = "user://savefile.dat"
var quiz_resueltos = {}
var puede_usarse_boton_culpar := false
signal quiz_resuelto(npc_id)

func quiz_ya_resuelto(npc_id: String) -> bool:
	return quiz_resueltos.get(npc_id, false)

#Lvl6 funcionamiento
var letra_correcta
#Lvl6 funcionamiento

	
var player_name = ""
var nivel_actual = 0
var score_total = 0
var numero_de_intentos = 0
var puntuar_por_tiempo = false
var tiempo_final = 0.0
var ui_was_touched := false
var dialogo_activo 


var lvl1_completed = false
var lvl2_completed = false
var lvl3_completed = false
var lvl4_completed = false
var lvl5_completed = false
var lvl6_completed = false
var lvl7_completed = false
var lvl8_completed = false
var lvl9_completed = false
var lvl10_completed = false
var lvl11_completed = false
var lvl12_completed = false

var lvl1_stars = 0
var lvl2_stars = 0
var lvl3_stars = 0
var lvl4_stars = 0
var lvl5_stars = 0
var lvl6_stars = 0
var lvl7_stars = 0
var lvl8_stars = 0
var lvl9_stars = 0
var lvl10_stars = 0
var lvl11_stars = 0
var lvl12_stars = 0

var data = {}

func _ready():
	load_data()
	
func save_data():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	data ={
		"lvl1_completed" = lvl1_completed,
		"lvl2_completed" = lvl2_completed,
		"lvl3_completed" = lvl3_completed,
		"lvl4_completed" = lvl4_completed,
		"lvl5_completed" = lvl5_completed,
		"lvl6_completed" = lvl6_completed,
		"lvl7_completed" = lvl7_completed,
		"lvl8_completed" = lvl8_completed,
		"lvl9_completed" = lvl9_completed,
		"lvl10_completed" = lvl10_completed,
		"lvl11_completed" = lvl11_completed,
		"lvl12_completed" = lvl12_completed,
		
		"lvl1_stars" = lvl1_stars,
		"lvl2_stars" = lvl2_stars,
		"lvl3_stars" = lvl3_stars,
		"lvl4_stars" = lvl4_stars,
		"lvl5_stars" = lvl5_stars,
		"lvl6_stars" = lvl6_stars,
		"lvl7_stars" = lvl7_stars,
		"lvl8_stars" = lvl8_stars,
		"lvl9_stars" = lvl9_stars,
		"lvl10_stars" = lvl10_stars,
		"lvl11_stars" = lvl11_stars,
		"lvl12_stars" = lvl12_stars,
		
		"score_total" = score_total,
		"player_name" = player_name,
		
	}
	file.store_var(data)
	file = null
	
func load_data():
	if not FileAccess.file_exists(SAVE_FILE):
		data = {
			"lvl1_completed" = false,
			"lvl2_completed" = false,
			"lvl3_completed" = false,
			"lvl4_completed" = false,
			"lvl5_completed" = false,
			"lvl6_completed" = false,
			"lvl7_completed" = false,
			"lvl8_completed" = false,
			"lvl9_completed" = false,
			"lvl10_completed" = false,
			"lvl11_completed" = false,
			"lvl12_completed" = false,
			
			"lvl1_stars" = 0,
			"lvl2_stars" = 0,
			"lvl3_stars" = 0,
			"lvl4_stars" = 0,
			"lvl5_stars" = 0,
			"lvl6_stars" = 0,
			"lvl7_stars" = 0,
			"lvl8_stars" = 0,
			"lvl9_stars" = 0,
			"lvl10_stars" = 0,
			"lvl11_stars" = 0,
			"lvl12_stars" = 0,
			
			"score_total" = 0,
			"player_name" = "",
		
			
			}
		save_data()
		
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	data  = file.get_var()
	lvl1_completed = data.lvl1_completed
	lvl2_completed = data.lvl2_completed
	lvl3_completed = data.lvl3_completed
	lvl4_completed = data.lvl4_completed
	lvl5_completed = data.lvl5_completed
	lvl6_completed = data.lvl6_completed
	lvl7_completed = data.lvl7_completed
	lvl8_completed = data.lvl8_completed
	lvl9_completed = data.lvl9_completed
	lvl10_completed = data.lvl10_completed
	lvl11_completed = data.lvl11_completed
	lvl12_completed = data.lvl12_completed
	
	lvl1_stars = data.lvl1_stars
	lvl2_stars = data.lvl2_stars
	lvl3_stars = data.lvl3_stars
	lvl4_stars = data.lvl4_stars
	lvl5_stars = data.lvl5_stars
	lvl6_stars = data.lvl6_stars
	lvl7_stars = data.lvl7_stars
	lvl8_stars = data.lvl8_stars
	lvl9_stars = data.lvl9_stars
	lvl10_stars = data.lvl10_stars
	lvl11_stars = data.lvl11_stars
	lvl12_stars = data.lvl12_stars
	
	score_total = data.score_total
	player_name = data.player_name
	
	file = null
	
