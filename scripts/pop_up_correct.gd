extends Control
#@onready var score_label = $VBoxContainer/score_label

func _ready():
	#score_label.text = "Has conseguido " + str(GLOBAL.score_total) + " puntos"
	pass

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select_menu.tscn")

func _on_nextlevel_pressed():
	get_tree().change_scene_to_file("res://scenes/lvl_1.tscn")
