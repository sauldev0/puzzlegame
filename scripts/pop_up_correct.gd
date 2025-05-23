extends Control
#@onready var score_label = $VBoxContainer/score_label

func _ready():
	#score_label.text = "Has conseguido " + str(GLOBAL.score_total) + " puntos"
	pass

func _on_menu_pressed():
	get_tree().paused = false
	LEVELCORE.save_data()
	get_tree().change_scene_to_file("res://scenes/level_select_menu.tscn")

func _on_nextlevel_pressed():
	LEVELCORE.save_data()
	if GLOBAL.nivel_actual == 1:
		get_tree().change_scene_to_file("res://scenes/lvl_2.tscn")
	elif GLOBAL.nivel_actual == 2:
		get_tree().change_scene_to_file("res://scenes/lvl_9.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/level_select_menu.tscn")
		
