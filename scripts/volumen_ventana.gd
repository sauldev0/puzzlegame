extends Control

func _on_button_sound_effect_pressed():
	$SoundEffect.play()
	
func _on_button_music_pressed():
	$Music.play()
	


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/options.tscn")
