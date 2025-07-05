extends Area2D


func _on_area_entered(area):
	await get_tree().create_timer(10).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
