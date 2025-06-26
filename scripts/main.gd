extends Control

func _ready():
	await get_tree().process_frame
	if LEVELCORE.player_name == "":
		get_tree().change_scene_to_file("res://scenes/player_name.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
