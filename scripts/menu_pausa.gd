extends Control

@onready var intentos_screen = $ColorRect/intentos_screen
@onready var pop_up_menu = $PopUpMenu
@onready var background = $Background


signal pressed_menu_pausa


func _ready():
	intentos_screen.text = "Llevas " + str(LEVELCORE.numero_de_intentos) + " intentos"
	
	
	#pop_up_menu.visible = false

func _on_menupausa_pressed():
	get_tree().paused = true
	pop_up_menu.visible = get_tree().paused
	background.visible = get_tree().paused
	pressed_menu_pausa.emit()

func _on_restart_pressed():
	get_tree().reload_current_scene()

func _on_resume_pressed():
	get_tree().paused = false
	$AnimationPaused.play("hide_paused")
	#pop_up_menu.visible = get_tree().paused
	background.visible = get_tree().paused

func _on_mainmenu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_levels_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/level_select_menu.tscn")


func _on_boton_pausa_pressed():
	#pop_up_menu.set_anchors_and_margins_preset(Control.PRESET_CENTER)
	#var screen_size = get_viewport().get_visible_rect().size
	#var menu_size = pop_up_menu.size  # o rect_size
	#pop_up_menu.position = (screen_size - menu_size) / 2
	#$MenuWrapper.set_anchors_preset(Control.PRESET_CENTER)
	#var screen_size = get_viewport_rect().size
	#var menu_size = $MenuWrapper.size
	#$MenuWrapper.position = (screen_size - menu_size) / 2
	#print ("resolucion actual en menu pausa " + str(screen_size))
	#print ("posicion actual del menu pausa: " + str($MenuWrapper.position))
	
	get_tree().paused = true
	$AnimationPaused.play("show_paused")
	#pop_up_menu.visible = get_tree().paused
	background.visible = get_tree().paused
	pressed_menu_pausa.emit()
