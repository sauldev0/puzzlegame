extends Control

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_retry_pressed():
	get_tree().reload_current_scene()
