extends Control

@onready var intentos_screen = $ColorRect/intentos_screen


signal pressed_menu_pausa

func _ready():
	intentos_screen.text = "Llevas " + str(GLOBAL.numero_de_intentos) + " intentos"
	
	$pop_up_menu.visible = false

func _on_menupausa_pressed():
	get_tree().paused = true
	$pop_up_menu.visible = get_tree().paused
	pressed_menu_pausa.emit()

func _on_restart_pressed():
	get_tree().reload_current_scene()

func _on_resume_pressed():
	get_tree().paused = false
	$pop_up_menu.visible = get_tree().paused

func _on_mainmenu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_levels_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select_menu.tscn")
