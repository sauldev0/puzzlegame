extends CanvasLayer


func _on_left_pressed():
	$HBoxContainer/left.modulate.a = 0.5

func _on_left_released():
	$HBoxContainer/left.modulate.a = 1

func _on_right_pressed():
	$HBoxContainer/right.modulate.a = 0.5

func _on_right_released():
	$HBoxContainer/right.modulate.a = 1

func _on_up_pressed():
	$HBoxContainer2/up.modulate.a = 0.5


func _on_up_released():
	$HBoxContainer2/up.modulate.a = 1


func _on_down_pressed():
	$HBoxContainer2/down.modulate.a = 0.5


func _on_down_released():
	$HBoxContainer2/down.modulate.a = 1
