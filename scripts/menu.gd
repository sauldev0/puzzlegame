extends Control
@onready var score_screen = $score_screen

func _ready():
	get_tree().paused = false
	score_screen.text = "Fragmentos de puzzle reunidos: " + str(GLOBAL.score_total)

func _on_play_pressed():
	#if LEVELCORE.lvl1_completed == false:
		#get_tree().change_scene_to_file("res://scenes/lvl_1.tscn")
	#else:
	get_tree().change_scene_to_file("res://scenes/level_select_menu.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_quit_pressed():
	get_tree().quit()
