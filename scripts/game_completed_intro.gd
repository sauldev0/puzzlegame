extends Control

func _ready():
	var timer := Timer.new()
	timer.wait_time = 6
	timer.one_shot = true
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/game_completed.tscn")  
