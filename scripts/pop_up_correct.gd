extends Control
#@onready var score_label = $VBoxContainer/score_label

func _ready():
	#score_label.text = "Has conseguido " + str(LEVELCORE.score_total) + " puntos"
	pass

func _on_menu_pressed():
	get_tree().paused = false
	LEVELCORE.save_data()
	get_tree().change_scene_to_file("res://scenes/level_select_menu.tscn")

func _on_nextlevel_pressed():
	get_tree().paused = false
	LEVELCORE.save_data()
	if LEVELCORE.nivel_actual == 1:
		get_tree().change_scene_to_file("res://scenes/lvl_2_intro.tscn")
	elif LEVELCORE.nivel_actual == 2:
		get_tree().change_scene_to_file("res://scenes/lvl_3_intro.tscn")
	elif LEVELCORE.nivel_actual == 3:
		get_tree().change_scene_to_file("res://scenes/lvl_4_intro.tscn")
	elif LEVELCORE.nivel_actual == 4:
		get_tree().change_scene_to_file("res://scenes/lvl_5_intro.tscn")
	elif LEVELCORE.nivel_actual == 5:
		get_tree().change_scene_to_file("res://scenes/lvl_6_intro.tscn")
	elif LEVELCORE.nivel_actual == 6:
		get_tree().change_scene_to_file("res://scenes/lvl_7_intro.tscn")
	elif LEVELCORE.nivel_actual == 7:
		get_tree().change_scene_to_file("res://scenes/lvl_8_intro.tscn")
	elif LEVELCORE.nivel_actual == 8:
		get_tree().change_scene_to_file("res://scenes/lvl_9_intro.tscn")
	elif LEVELCORE.nivel_actual == 9:
		get_tree().change_scene_to_file("res://scenes/lvl_10_intro.tscn")
	elif LEVELCORE.nivel_actual == 10:
		get_tree().change_scene_to_file("res://scenes/lvl_11.tscn")
	elif LEVELCORE.nivel_actual == 11:
		get_tree().change_scene_to_file("res://scenes/lvl_12.tscn")
	else:
		get_tree().paused = false
		get_tree().change_scene_to_file("res://scenes/level_select_menu.tscn")
		
